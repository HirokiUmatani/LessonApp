//
//  DownLoadMovieCoreDataManager.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/26.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "DownLoadMovieCoreDataManager.h"
@implementation DownLoadMovieCoreDataManager
#pragma mark - Insert
- (void)insertWithPredicate:(NSPredicate *)predicate
           moviePlayDirPath:(NSString *)moviePlayDirPath
{    
    NSManagedObjectContext *managedObjectContext = [CoreDataManager sharedInstance].managedObjectContext;
    
    /*** check ***/
    NSArray *fetchDataLists = [self fetchWithPredicate:predicate];
    if (fetchDataLists.count > 0)
    {
        [self dataError];
        return;
    }
    
    DownLoadMovieCoreDataEntity *entity = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([DownLoadMovieCoreDataEntity class])
                                         inManagedObjectContext:managedObjectContext];
    
    NSString * update           = [NSString stringFromDate:[NSDate date]];
    entity.moviePlayDirPath     = moviePlayDirPath;
    entity.create               = update;
    entity.update               = update;
    [self save];
    [self reset:managedObjectContext];

}

#pragma mark - Update
- (void)updateWithPredicate:(NSPredicate *)predicate
            downloadURLList:(NSData *)downloadURLList
              downloadCount:(NSNumber *)downloadCount
               downloadRait:(CGFloat)downloadRait
{
    NSManagedObjectContext *managedObjectContext = [CoreDataManager sharedInstance].managedObjectContext;
    /*** check ***/
    NSArray *fetchDataLists = [self fetchWithPredicate:predicate];
    if (fetchDataLists.count == 0)
    {
        [self dataError];
        return;
    }
    
    NSString *update = [NSString stringFromDate:[NSDate date]];
    for (DownLoadMovieCoreDataEntity *entity in fetchDataLists)
    {
        @autoreleasepool
        {
            if (downloadURLList)
            {
                entity.downloadURLList  = downloadURLList;
            }
            if (downloadCount)
            {
                entity.downloadCount    = downloadCount;
            }
            if (downloadRait)
            {
                entity.downloadRait     = downloadRait;
            }
            entity.update               = update;
            [self save];
            [self reset:managedObjectContext];
        }
    }
}

#pragma mark - Delete
- (void)deleteWithPredicate:(NSPredicate *)predicate
{
    NSManagedObjectContext *managedObjectContext = [CoreDataManager sharedInstance].managedObjectContext;
    /*** check ***/
    
    NSArray *fetchDataLists = [self fetchWithPredicate:predicate];
    if (fetchDataLists.count == 0)
    {
        [self dataError];
        return;
    }
    
    for (DownLoadMovieCoreDataEntity *entity in fetchDataLists)
    {
        @autoreleasepool
        {
            [managedObjectContext deleteObject:entity];
            [self save];
            [self reset:managedObjectContext];
        }
    }
}

#pragma mark -Predicate
- (NSPredicate *)setPredicateWithSearchKey:(NSString *)searchkey
                               searchValue:(id)searchValue
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:CONST_CORE_DATA_SEARCH,searchkey,searchValue];
    return predicate;
}

#pragma mark - Fetch
- (NSArray *)fetchWithPredicate:(NSPredicate *)predicate
{
    NSManagedObjectContext *managedObjectContext = [CoreDataManager sharedInstance].managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest new];
    NSEntityDescription *entity = [NSEntityDescription entityForName:NSStringFromClass([DownLoadMovieCoreDataEntity class])
                         inManagedObjectContext:managedObjectContext];
    [request setEntity:entity];
    
    /*** Predicate ***/
    if (predicate)
    {
        [request setPredicate:predicate];
    }
    
    /*** Sort ***/
    NSSortDescriptor *updateSort = [NSSortDescriptor sortDescriptorWithKey:@"update"
                                               ascending:NO] ;
    NSArray *sortDescriptors = [NSArray arrayWithObjects:updateSort,nil];
    [request setSortDescriptors:sortDescriptors];
    
    /*** Error ***/
    NSError *error;
    NSArray *fetchDataLists = [managedObjectContext executeFetchRequest:request error:&error];
    if (error)
    {
        [self fetchError];
    }
    return fetchDataLists;
}

#pragma mark - Save
- (void)save
{
    NSError *error;
    NSManagedObjectContext *managedObjectContext = [CoreDataManager sharedInstance].managedObjectContext;
    BOOL boolean = [managedObjectContext save:&error];
    if (boolean)
    {
        return;
    }
    [self saveError];
    
}

#pragma mark - Reset
- (void)reset:(NSManagedObjectContext *)managedObjectContext
{
    [managedObjectContext reset];
}

#pragma mark - Error
- (void)fetchError
{
    NSError *error = @{CONST_CORE_DATA_ERROR:CONST_CORE_DATA_FETCH_ERROR}.copy;
    [Logger debugLogWithCategory:CONST_WARNING
                         message:error
                        Function:__PRETTY_FUNCTION__
                            line:__LINE__];
}

- (void)saveError
{
    NSError *error = @{CONST_CORE_DATA_ERROR:CONST_CORE_DATA_SAVE_ERROR}.copy;
    [Logger debugLogWithCategory:CONST_WARNING
                         message:error
                        Function:__PRETTY_FUNCTION__
                            line:__LINE__];
}

- (void)dataError
{
    NSError *error = @{CONST_CORE_DATA_ERROR:CONST_CORE_DATA_FETCH_NO_DATA}.copy;
    [Logger debugLogWithCategory:CONST_WARNING
                         message:error
                        Function:__PRETTY_FUNCTION__
                            line:__LINE__];

}
@end
