//
//  SessionTable.m
//  testYap
//
//  Created by hjp on 16/10/26.
//  Copyright © 2016年 hengqian. All rights reserved.
//

#import "SessionTable.h"
#import "Manager.h"
#import <YapDatabaseSecondaryIndex.h>
#import <YapDatabase.h>
#import <NSObject+MJCoding.h>

@implementation SessionTable
//MJCodingImplementation
- (id)initWithCoder:(NSCoder *)decoder // NSCoding deserialization
{
    if ((self = [super init])) {
        
        int32_t version = [decoder decodeInt32ForKey:@"version"];
        
        NSLog(@"version=%zd",version);
        
        
        _sessionId = [decoder decodeObjectForKey:@"sessionId"];
        _sessionName = [decoder decodeObjectForKey:@"sessionName"];
        _avatarPath = [decoder decodeObjectForKey:@"avatarPath"];
        _lastMsgId = [decoder decodeObjectForKey:@"lastMsgId"];
        
        _unreadTotal = [decoder decodeIntegerForKey:@"unreadTotal"];
        _isDelete = [decoder decodeBoolForKey:@"isDelete"];
        _setTopTime = [decoder decodeDoubleForKey:@"setTopTime"];
        _isTop = [decoder decodeBoolForKey:@"isTop"];
        
        // Migration
        if (version == 1) {
            // do some thing
        }else if (version == 2){
            // do other thing
            
        }
    }
    return self;
}
//
- (void)encodeWithCoder:(NSCoder *)encoder // NSCoding serialization
{
    [encoder encodeInt32:2 forKey:@"version"];
    
    [encoder encodeObject:_lastMsgId forKey:@"lastMsgId"];
    [encoder encodeObject:_avatarPath forKey:@"avatarPath"];
    [encoder encodeObject:_sessionName forKey:@"sessionName"];
    [encoder encodeObject:_sessionId forKey:@"sessionId"];
    
    [encoder encodeInteger:_unreadTotal forKey:@"unreadTotal"];
    [encoder encodeBool:_isDelete forKey:@"isDelete"];
    [encoder encodeDouble:_setTopTime forKey:@"setTopTime"];
    [encoder encodeBool:_isTop forKey:@"isTop"];
}


@end
