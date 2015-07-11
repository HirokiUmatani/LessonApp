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

typedef void (^CoreDataFetchSuccess)(NSArray *fetchdataLists);
typedef void (^CoreDataInsertSuccess)(void);
typedef void (^CoreDataUpdateSuccess)(void);
typedef void (^CoreDataDeleteSuccess)(void);
typedef void (^CoreDataFailed)(NSError *error);

- (void)fetchWithPredicate:(NSPredicate *)predicate
                   success:(CoreDataFetchSuccess)success
                     error:(CoreDataFailed)error;

- (void)insertWithName:(NSString *)name
                  mail:(NSString *)mail
               success:(CoreDataInsertSuccess)success
                 error:(CoreDataFailed)error;

- (void)updateWithPredicate:(NSPredicate *)predicate
                       name:(NSString *)name
                       mail:(NSString *)mail
                    success:(CoreDataUpdateSuccess)success
                      error:(CoreDataFailed)error;

- (void)deleteWithPredicate:(NSPredicate *)predicate
                    success:(CoreDataDeleteSuccess)success
                      error:(CoreDataFailed)error;

- (NSPredicate *)setPredicateWithSearchKey:(NSString *)searchkey
                               searchValue:(id)searchValue;

- (void)coreDataLog:(NSArray *)fetchdataLists;
@end
