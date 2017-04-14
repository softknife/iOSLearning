//
//  AppDelegate.m
//  testYap
//
//  Created by hjp on 16/10/26.
//  Copyright © 2016年 hengqian. All rights reserved.
//

#import "AppDelegate.h"
#import "HQDBHelperHeader.h"
#import "SessionTable.h"
#import "MessageTable.h"
#import "Manager.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

+ (AppDelegate *)appDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *doc = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *dbPath = [doc stringByAppendingPathComponent:@"yaptest111.sqlite"];
    
    [HQDBHelper shareDBHelperWithPath:dbPath];

    
    [self parseData];
    return YES;
}


- (void)parseData
{
    NSString *sessionPath = [[NSBundle mainBundle] pathForResource:@"sessionTable.json" ofType:nil];
    NSData *sessionData = [NSData dataWithContentsOfFile:sessionPath options:NSDataReadingMappedIfSafe error:nil];
    NSArray *sessionDicArray = [NSJSONSerialization JSONObjectWithData:sessionData options:NSJSONReadingAllowFragments error:nil];
    
//    gid = 118165678543864832;
//    glogo = "http://fs.hengqian.net.cn:80/group1/M00/00/E8/CgowO1gO1HaASKJAAAAdHkC9JsI322.jpg|http://fs.hengqian.net.cn:80/group1/M00/00/E8/CgowO1gO1HaAW1UkAAAjJO5wAQA872.jpg";
//    gname = "天";
    
    YapDatabaseConnection *writeConnection = [HQDBHelper creatRWConnection];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self loopTest:100 dictArray:sessionDicArray conn:writeConnection];
    });
    
    
    NSString *messagePath = [[NSBundle mainBundle] pathForResource:@"message.json" ofType:nil];
    
    NSData *messageData = [NSData dataWithContentsOfFile:messagePath options:NSDataReadingMappedIfSafe error:nil];
    NSArray *messageDicArray = [NSJSONSerialization JSONObjectWithData:messageData options:NSJSONReadingMutableLeaves error:nil];
    
//    gid = 118346361641894912;
//    msgid = 118346361641891333;
//    content = "呵呵呵呵";
//    time = 1477445666;
    
    for (NSDictionary *messageDic in messageDicArray) {
        NSString *sessionId = messageDic[@"gid"];
        NSString *messageId = messageDic[@"msgid"];
        NSString *content = messageDic[@"content"];
        NSTimeInterval time = [messageDic[@"time"] doubleValue];
//        NSTimeInterval time = [Manager getCurrentSystemDateMillisecond];
        
        MessageTable *messageTable = [[MessageTable alloc] init];
        messageTable.sessionId = sessionId;
        messageTable.messageId = messageId;
        messageTable.content = content;
        messageTable.creatTime = time;
        
        NSLog(@"messageTime%lf",time);
        [writeConnection asyncReadWriteWithBlock:^(YapDatabaseReadWriteTransaction * _Nonnull transaction) {
            
            [transaction setObject:messageTable forKey:messageId inCollection:NSStringFromClass([MessageTable class])];
            
            SessionTable *session = [transaction objectForKey:sessionId inCollection:NSStringFromClass([SessionTable class])];
            if (session == nil) {
                session = [SessionTable new];
                session.sessionId = sessionId;
            }
            session.lastMsgId = messageId;
            session.setTopTime = [Manager getCurrentSystemDateMillisecond];
            [transaction setObject:session forKey:sessionId inCollection:NSStringFromClass([SessionTable class])];

        }];
        
    }
}

- (void)loopTest:(NSInteger)times dictArray:(NSArray *)sessionDicArray conn:(YapDatabaseConnection *)writeConnection
{
    NSInteger repeats = times;
    while (repeats) {
        
        
        for (NSDictionary *sessionDic in sessionDicArray) {
            
            NSString *sessionId = sessionDic[@"gid"];
            NSString *avatarPath = sessionDic[@"glogo"];
            NSString *groupName = sessionDic[@"gname"];
            BOOL isTop = [sessionDic[@"isTop"] boolValue];

            
            
            
//            [writeConnection readWriteWithBlock:^(YapDatabaseReadWriteTransaction * _Nonnull transaction) {
//                [transaction setObject:sessionTable forKey:sessionId inCollection:NSStringFromClass([sessionTable class])];
//            }];
//            
            [writeConnection asyncReadWriteWithBlock:^(YapDatabaseReadWriteTransaction * _Nonnull transaction) {
                
                SessionTable *sessionTable = [transaction objectForKey:sessionId inCollection:NSStringFromClass([SessionTable class])];
                
                if (sessionTable == nil) {
                    sessionTable = [[SessionTable alloc] init];
                    sessionTable.sessionId = sessionId;

                }
                
                sessionTable.avatarPath = avatarPath;
                sessionTable.sessionName = groupName;
                sessionTable.isDelete = NO;
                NSTimeInterval time = [Manager getCurrentSystemDateMicrosecond];
                sessionTable.setTopTime = time;
                sessionTable.unreadTotal = arc4random_uniform(100)/2;
                sessionTable.isTop = isTop;
                
                NSLog(@"name:%@,time:%lf,setTopTime:%lf",groupName,time,sessionTable.setTopTime);

                [transaction setObject:sessionTable forKey:sessionId inCollection:NSStringFromClass([sessionTable class])];
            }];
        }
        repeats--;
    }
    
}



@end
