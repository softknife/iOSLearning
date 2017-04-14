//
//  HQDBHelper+Ausome.m
//  testYap
//
//  Created by hjp on 16/10/26.
//  Copyright © 2016年 hengqian. All rights reserved.
//

#import "HQDBHelper+Ausome.h"

#import <YapDatabaseView.h>
#import <YapDatabaseSecondaryIndex.h>
#import "MessageTable.h"
#import "SessionTable.h"


@implementation HQDBHelper (Ausome)

// 页面数据grouping sorting
+ (void)pre_GroupSortDataSourceForAusomeView:(NSString *)viewName
{
    
    // grouping
    YapDatabaseViewGrouping *group = [YapDatabaseViewGrouping withObjectBlock:^NSString * _Nullable(YapDatabaseReadTransaction * _Nonnull transaction, NSString * _Nonnull collection, NSString * _Nonnull key, id  _Nonnull object) {
        
        NSString *groupName = nil;
        
        if ([object isKindOfClass:[SessionTable class]]) {
            
            __unsafe_unretained SessionTable *session = (SessionTable *)object;
            
            if (session.isDelete == NO) {
                groupName = NSStringFromClass([SessionTable class]);
            }
        }
        
        
        return groupName;
    }];
    
    // sorting
    YapDatabaseViewSorting *sort = [YapDatabaseViewSorting withOptions:YapDatabaseBlockInvokeIfObjectModified objectBlock:^NSComparisonResult(YapDatabaseReadTransaction * _Nonnull transaction, NSString * _Nonnull group, NSString * _Nonnull collection1, NSString * _Nonnull key1, id  _Nonnull object1, NSString * _Nonnull collection2, NSString * _Nonnull key2, id  _Nonnull object2) {
        
        __unsafe_unretained SessionTable *session1 = object1;
        __unsafe_unretained SessionTable *session2 = object2;
        
        BOOL same = session1.isTop == session2.isTop;
        
        NSComparisonResult topResult = NSOrderedSame;
        if (same) {
            topResult = session1.setTopTime < session2.setTopTime? NSOrderedDescending:NSOrderedAscending;
        }else{
            topResult = session1.isTop < session2.isTop?NSOrderedDescending:NSOrderedAscending;
        }
        
        return topResult;
    }];
    
    
    YapDatabaseView *view = [[YapDatabaseView alloc] initWithGrouping:group sorting:sort versionTag:@"1.0"];
    
    // 1.RegisterView
    [[self helper].yapDB registerExtension:view withName:viewName];
    
    
    // SecondaryIndexSetUp
    YapDatabaseSecondaryIndexSetup *setup = [YapDatabaseSecondaryIndexSetup new];
    [setup addColumn:@"messageId" withType:YapDatabaseSecondaryIndexTypeText];
    [setup addColumn:@"sessionId" withType:YapDatabaseSecondaryIndexTypeText];
    
    // SecondaryIndexHandler
    YapDatabaseSecondaryIndexHandler *handler = [YapDatabaseSecondaryIndexHandler withObjectBlock:^(YapDatabaseReadTransaction * _Nonnull transaction, NSMutableDictionary * _Nonnull dict, NSString * _Nonnull collection, NSString * _Nonnull key, id  _Nonnull object) {
        
        if ([object isKindOfClass:[MessageTable class]]) {
            
            MessageTable *message = (MessageTable *)object;
            dict[@"messageId"] = message.messageId;
            dict[@"sessionId"] = message.sessionId;
        }
    }];
    
    // SecondaryIndex
    YapDatabaseSecondaryIndex *index = [[YapDatabaseSecondaryIndex alloc] initWithSetup:setup handler:handler];

    // 2.RegisterIndex
    [[self helper].yapDB registerExtension:index withName:NSStringFromClass([MessageTable class])];
}





@end
