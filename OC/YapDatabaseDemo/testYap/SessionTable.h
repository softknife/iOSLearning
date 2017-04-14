//
//  SessionTable.h
//  testYap
//
//  Created by hjp on 16/10/26.
//  Copyright © 2016年 hengqian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MessageTable;
@interface SessionTable : NSObject
@property (nonatomic, copy) NSString *sessionId; // 会话的惟一标识(即单聊为对方的号码，多人聊天的会话的ID sgid)
@property (nonatomic, copy) NSString *sessionName; // 会话的名称（urldecoded）
/** 群头像服务器地址*/
@property (nonatomic , copy) NSString *avatarPath;

@property (nonatomic, copy) NSString *lastMsgId; // 发送到会话的最后一条消息ID

@property (nonatomic) NSInteger unreadTotal; // 未读消息总数
@property (nonatomic) BOOL isDelete; // 是否删除

@property (nonatomic) NSTimeInterval setTopTime; // 置顶时间，单位：秒级时间戳

@property (nonatomic, assign) BOOL isTop; // 是否置顶（0：代表没有置顶 1:代表置顶聊天）





//- (MessageTable *)getMessageTable;
//- (NSString *)getUnreadCount;
@end
