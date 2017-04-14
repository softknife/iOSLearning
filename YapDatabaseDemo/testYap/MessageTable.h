//
//  MessageTable.h
//  testYap
//
//  Created by hjp on 16/10/26.
//  Copyright © 2016年 hengqian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageTable : NSObject

/** sessionID*/
@property (nonatomic , copy) NSString *sessionId;
/** msgId*/
@property (nonatomic , copy) NSString *messageId;
@property (nonatomic) NSTimeInterval creatTime; // 置顶时间，单位：秒级时间戳
/** 内容*/
@property (nonatomic , copy) NSString *content;


@end
