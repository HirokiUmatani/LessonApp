//
//  UserCoreDataManager.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/05.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "UserCoreDataManager.h"
@implementation UserCoreDataManager
- (id)init
{
    if (self = [super init])
    {
        [CoreDataManager sharedInstance];
    }
    return self;
}

- (void)fetchEntityListWithPredicate:(NSPredicate *)predicate
                          fetchLists:(CoreDataFetchSuccess)fetchLists
                          fetchError:(CoreDataFetchFailed)fetchError
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
    NSSortDescriptor *updateSort = [NSSortDescriptor sortDescriptorWithKey:@"update"
                                                                 ascending:NO] ;
    NSArray *sortDescriptors = [NSArray arrayWithObjects:updateSort,nil];
    [request setSortDescriptors:sortDescriptors];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^
    {
        NSError *error = nil;
        NSArray * dataLists = [self.managedObjectContext executeFetchRequest:request error:&error];
        if (!error)
        {
            fetchLists(dataLists);
        }
        else
        {
            fetchError(error);
        }
    });
}

- (void)insertEntityWithName:(NSString *)name
                        mail:(NSString *)mail
                      create:(NSString *)create
                      update:(NSString *)update
                      finish:(CoreDataFinished)finished
{
    User* entity = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([User class])
                                                 inManagedObjectContext:self.managedObjectContext];
    entity.name     = name;
    entity.mail     = mail;
    entity.create   = create;
    entity.update   = update;

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^
    {
        NSError *error = nil;
        BOOL boolean = [self.managedObjectContext save:&error];
        finished(boolean);
    });
}

@end
