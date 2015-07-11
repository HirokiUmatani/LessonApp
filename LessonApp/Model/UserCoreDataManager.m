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
- (void)fetchWithPredicate:(NSPredicate *)predicate
                   success:(CoreDataFetchSuccess)success
                     error:(CoreDataFailed)error
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
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^
    {
        NSError *_fetchError = nil;
        NSArray * dataLists = [self.managedObjectContext executeFetchRequest:request error:&_fetchError];
        
        if (_fetchError)
        {
            [self fetchError:_fetchError];
            error(_fetchError);
        }
        else
        {
            if (dataLists.count == 0)
            {
                error([self dataError]);
            }
            else
            {
                success(dataLists);
            }
        }
    });
}

#pragma mark - Insert
- (void)insertWithName:(NSString *)name
                  mail:(NSString *)mail
               success:(CoreDataInsertSuccess)success
                 error:(CoreDataFailed)error
{
    User* entity = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([User class])
                                                 inManagedObjectContext:self.managedObjectContext];
    NSString *update = [NSObject stringFromDate:[NSDate date]];
    entity.name     = name;
    entity.mail     = mail;
    entity.create   = update;
    entity.update   = update;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^
    {
        NSError *_saveError = nil;
        BOOL boolean = [self.managedObjectContext save:&_saveError];
        if (!boolean)
        {
            error([self saveError]);
        }
        else
        {
            success();
        }
    });
}

#pragma mark - Update
- (void)updateWithPredicate:(NSPredicate *)predicate
                       name:(NSString *)name
                       mail:(NSString *)mail
                    success:(CoreDataUpdateSuccess)success
                      error:(CoreDataFailed)error
{
    [self fetchWithPredicate:predicate
                     success:^(NSArray *fetchdataLists)
     {
         NSString *update = [NSObject stringFromDate:[NSDate date]];
         for (User *entity in fetchdataLists)
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
         dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^
         {
             NSError *_saveError = nil;
             BOOL boolean = [self.managedObjectContext save:&_saveError];
             if (!boolean)
             {
                 error([self saveError]);
             }
             else
             {
                 success();
             }
         });
         
     }
                       error:^(NSError *_fetchError)
     {
         error(_fetchError);
     }];
}

#pragma mark - Delete
- (void)deleteWithPredicate:(NSPredicate *)predicate
                    success:(CoreDataDeleteSuccess)success
                      error:(CoreDataFailed)error
{
    [self fetchWithPredicate:predicate
                     success:^(NSArray *fetchdataLists)
    {
        for (User *entity in fetchdataLists)
        {
            [self.managedObjectContext deleteObject:entity];
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^
        {
            NSError *_saveError = nil;
            BOOL boolean = [self.managedObjectContext save:&_saveError];
            if (!boolean)
            {
                error([self saveError]);
            }
            else
            {
                success();
            }
        });
    }
                       error:^(NSError *_fetchError)
    {
        error(_fetchError);
    }];
    
}

#pragma mark -Predicate
- (NSPredicate *)setPredicateWithSearchKey:(NSString *)searchkey
                               searchValue:(id)searchValue
{
    return [NSPredicate predicateWithFormat:CONST_CORE_DATA_SEARCH,searchkey,searchValue];
}

#pragma mark - Error
- (NSError *)fetchError:(NSError *)fetchError
{
    [Logger debugLogWithCategory:CONST_WARNING
                         message:fetchError
                        Function:__PRETTY_FUNCTION__
                            line:__LINE__];
    return fetchError;
}
- (NSError *)saveError
{
    NSError *saveError = nil;
    saveError = @{CONST_CORE_DATA_ERROR:CONST_CORE_DATA_SAVE_ERROR}.copy;
    [Logger debugLogWithCategory:CONST_WARNING
                         message:CONST_CORE_DATA_SAVE_ERROR
                        Function:__PRETTY_FUNCTION__
                            line:__LINE__];
    return saveError;
}
- (NSError *)dataError
{
    NSError *dataError = nil;
    dataError = @{CONST_CORE_DATA_ERROR:CONST_CORE_DATA_NO_DATA}.copy;
    [Logger debugLogWithCategory:CONST_DEBUG
                         message:CONST_CORE_DATA_NO_DATA
                        Function:__PRETTY_FUNCTION__
                            line:__LINE__];
    return dataError;
}

#pragma mark -Log
- (void)coreDataLog:(NSArray *)fetchdataLists
{
    
    NSMutableArray * logLists = @[].mutableCopy;
    for (User *user in fetchdataLists)
    {
        NSMutableDictionary *logDictionary = @{}.mutableCopy;
        if (user.name)
        {
            [logDictionary setObject:user.name    forKey:CONST_CORE_DATA_ENTITY_USER_NAME];
        }
        if (user.mail)
        {
            [logDictionary setObject:user.mail    forKey:CONST_CORE_DATA_ENTITY_USER_MAIL];
        }
        if (user.create)
        {
            [logDictionary setObject:user.create  forKey:CONST_CORE_DATA_ENTITY_USER_CREATE];
        }
        if (user.update)
        {
            [logDictionary setObject:user.update  forKey:CONST_CORE_DATA_ENTITY_USER_UPDATE];
        }
        [logLists addObject:logDictionary];
    }
    [Logger debugLogWithCategory:CONST_DEBUG message:logLists
                        Function:__PRETTY_FUNCTION__
                            line:__LINE__];

    
}
@end
