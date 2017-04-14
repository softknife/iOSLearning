//
//  Ausome.m
//  testYap
//
//  Created by hjp on 16/10/28.
//  Copyright © 2016年 hengqian. All rights reserved.
//

#import "Ausome.h"
#import "MessageTable.h"
#import "SessionTable.h"

@implementation Ausome

+ (instancetype)ausome
{
    return [[self alloc] init];
}

//- (void)dealloc
//{
//    [self.session removeObserver:self forKeyPath:@"unreadTotal"];
//    [self.session removeObserver:self forKeyPath:@"setTopTime"];
//}

- (void)setSession:(SessionTable *)session
{
    _session = session;
    
    
//    if (session) {
//        [session addObserver:self forKeyPath:@"setTopTime" options:NSKeyValueObservingOptionNew context:nil];
//        [session addObserver:self forKeyPath:@"unreadTotal" options:NSKeyValueObservingOptionNew context:nil];
//
//    }
    [self configName];
    [self configAvatarPath];
    [self configUnreadCount];
    
}

- (void)setLastMessage:(MessageTable *)lastMessage
{
    _lastMessage = lastMessage;
    
    [self configTimeString];
    [self configMessageDescription];
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
//{
//
//    if ([object isEqual:self.session] ) {
//        
//        if ([keyPath isEqualToString:@"unreadTotal"]) {
//            [self configUnreadCount];
//        }
//       
//    }
//}

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
- (void)configUnreadCount
{
    self.unreadCount = [NSString stringWithFormat:@"%zd",self.session.unreadTotal];
}
@end
