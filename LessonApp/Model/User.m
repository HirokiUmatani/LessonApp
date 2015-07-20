//
//  User.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/05.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "User.h"

NSString * const CONST_CORE_DATA_ENTITY_DEVICE_ID = @"device_id";
NSString * const CONST_CORE_DATA_ENTITY_USER_NAME = @"name";
NSString * const CONST_CORE_DATA_ENTITY_USER_MAIL = @"mail";
NSString * const CONST_CORE_DATA_ENTITY_USER_CREATE = @"create";
NSString * const CONST_CORE_DATA_ENTITY_USER_UPDATE = @"update";

@implementation User

@dynamic device_id;
@dynamic name;
@dynamic mail;
@dynamic create;
@dynamic update;
@end
