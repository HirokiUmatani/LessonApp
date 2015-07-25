//
//  OpenWeatherMapFetcher.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "OpenWeatherMapEntity.h"

@interface OpenWeatherMapFetcher : HttpFetcher

- (void)startAsyncFetchingWithLatitude:(NSString *)latitude
                             longitude:(NSString *)longitude
                               success:(FetchSuccess)success
                                failed:(FetchFailed)failed;

- (void)startAsyncFetchingIconImageWithEntity:(OpenWeatherMapEntity *)entity
                                      success:(FetchSuccess)success
                                       failed:(FetchFailed)failed;
@end
