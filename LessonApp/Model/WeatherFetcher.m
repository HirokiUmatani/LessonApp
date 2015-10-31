//
//  OpenWeatherMapFetcher.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "WeatherFetcher.h"


@implementation WeatherFetcher
- (void)fetchDataWithLatitude:(NSString *)latitude
                    longitude:(NSString *)longitude
                      success:(FetchSuccessWetherEntity)success
                       failed:(FetchFailed)failed
{
    // request URL
    NSString *urlString = [NSString stringWithFormat:
                           CONST_OPEN_WEATHER_MAP_DATA_API,
                           latitude,
                           longitude];
    // execute request
    [self fetchAsyncWithUrlString:urlString
                          success:^(NSData *responceData)
    {
        // data → json
        NSDictionary *jsonObject = [NSJSONSerialization dictionaryFromJsonData:responceData];
        
        // json → entity
        WeatherEntity *resultEntity = [WeatherEntity convertEntityFromDictionary:jsonObject];
        success(resultEntity);
    }
                                   failed:^(NSError *error)
    {
        failed(error);
    }];
}

- (void)fetchIconImageWithEntity:(WeatherEntity *)entity
                         success:(FetchSuccessImage)success
                          failed:(FetchFailed)failed
{
    // request URL
    NSString *urlString = [NSString stringWithFormat:
                           CONST_OPEN_WEATHER_MAP_ICON_IMAGE_API,
                           entity.icon];
    // execute request
    [self fetchAsyncWithUrlString:urlString
                          success:^(NSData *responceData)
     {
         UIImage *imageIcon = [UIImage imageWithData:responceData];
         success(imageIcon);
     }
                                   failed:^(NSError *error)
     {
         failed(error);
     }];
}
@end
