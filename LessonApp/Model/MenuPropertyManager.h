//
//  MenuPropertyManager.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/29.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//
#import "MenuEntity.h"
@interface MenuPropertyManager : PropertyListManager
- (NSArray *)fetchMenuListWithPlist:(NSString *)plist;;
@end
