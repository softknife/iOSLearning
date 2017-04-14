//
//  HQDBHelper.m
//  testYap
//
//  Created by hjp on 16/10/26.
//  Copyright © 2016年 hengqian. All rights reserved.
//

#import "HQDBHelper.h"



static HQDBHelper *instanse_;

@implementation HQDBHelper
+ (instancetype)shareDBHelperWithPath:(NSString *)dbPath{
    instanse_ = [[self alloc] init];
    
    if (instanse_.yapDB == nil) {
        instanse_.yapDB = [[YapDatabase alloc] initWithPath:dbPath];
    }
    return instanse_;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instanse_ = [super allocWithZone:zone];
    });
    
    return instanse_;
}


+ (instancetype)helper
{
    return instanse_;
}

+ (YapDatabaseConnection *)creatRWConnection
{
    YapDatabaseConnection *conn = [instanse_.yapDB newConnection];
    conn.metadataCacheEnabled = NO;
    return conn;
}
+ (YapDatabaseConnection *)creatReadOnlyConnection
{
    YapDatabaseConnection *conn = [instanse_.yapDB newConnection];
    conn.metadataCacheEnabled = NO;
    conn.objectCacheLimit = 500;
    return conn;
}
@end
