//
//  User.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/05.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

extern NSString * const CONST_CORE_DATA_ENTITY_USER_NAME;
extern NSString * const CONST_CORE_DATA_ENTITY_USER_MAIL;
extern NSString * const CONST_CORE_DATA_ENTITY_USER_CREATE;
extern NSString * const CONST_CORE_DATA_ENTITY_USER_UPDATE;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * mail;
@property (nonatomic, retain) NSString * create;
@property (nonatomic, retain) NSString * update;
@end
