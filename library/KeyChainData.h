//
//  KeyChainData.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/20.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@interface KeyChainData : NSObject
extern NSString * const CONST_UUID;
+ (void)setUUID;
+ (NSString *)getUUID;
@end
