//
//  CoreDataManager.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/05.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//
#import <CoreData/CoreData.h>
@interface CoreDataManager : NSObject

@property (nonatomic,strong)NSManagedObjectModel * managedObjectModel;
@property (nonatomic,strong)NSPersistentStoreCoordinator * persistentStoreCoordinator;
@property (nonatomic,strong)NSManagedObjectContext * managedObjectContext;

+ (CoreDataManager *)sharedInstance;
@end
