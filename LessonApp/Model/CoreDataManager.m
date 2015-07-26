//
//  CoreDataManager.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/05.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "CoreDataManager.h"

NSString * const CONST_CORE_DATA_ERROR          = @"CoreData error";
NSString * const CONST_CORE_DATA_FETCH_ERROR    = @"CoreData fetch failed";
NSString * const CONST_CORE_DATA_SAVE_ERROR     = @"CoreData save failed";
NSString * const CONST_CORE_DATA_FETCH_NO_DATA  = @"CoreData fetch No data";
NSString * const CONST_CORE_DATA_SEARCH         = @"%K=%@";

@implementation CoreDataManager

static NSString * coreDatamanageObjectModel = @"LessonApp";
static NSString * coreDataSqlite = @"LessonApp.sqlite";
static CoreDataManager* sharedInstance = nil;

#pragma mark -Life Cycle
+ (CoreDataManager *)sharedInstance
{
    if(sharedInstance)
        return sharedInstance;
    
    sharedInstance = [self new];
    return sharedInstance;
}

#pragma mark -  private
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [NSManagedObjectContext new];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:coreDatamanageObjectModel withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationLibraryDirectory] URLByAppendingPathComponent:coreDataSqlite];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        abort();
    }
    
    return _persistentStoreCoordinator;
}
- (NSURL *)applicationLibraryDirectory
{
    NSString *coreDataDirPath = [NSString stringWithFormat:
                                       @"%@/%@",
                                       NSHomeDirectory(),
                                       @"Library"];
    [Logger debugLogWithCategory:CONST_DEBUG
                         message:[NSString stringWithFormat:@"CoreDataDirPath :\n %@",coreDataDirPath]
                        Function:__PRETTY_FUNCTION__
                            line:__LINE__];
    
    return [NSURL fileURLWithPath:coreDataDirPath];
}
@end
