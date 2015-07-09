//
//  OpenWeatherMapFetcher.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "OpenWeatherMapEntity.h"

typedef void (^OpenWeatherMapFetchSuccess)(OpenWeatherMapEntity *entity);
typedef void (^OpenWeatherMapIconImageFetchSuccess)(UIImage *imageIcon);
typedef void (^OpenWeatherMapFetchFailed)(NSError *error);

@interface OpenWeatherMapFetcher : HttpFetcher

- (void)startFetchingWithLatitude:(NSString *)latitude
                        longitude:(NSString *)longitude
                          success:(OpenWeatherMapFetchSuccess)success
                           failed:(OpenWeatherMapFetchFailed)failed;

- (void)startFetchingIconImageWithIconCd:(NSString *)icon
                                 success:(OpenWeatherMapIconImageFetchSuccess)success
                                  failed:(OpenWeatherMapFetchFailed)failed;
- (void)stopFetching;
- (void)stopIconImageFetching;
@end
