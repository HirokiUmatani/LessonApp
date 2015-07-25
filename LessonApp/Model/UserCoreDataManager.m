//
//  UserCoreDataManager.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/05.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "UserCoreDataManager.h"

@implementation UserCoreDataManager

#pragma mark - Insert
- (void)insertWithPredicate:(NSPredicate *)predicate
                  device_id:(NSString *)device_id
                       name:(NSString *)name
                       mail:(NSString *)mail
{
    __autoreleasing User                    *user;
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
        
        user = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([User class])
                                             inManagedObjectContext:managedObjectContext];
        
        update          = [NSObject stringFromDate:[NSDate date]];
        user.device_id  = device_id;
        user.name       = name;
        user.mail       = mail;
        user.create     = update;
        user.update     = update;
        
        [self save];
        [self reset:managedObjectContext];
    }
}

#pragma mark - Update
- (void)updateWithPredicate:(NSPredicate *)predicate
                       name:(NSString *)name
                       mail:(NSString *)mail
{
    __autoreleasing NSString                *update;
    __autoreleasing User                    *entity;
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
        
        update = [NSObject stringFromDate:[NSDate date]];
        for (entity in fetchDataLists)
        {
            if (name)
            {
                entity.name = name;
            }
            if (mail)
            {
                entity.mail = mail;
            }
            entity.update = update;
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
        
        for (User *user in fetchDataLists)
        {
            [managedObjectContext deleteObject:user];
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
        entity = [NSEntityDescription entityForName:NSStringFromClass([User class])
                             inManagedObjectContext:managedObjectContext];
        [request setEntity:entity];
        
        /*** Predicate ***/
        if (predicate)
        {
            [request setPredicate:predicate];
        }
        
        /*** Sort ***/
        updateSort = [NSSortDescriptor sortDescriptorWithKey:CONST_CORE_DATA_ENTITY_USER_UPDATE
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