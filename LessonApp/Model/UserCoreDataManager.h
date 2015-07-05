//
//  UserCoreDataManager.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/05.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "CoreDataManager.h"
#import "User.h"
@interface UserCoreDataManager : CoreDataManager
- (NSArray *)fetchEntityListWithPredicate:(NSPredicate *)predicate;

- (BOOL)insertEntityWithName:(NSString *)name
                        mail:(NSString *)mail;
@end
