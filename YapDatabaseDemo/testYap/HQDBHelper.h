//
//  HQDBHelper.h
//  testYap
//
//  Created by hjp on 16/10/26.
//  Copyright © 2016年 hengqian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YapDatabase.h>

@interface HQDBHelper : NSObject
+ (instancetype)shareDBHelperWithPath:(NSString *)dbPath;
+ (HQDBHelper *)helper;
/** 数据库*/
@property (nonatomic , strong) YapDatabase *yapDB;

+ (YapDatabaseConnection *)creatRWConnection;
+ (YapDatabaseConnection *)creatReadOnlyConnection;
@end
