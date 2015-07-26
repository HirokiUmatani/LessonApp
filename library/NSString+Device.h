//
//  NSString+Device.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/18.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@interface NSString(Device)

+ (NSDictionary *)appInfo;

+ (CGRect) screenRect;
+ (CGFloat)screenWidth;
+ (CGFloat)screenHeight;

+ (NSString *)stringFromDate:(NSDate *)date;
+ (NSDate   *)dateFromString:(NSString *)string;
- (NSString *)md5;
- (NSString *)AES128Key:(NSString *)salt;
- (NSString *)AES128iv:(NSString *)salt;

@end
