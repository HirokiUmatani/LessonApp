//
//  Notification.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/05.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "Notification.h"

@implementation Notification
- (void)setReciveNotificationObserver:(id)observer
                             selector:(SEL)selector
                                 name:(NSString *)name
                               object:(id)object
{
    NSNotificationCenter *notificationCenter = NSNotificationCenter.defaultCenter;
    [notificationCenter addObserver:observer
                           selector:selector
                               name:name
                             object:nil];
}

- (void)setSendNotificationWithName:(NSString *)name
                             object:(id)object
{
    NSNotification *notification = [NSNotification notificationWithName:name
                                                                 object:object];
    [NSNotificationCenter.defaultCenter postNotification:notification];
}
- (void)removeNotificationWithObserver:(id)observer
                                  Name:(NSString *)name
                                object:(id)object
{
    NSNotificationCenter *notificationCenter = NSNotificationCenter.defaultCenter;
    [notificationCenter removeObserver:observer name:name object:object];
}

@end
