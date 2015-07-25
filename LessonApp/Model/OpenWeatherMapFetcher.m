//
//  OpenWeatherMapFetcher.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "OpenWeatherMapFetcher.h"


@implementation OpenWeatherMapFetcher
- (void)startAsyncFetchingWithLatitude:(NSString *)latitude
                             longitude:(NSString *)longitude
                               success:(FetchSuccess)success
                                failed:(FetchFailed)failed
{
    // request URL
    NSString *urlString = [NSString stringWithFormat:
                           CONST_OPEN_WEATHER_MAP_DATA_API,
                           latitude,
                           longitude];
    // execute request
    [self startAsyncFetchingWithUrlString:urlString
                                  success:^(NSData *responceData)
    {
        // data → json
        NSDictionary *jsonObject = [NSJSONSerialization dictionaryFromJsonData:responceData];
        
        // json → entity
        OpenWeatherMapEntity *resultEntity = [OpenWeatherMapEntity convertEntityFromDictionary:jsonObject];
        success(resultEntity);
    }
                                   failed:^(NSError *error)
    {
        failed(error);
    }];
}

- (void)startAsyncFetchingIconImageWithEntity:(OpenWeatherMapEntity *)entity
                                      success:(FetchSuccess)success
                                       failed:(FetchFailed)failed
{
    // request URL
    NSString *urlString = [NSString stringWithFormat:
                           CONST_OPEN_WEATHER_MAP_ICON_IMAGE_API,
                           entity.weather.icon];
    // execute request
    [self startAsyncFetchingWithUrlString:urlString
                                  success:^(NSData *responceData)
     {
         // add data in entity
         OpenWeatherMapEntity *resultEntity = [OpenWeatherMapEntity addEntityItem:entity
                                                              wetherImageIconData:responceData];
         
         success(resultEntity);
     }
                                   failed:^(NSError *error)
     {
         failed(error);
     }];

}
@end
