//
//  NSString+Device.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/18.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@interface NSObject(Device)
+ (NSDictionary *)appInfo;
+ (CGRect)screenRect;
+ (CGFloat)screenWidth;
+ (CGFloat)screenHeight;
+ (NSString *)stringFromDate:(NSDate *)date;
+ (NSDate *)dateFromString:(NSString *)string;
@end
