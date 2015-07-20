//
//  CoreDataManager.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/05.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "CoreDataManager.h"

NSString * const CONST_CORE_DATA_ERROR = @"CoreData error";
NSString * const CONST_CORE_DATA_FETCH_ERROR = @"CoreData fetch failed";
NSString * const CONST_CORE_DATA_SAVE_ERROR = @"CoreData save failed";
NSString * const CONST_CORE_DATA_NO_DATA = @"CoreData no data";
NSString * const CONST_CORE_DATA_SEARCH = @"%K=%@";
NSString * const CONST_CORE_DATA_MANAGED_OBJECT_MODEL = @"LessonApp";
NSString * const CONST_CORE_DATA_MANAGED_OBJECT_MODEL_EXTENTION = @"momd";
NSString * const CONST_CORE_DATA_SQLITE = @"LessonApp.sqlite";

@implementation CoreDataManager
#pragma mark -Life Cycle
static dispatch_once_t _onceToken;
static CoreDataManager * _sharedInstance = nil;
+ (CoreDataManager *)sharedInstance
{
    if (_sharedInstance)
        return _sharedInstance;
    
    dispatch_once(&_onceToken, ^
    {
        _sharedInstance = [CoreDataManager new];
    });
    return _sharedInstance;
}


#pragma mark -  private
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:CONST_CORE_DATA_MANAGED_OBJECT_MODEL withExtension:CONST_CORE_DATA_MANAGED_OBJECT_MODEL_EXTENTION];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationLibraryDirectory] URLByAppendingPathComponent:CONST_CORE_DATA_SQLITE];
    
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
    NSString *coreDataDirectoryPathMessage = [NSString stringWithFormat:@"CoreDataDirectoryPath : %@/%@",NSHomeDirectory(),@"Library"];
    [Logger debugLogWithCategory:CONST_DEBUG message:coreDataDirectoryPathMessage
                        Function:__PRETTY_FUNCTION__
                            line:__LINE__];
    
    return [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),@"Library"]];
}
@end
