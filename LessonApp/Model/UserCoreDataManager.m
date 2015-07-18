//
//  UserCoreDataManager.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/05.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "UserCoreDataManager.h"
@implementation UserCoreDataManager
#pragma mark - Life Cycle
- (id)init
{
    if (self = [super init])
    {
        [CoreDataManager sharedInstance];
    }
    return self;
}

#pragma mark - Fetch
- (NSArray *)fetchWithPredicate:(NSPredicate *)predicate
{
    NSFetchRequest *request = [NSFetchRequest new];
    NSEntityDescription *entity = [NSEntityDescription entityForName:NSStringFromClass([User class])
                                              inManagedObjectContext:self.managedObjectContext];
    [request setEntity:entity];

    /*** Predicate ***/
    if (predicate)
    {
        [request setPredicate:predicate];
    }

    /*** Sort ***/
    NSSortDescriptor *updateSort = [NSSortDescriptor sortDescriptorWithKey:CONST_CORE_DATA_ENTITY_USER_UPDATE
                                                                 ascending:NO] ;
    NSArray *sortDescriptors = [NSArray arrayWithObjects:updateSort,nil];
    [request setSortDescriptors:sortDescriptors];


    /*** Error ***/
    NSError *_fetchError = nil;
    NSArray * fetchDataLists = [self.managedObjectContext executeFetchRequest:request error:&_fetchError];
    if (fetchDataLists.count == 0)
    {
        [self dataError];
    }
    if (_fetchError)
    {
        [self fetchError];
    }
    return fetchDataLists;
}

#pragma mark - Insert
- (void)insertWithPredicate:(NSPredicate *)predicate
                       name:(NSString *)name
                       mail:(NSString *)mail
{
    NSArray *fetchDataLists = [self fetchWithPredicate:predicate];
    if (fetchDataLists.count > 0)
        return;
    
    User* entity = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([User class])
                                                 inManagedObjectContext:self.managedObjectContext];
    NSString *update = [NSObject stringFromDate:[NSDate date]];
    entity.name     = name;
    entity.mail     = mail;
    entity.create   = update;
    entity.update   = update;
    [self save];
}

#pragma mark - Update
- (void)updateWithPredicate:(NSPredicate *)predicate
                       name:(NSString *)name
                       mail:(NSString *)mail
{
    NSArray *fetchDataLists = [self fetchWithPredicate:predicate];
    if (fetchDataLists == 0)
        return;
    
    NSString *update = [NSObject stringFromDate:[NSDate date]];
    for (User *entity in fetchDataLists)
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
    }
    [self save];
}

#pragma mark - Delete
- (void)deleteWithPredicate:(NSPredicate *)predicate
{
    NSArray *fetchDataLists = [self fetchWithPredicate:predicate];
    if (fetchDataLists == 0)
        return;
    
    for (User *entity in fetchDataLists)
    {
        [self.managedObjectContext deleteObject:entity];
    }
    [self save];
}

#pragma mark -Predicate
- (NSPredicate *)setPredicateWithSearchKey:(NSString *)searchkey
                               searchValue:(id)searchValue
{
    return [NSPredicate predicateWithFormat:CONST_CORE_DATA_SEARCH,searchkey,searchValue];
}

#pragma mark - Error
- (void)fetchError
{
    NSError *fetchError = nil;
    fetchError = @{CONST_CORE_DATA_ERROR:CONST_CORE_DATA_FETCH_ERROR}.copy;
    [Logger debugLogWithCategory:CONST_WARNING
                         message:nil
                        Function:__PRETTY_FUNCTION__
                            line:__LINE__];
}

- (void)saveError
{
    NSError *saveError = nil;
    saveError = @{CONST_CORE_DATA_ERROR:CONST_CORE_DATA_SAVE_ERROR}.copy;
    [Logger debugLogWithCategory:CONST_WARNING
                         message:CONST_CORE_DATA_SAVE_ERROR
                        Function:__PRETTY_FUNCTION__
                            line:__LINE__];
}

- (void)dataError
{
    NSError *dataError = nil;
    dataError = @{CONST_CORE_DATA_ERROR:CONST_CORE_DATA_NO_DATA}.copy;
    [Logger debugLogWithCategory:CONST_WARNING
                         message:CONST_CORE_DATA_NO_DATA
                        Function:__PRETTY_FUNCTION__
                            line:__LINE__];
}

#pragma mark - Save
- (BOOL)save
{
    NSError *_saveError = nil;
    BOOL boolean = [self.managedObjectContext save:&_saveError];
    if (boolean)
    {
        return boolean;
    }
    
    [self saveError];
    return boolean;
}
@end