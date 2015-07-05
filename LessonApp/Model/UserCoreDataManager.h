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
typedef void (^CoreDataFinished)(BOOL finished);
typedef void (^CoreDataFetchSuccess)(NSArray *fetchdataLists);
typedef void (^CoreDataFetchFailed)(NSError *error);

- (void)fetchEntityListWithPredicate:(NSPredicate *)predicate
                          fetchLists:(CoreDataFetchSuccess)fetchLists
                          fetchError:(CoreDataFetchFailed)fetchError;

- (void)insertEntityWithName:(NSString *)name
                        mail:(NSString *)mail
                      create:(NSString *)create
                      update:(NSString *)update
                      finish:(CoreDataFinished)finished;
@end
