//
//  NSString+Device.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/18.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "NSString+Device.h"

@implementation NSObject(Device)
+ (NSDictionary *)appInfo
{
    return [NSBundle.mainBundle infoDictionary];
}
+ (CGRect)screenRect
{
    return UIScreen.mainScreen.bounds;
}
+ (CGFloat)screenWidth
{
    return self.screenRect.size.width;
}
+ (CGFloat)screenHeight
{
    return self.screenRect.size.height;
}
+ (NSString *)stringFromDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:60 * 60 * 9]];
    return [formatter stringFromDate:date];
}
+ (NSDate *)dateFromString:(NSString *)string
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:60 * 60 * 9]];
    return [formatter dateFromString:string];
}
@end
