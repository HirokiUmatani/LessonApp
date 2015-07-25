//
//  UserCoreDataManager.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/05.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "CoreDataManager.h"
#import "User.h"

@interface UserCoreDataManager : NSObject

- (void)insertWithPredicate:(NSPredicate *)predicate
                  device_id:(NSString *)device_id
                       name:(NSString *)name
                       mail:(NSString *)mail;

- (void)updateWithPredicate:(NSPredicate *)predicate
                       name:(NSString *)name
                       mail:(NSString *)mail;

- (void)deleteWithPredicate:(NSPredicate *)predicate;

- (NSArray *)fetchWithPredicate:(NSPredicate *)predicate;

- (NSPredicate *)setPredicateWithSearchKey:(NSString *)searchkey
                               searchValue:(id)searchValue;

@end
