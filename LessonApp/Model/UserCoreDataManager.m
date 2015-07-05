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

- (NSArray *)fetchEntityListWithPredicate:(NSPredicate *)predicate
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:NSStringFromClass([User class]) inManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *request = [NSFetchRequest new];
    [request setEntity:entity];
    if (predicate)
    {
        [request setPredicate:predicate];
    }
    NSError *error = nil;
    return [self.managedObjectContext executeFetchRequest:request error:&error];
}

- (BOOL)insertEntityWithName:(NSString *)name mail:(NSString *)mail
{
    User* entity = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([User class]) inManagedObjectContext:self.managedObjectContext];
    
    entity.name = name;
    entity.mail = mail;
    
    NSError *error = nil;
    if([self.managedObjectContext save:&error])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

@end
