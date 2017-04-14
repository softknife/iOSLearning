//
//  DetailDataSource.h
//  testYap
//
//  Created by hjp on 17/4/13.
//  Copyright © 2017年 hengqian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageTable.h"
#import "SessionTable.h"



@class DetailDataSource;
@protocol DetailDataSourceDelegate <NSObject>

- (void)detailViewDidReceiveData:(DetailDataSource *)datasource;

- (void)detailViewUpdateSessionData;
- (void)detailViewUpdateMessageData;
@end

@interface DetailDataSource : NSObject

+ (instancetype)dataSouceWithSessionId:(NSString *)sessionId delegate:(id<DetailDataSourceDelegate >)delegate;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

/** sessionId*/
@property (nonatomic , copy,readonly) NSString *sessionId;

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


/** 代理*/
@property (nonatomic , weak) id<DetailDataSourceDelegate> delegate;



- (void)change:(NSInteger)opt;

@end
