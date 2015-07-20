//
//  KeyChainData.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/20.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "KeyChainData.h"
#import "LUKeychainAccess.h"
@implementation KeyChainData

NSString * const CONST_UUID = @"UUID";

+ (void)setUUID
{
    if ([[LUKeychainAccess standardKeychainAccess]stringForKey:CONST_UUID])
        return;
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    [[LUKeychainAccess standardKeychainAccess] setString:uuid forKey:CONST_UUID];
}

+ (NSString *)getUUID
{
    return [[LUKeychainAccess standardKeychainAccess] stringForKey:CONST_UUID];
}
@end
