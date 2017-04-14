//
//  DetailDataSource.m
//  testYap
//
//  Created by hjp on 17/4/13.
//  Copyright © 2017年 hengqian. All rights reserved.
//

#import "DetailDataSource.h"
#import "HQDBHelper+Ausome.h"
#import "Manager.h"
#import "SessionTable.h"
#import "MessageTable.h"
#import "Ausome.h"
#import <YapDatabaseView.h>
#import <YapDatabaseSecondaryIndex.h>


@interface DetailDataSource ()
/** uiConnection*/
@property (nonatomic , strong) YapDatabaseConnection *connection;
@end
@implementation DetailDataSource

+ (instancetype)dataSouceWithSessionId:(NSString *)sessionId delegate:(id<DetailDataSourceDelegate >)delegate
{
    return [[self alloc] __initWithSessionId:sessionId delegate:delegate];
}

- (instancetype)__initWithSessionId:(NSString *)sessionId delegate:(id<DetailDataSourceDelegate >)delegate
{
    if (self = [super init]) {
        
        self->_sessionId = sessionId;
        self.delegate = delegate;
        self.connection = [HQDBHelper creatReadOnlyConnection];
        [self configDataMaping];
        
    }
    
    return self;
}

// 配置mapping
- (void)configDataMaping
{
    [self loadData];
    
    [self.connection beginLongLivedReadTransaction];
 
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(databaseModified:) name:YapDatabaseModifiedNotification object:[HQDBHelper helper].yapDB];
    
  
}


#pragma mark - Initial data
- (void)loadData
{
    __weak typeof(self) weakself = self;
    [self.connection readWithBlock:^(YapDatabaseReadTransaction * _Nonnull transaction) {
        
        [weakself reloadDataWithTransaction:transaction];
    }];
    
}


- (void)reloadDataWithTransaction:(YapDatabaseReadTransaction *)transaction
{
    self.session = [transaction objectForKey:self.sessionId inCollection:NSStringFromClass([SessionTable class])];
    
    self.lastMessage = [transaction objectForKey:self.session.lastMsgId inCollection:NSStringFromClass([MessageTable class])];
    
    [self.delegate detailViewDidReceiveData:self];

}


#pragma mark - Modify

- (void)databaseModified:(NSNotification *)notification
{
    NSArray *notifications = [self.connection beginLongLivedReadTransaction];
    if (notifications.count == 0) {
        
        return;
    }
    
    // Update views if needed
    if ([self.connection hasChangeForKey:self.session.sessionId inCollection:NSStringFromClass([SessionTable class]) inNotifications:notifications]) {
        
        [self updateSessionView];
    }
    
    // Update views if needed
    if ([self.connection hasChangeForKey:self.lastMessage.messageId inCollection:NSStringFromClass([MessageTable class]) inNotifications:notifications]) {
        
        [self updateMessageView];
    }
    
    
}


- (void)updateSessionView
{

    __weak typeof(self) weakself = self;
    [self.connection asyncReadWithBlock:^(YapDatabaseReadTransaction * _Nonnull transaction) {
        
        weakself.session = [transaction objectForKey:weakself.sessionId inCollection:NSStringFromClass([SessionTable class])];

        dispatch_async(dispatch_get_main_queue(), ^{
            [weakself.delegate detailViewUpdateSessionData];
            
        });
    }];
    
}

- (void)updateMessageView
{
    
    __weak typeof(self) weakself = self;
    [self.connection asyncReadWithBlock:^(YapDatabaseReadTransaction * _Nonnull transaction) {
        
        weakself.lastMessage = [transaction objectForKey:weakself.lastMessage.messageId inCollection:NSStringFromClass([MessageTable class])];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakself.delegate detailViewUpdateMessageData];

        });

        
    }];
    
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:YapDatabaseModifiedNotification object:[HQDBHelper helper].yapDB];
}

- (void)change:(NSInteger)opt
{
    
    __weak typeof(self) weakself = self;

    [[HQDBHelper creatRWConnection] asyncReadWriteWithBlock:^(YapDatabaseReadWriteTransaction * _Nonnull transaction) {
        
        SessionTable *newSession = [transaction objectForKey:weakself.session.sessionId inCollection:NSStringFromClass([SessionTable class])];

        switch (opt) {
            case 1:
            {
                
                newSession.sessionName = [NSString stringWithFormat:@"我改了名字%zd",arc4random_uniform(100)];
                newSession.setTopTime = [Manager getCurrentSystemDateSecond];
                [transaction setObject:newSession forKey:newSession.sessionId inCollection:NSStringFromClass([SessionTable class])];

            }
                break;
                
            case 2:{
               
                MessageTable *newMessage = [transaction objectForKey:weakself.lastMessage.messageId inCollection:NSStringFromClass([MessageTable class])];

                
                newMessage.content = [NSString stringWithFormat:@"修改消息%zd",arc4random_uniform(10000)];
                newMessage.creatTime = [Manager getCurrentSystemDateSecond];
                [transaction setObject:newMessage forKey:newMessage.messageId inCollection:NSStringFromClass([MessageTable class])];
                
               
                
               

            }
                break;
            case 3:{
                [weakself modifySessionTableMultiThreadBySessionTable:newSession];
            }
                break;
       
            default:
                break;
        }
        

    }];
    
}

- (void)modifySessionTableMultiThreadBySessionTable:(SessionTable *)sessionTable
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 可见模型可以跨线程传递，transaction不行！
        [[HQDBHelper creatRWConnection] asyncReadWriteWithBlock:^(YapDatabaseReadWriteTransaction * _Nonnull transaction) {
            NSLog(@"测试model跨线程问题：%@",sessionTable.sessionName);
            
            sessionTable.sessionName = [NSString stringWithFormat:@"我改了名字%zd",arc4random_uniform(100)];
            sessionTable.setTopTime = [Manager getCurrentSystemDateSecond];
            [transaction setObject:sessionTable forKey:sessionTable.sessionId inCollection:NSStringFromClass([SessionTable class])];

        }];
        
    });
}



#pragma mark - ConfigData
- (void)setSession:(SessionTable *)session
{
    _session = session;
    

    [self configName];
    [self configAvatarPath];
    
}

- (void)setLastMessage:(MessageTable *)lastMessage
{
    _lastMessage = lastMessage;
    
    [self configTimeString];
    [self configMessageDescription];
}



- (void)configName
{
    self.sessionName = self.session.sessionName;
    
}
- (void)configAvatarPath
{
    self.avatarPath = self.session.avatarPath;
}
- (void)configMessageDescription
{
    self.messageDes = self.lastMessage.content;
}
- (void)configTimeString
{
    self.timeString = [NSString stringWithFormat:@"%lf",self.lastMessage.creatTime];
}


@end
