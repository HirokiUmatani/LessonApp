//
//  DownLoadMovieCoreDataManager.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/26.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "DownLoadMovieCoreDataManager.h"
#import "DownLoadMovie.h"
@implementation DownLoadMovieCoreDataManager
#pragma mark - Insert
- (void)insertWithPredicate:(NSPredicate *)predicate
           moviePlayDirPath:(NSString *)moviePlayDirPath
{
    __autoreleasing DownLoadMovie           *entity;
    __autoreleasing NSString                *update;
    __autoreleasing NSArray                 *fetchDataLists;
    __autoreleasing NSManagedObjectContext  *managedObjectContext;
    @autoreleasepool
    {
        managedObjectContext = [CoreDataManager sharedInstance].managedObjectContext;
        
        /*** check ***/
        fetchDataLists = [self fetchWithPredicate:predicate];
        if (fetchDataLists.count > 0)
        {
            [self dataError];
            return;
        }
        
        entity = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([DownLoadMovie class])
                                             inManagedObjectContext:managedObjectContext];
        
        update                      = [NSString stringFromDate:[NSDate date]];
        entity.moviePlayDirPath     = moviePlayDirPath;
        entity.create               = update;
        entity.update               = update;
        
        [self save];
        [self reset:managedObjectContext];
    }
}

#pragma mark - Update
- (void)updateWithPredicate:(NSPredicate *)predicate
            downloadURLList:(NSData *)downloadURLList
              downloadCount:(NSNumber *)downloadCount
               downloadRait:(CGFloat)downloadRait
{
    __autoreleasing NSString                *update;
    __autoreleasing DownLoadMovie           *entity;
    __autoreleasing NSArray                 *fetchDataLists;
    __autoreleasing NSManagedObjectContext  *managedObjectContext;
    @autoreleasepool
    {
        managedObjectContext = [CoreDataManager sharedInstance].managedObjectContext;
        /*** check ***/
        fetchDataLists = [self fetchWithPredicate:predicate];
        if (fetchDataLists.count == 0)
        {
            [self dataError];
            return;
        }
        
        update = [NSString stringFromDate:[NSDate date]];
        for (entity in fetchDataLists)
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
    __autoreleasing NSArray                 *fetchDataLists;
    __autoreleasing NSManagedObjectContext  *managedObjectContext;
    __autoreleasing DownLoadMovie           *entity;
    @autoreleasepool
    {
        managedObjectContext = [CoreDataManager sharedInstance].managedObjectContext;
        
        /*** check ***/
        
        fetchDataLists = [self fetchWithPredicate:predicate];
        if (fetchDataLists.count == 0)
        {
            [self dataError];
            return;
        }
        
        for (entity in fetchDataLists)
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
    __autoreleasing NSPredicate             *predicate;
    
    @autoreleasepool
    {
        predicate = [NSPredicate predicateWithFormat:CONST_CORE_DATA_SEARCH,searchkey,searchValue];
        return predicate;
    }
}

#pragma mark - Fetch
- (NSArray *)fetchWithPredicate:(NSPredicate *)predicate
{
    __autoreleasing NSFetchRequest          *request;
    __autoreleasing NSEntityDescription     *entity;
    __autoreleasing NSSortDescriptor        *updateSort;
    __autoreleasing NSError                 *error;
    __autoreleasing NSArray                 *fetchDataLists;
    __autoreleasing NSManagedObjectContext  *managedObjectContext;
    @autoreleasepool
    {
        managedObjectContext = [CoreDataManager sharedInstance].managedObjectContext;
        request = [NSFetchRequest new];
        entity = [NSEntityDescription entityForName:NSStringFromClass([DownLoadMovie class])
                             inManagedObjectContext:managedObjectContext];
        [request setEntity:entity];
        
        /*** Predicate ***/
        if (predicate)
        {
            [request setPredicate:predicate];
        }
        
        /*** Sort ***/
        updateSort = [NSSortDescriptor sortDescriptorWithKey:@"update"
                                                   ascending:NO] ;
        NSArray *sortDescriptors = [NSArray arrayWithObjects:updateSort,nil];
        [request setSortDescriptors:sortDescriptors];
        
        /*** Error ***/
        fetchDataLists = [managedObjectContext executeFetchRequest:request error:&error];
        if (error)
        {
            [self fetchError];
        }
        return fetchDataLists;
    }
}

#pragma mark - Save
- (void)save
{
    __autoreleasing NSError                 *error;
    __autoreleasing NSManagedObjectContext  *managedObjectContext;
    @autoreleasepool
    {
        managedObjectContext = [CoreDataManager sharedInstance].managedObjectContext;
        BOOL boolean = [managedObjectContext save:&error];
        if (boolean)
        {
            return;
        }
        [self saveError];
    }
}

#pragma mark - Reset
- (void)reset:(NSManagedObjectContext *)managedObjectContext
{
    [managedObjectContext reset];
}

#pragma mark - Error
- (void)fetchError
{
    __autoreleasing NSError *error = nil;
    @autoreleasepool
    {
        error = @{CONST_CORE_DATA_ERROR:CONST_CORE_DATA_FETCH_ERROR}.copy;
        [Logger debugLogWithCategory:CONST_WARNING
                             message:nil
                            Function:__PRETTY_FUNCTION__
                                line:__LINE__];
    }
}

- (void)saveError
{
    __autoreleasing NSError *error = nil;
    @autoreleasepool
    {
        error = @{CONST_CORE_DATA_ERROR:CONST_CORE_DATA_SAVE_ERROR}.copy;
        [Logger debugLogWithCategory:CONST_WARNING
                             message:CONST_CORE_DATA_SAVE_ERROR
                            Function:__PRETTY_FUNCTION__
                                line:__LINE__];
    }
}

- (void)dataError
{
    __autoreleasing NSError *error = nil;
    @autoreleasepool
    {
        error = @{CONST_CORE_DATA_ERROR:CONST_CORE_DATA_FETCH_NO_DATA}.copy;
        [Logger debugLogWithCategory:CONST_WARNING
                             message:CONST_CORE_DATA_FETCH_NO_DATA
                            Function:__PRETTY_FUNCTION__
                                line:__LINE__];
    }
}
@end
