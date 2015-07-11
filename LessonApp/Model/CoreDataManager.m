//
//  CoreDataManager.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/05.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "CoreDataManager.h"

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
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"LessonApp" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationLibraryDirectory] URLByAppendingPathComponent:@"LessonApp.sqlite"];
    
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
    NSString *coreDataDirectoryPath = [NSString stringWithFormat:@"CoreDataDirectoryPath : %@/Library",NSHomeDirectory()];
    [Logger debugLogWithCategory:CONST_DEBUG message:coreDataDirectoryPath
                        Function:__PRETTY_FUNCTION__
                            line:__LINE__];
    
    return [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),@"Library"]];
}
@end
