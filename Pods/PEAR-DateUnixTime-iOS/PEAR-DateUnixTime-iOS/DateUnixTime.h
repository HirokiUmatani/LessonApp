//
//  DateUnixTime.h
//  DateUnixTime
//
//  Created by hirokiumatani on 2015/11/19.
//  Copyright © 2015年 hirokiumatani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUnixTime : NSObject
#pragma mark - Convert From NSDate Tom NSString or UnixTime
/**
 Date -> String
 */
+ (NSString *)convertStringFromDate:(NSDate *)date
                       outputFormat:(NSString *)format;

/**
 Date -> UnixTime
 */
+ (double)convertUnixTimeFromDate:(NSDate *)date;

/**
 Unix Time -> NSString
 */
+ (NSString *)convertStringFromUnixTime:(double)unixTime
                           outputFormat:(NSString *)format;

#pragma mark - Convert From NSString To NSDate or Unix Time
/**
 String -> Date
 */
+ (NSDate *)convertDateFromString:(NSString *)string
                      inputFormat:(NSString *)format;

/** 
 String -> UnixTime
 */
+ (double)convertUnixTimeFromString:(NSString *)string
                        inputFormat:(NSString *)format;

/**
 Unix Time -> Date
 */
+ (NSDate *)convertDateFromUnixTime:(double)unixtime;


@end
