//
//  OpenWeatherMapFetcher.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "WeatherEntity.h"
typedef void (^FetchSuccessWetherEntity)(WeatherEntity *wetherEntity);
typedef void (^FetchSuccessImage)(UIImage *image);
@interface WeatherFetcher : PEARHttpFetcher

- (void)fetchDataWithLatitude:(NSString *)latitude
                    longitude:(NSString *)longitude
                      success:(FetchSuccessWetherEntity)success
                       failed:(FetchFailed)failed;

- (void)fetchIconImageWithEntity:(WeatherEntity *)entity
                         success:(FetchSuccessImage)success
                          failed:(FetchFailed)failed;
@end
