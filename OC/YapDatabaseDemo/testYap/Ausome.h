//
//  Ausome.h
//  testYap
//
//  Created by hjp on 16/10/28.
//  Copyright © 2016年 hengqian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SessionTable,MessageTable;
@interface Ausome : NSObject
/** 模型数组*/
@property (nonatomic , strong) SessionTable  *session;
/** 模型数组*/
@property (nonatomic , strong) MessageTable *lastMessage;


/** 名字*/
@property (nonatomic , copy) NSString *sessionName;
/** path*/
@property (nonatomic , copy) NSString *avatarPath;
/** time*/
@property (nonatomic , copy) NSString *timeString;
/** 消息*/
@property (nonatomic , copy) NSString *messageDes;
/** 未读*/
@property (nonatomic , copy) NSString *unreadCount;

+ (instancetype)ausome;
@end
