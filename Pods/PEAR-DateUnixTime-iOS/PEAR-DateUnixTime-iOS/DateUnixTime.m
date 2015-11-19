//
//  DateUnixTime.m
//  DateUnixTime
//
//  Created by hirokiumatani on 2015/11/19.
//  Copyright © 2015年 hirokiumatani. All rights reserved.
//

#import "DateUnixTime.h"

@implementation DateUnixTime
+ (double)convertUnixTimeFromDate:(NSDate *)date
{
    double unixtime = [date timeIntervalSince1970];
    return unixtime;
}

+ (double)convertUnixTimeFromString:(NSString *)string
                        inputFormat:(NSString *)format

{
    NSDateFormatter *formatter = [self setformatterWithFormat:format];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    NSDate *date = [formatter dateFromString:string];
    
    double unixTime = [self convertUnixTimeFromDate:date];
    return unixTime;
}

+ (NSDate *)convertDateFromUnixTime:(double)unixtime
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:unixtime];
    
    return date;
}

+ (NSString *)convertStringFromUnixTime:(double)unixTime
                           outputFormat:(NSString *)format

{
    NSDate *unixTimeDate = [self convertDateFromUnixTime:unixTime];
    
    NSDateFormatter *formatter = [self setformatterWithFormat:format];
    NSString *dateString = [formatter stringFromDate:unixTimeDate];
    return dateString;
}

+ (NSString *)convertStringFromDate:(NSDate *)date
                       outputFormat:(NSString *)format
{
    double unixTime = [self convertUnixTimeFromDate:date];
    NSString *dateString = [self convertStringFromUnixTime:unixTime
                                              outputFormat:format];
    return dateString;
}

+ (NSDate *)convertDateFromString:(NSString *)string
                       inputFormat:(NSString *)format
{
    double unixTime = [self convertUnixTimeFromString:string
                                          inputFormat:format];
    
    NSDate *unixTimeDate = [self convertDateFromUnixTime:unixTime];
    
    return unixTimeDate;
}

+ (NSDateFormatter *)setformatterWithFormat:(NSString *)format
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:format];
    [formatter setLocale:[NSLocale currentLocale]];
    return formatter;
}
@end
