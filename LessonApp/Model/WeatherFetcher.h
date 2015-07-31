//
//  OpenWeatherMapFetcher.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "WeatherEntity.h"

@interface WeatherFetcher : HttpFetcher

- (void)fetchDataWithLatitude:(NSString *)latitude
                    longitude:(NSString *)longitude
                      success:(FetchSuccess)success
                       failed:(FetchFailed)failed;

- (void)fetchIconImageWithEntity:(WeatherEntity *)entity
                         success:(FetchSuccess)success
                          failed:(FetchFailed)failed;
@end
