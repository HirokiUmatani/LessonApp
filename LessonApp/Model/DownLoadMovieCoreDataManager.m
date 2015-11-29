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

        return;
    }
    
    DownLoadMovieCoreDataEntity *entity = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([DownLoadMovieCoreDataEntity class])
                                         inManagedObjectContext:managedObjectContext];
    
    NSString * update           = [DateUnixTime convertStringFromDate:[NSDate date] outputFormat:@"yyyy/MM/dd HH:mm:ss"];
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

        return;
    }
    
    NSString *update = [DateUnixTime convertStringFromDate:[NSDate date] outputFormat:@"yyyy/MM/dd HH:mm:ss"];
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

#pragma mark - Predicate
- (NSPredicate *)setPredicateWithSearchKey:(NSString *)searchkey
                               searchValue:(id)searchValue
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K=%@",searchkey,searchValue];
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
    
}

#pragma mark - Reset
- (void)reset:(NSManagedObjectContext *)managedObjectContext
{
    [managedObjectContext reset];
}

@end
