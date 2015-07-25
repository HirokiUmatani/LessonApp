//
//  Notification.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/05.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

/*** @class NSNotification rapping class */
@interface Notification : NSObject

/*** recive notification */
- (void)setReciveNotificationAddObserver:(id)observer
                                selector:(SEL)selector
                                    name:(NSString *)name
                                  object:(id)object;
/*** senf notification */
- (void)setSendNotificationWithName:(NSString *)name object:(id)object;
@end
