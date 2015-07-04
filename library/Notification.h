//
//  Notification.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/05.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

/**
 * @class NSNotificationラッピングClass
 */
@interface Notification : NSObject

#pragma mark - Method
/**
 * 通知受信
 */
- (void)setReciveNotificationAddObserver:(id)observer
                                selector:(SEL)selector
                                    name:(NSString *)name
                                  object:(id)object;
/**
 * 通知送信
 */
- (void)setSendNotificationWithName:(NSString *)name object:(id)object;
@end
