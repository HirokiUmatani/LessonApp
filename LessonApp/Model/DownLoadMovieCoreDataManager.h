//
//  DownLoadMovieCoreDataManager.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/26.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "DownLoadMovieCoreDataEntity.h"
@interface DownLoadMovieCoreDataManager : NSObject
- (void)insertWithPredicate:(NSPredicate *)predicate
           moviePlayDirPath:(NSString *)moviePlayDirPath;

- (void)updateWithPredicate:(NSPredicate *)predicate
            downloadURLList:(NSData *)downloadURLList
              downloadCount:(NSNumber *)downloadCount
               downloadRait:(CGFloat)downloadRait;

- (void)deleteWithPredicate:(NSPredicate *)predicate;

- (NSArray *)fetchWithPredicate:(NSPredicate *)predicate;

- (NSPredicate *)setPredicateWithSearchKey:(NSString *)searchkey
                               searchValue:(id)searchValue;
@end
