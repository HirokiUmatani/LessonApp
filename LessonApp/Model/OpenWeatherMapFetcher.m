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
    NSString *urlString = [NSString stringWithFormat:
                           CONST_OPEN_WEATHER_MAP_URL,
                           latitude,
                           longitude];
    [self startAsyncFetchingWithUrlString:urlString
                                  success:^(NSData *responceData)
    {
        NSDictionary *jsonObject = [NSJSONSerialization dictionaryFromJsonData:responceData];
        success([OpenWeatherMapEntity convertEntityFromDictionary:jsonObject]);
    }
                                   failed:^(NSError *error)
    {
        failed(error);
    }];
}

- (void)startAsyncFetchingIconImageWithIconCd:(NSString *)icon
                                      success:(FetchSuccess)success
                                       failed:(FetchFailed)failed
{
    NSString *urlString = [NSString stringWithFormat:CONST_OPEN_WEATHER_MAP_ICON_URL,icon];
    [self startAsyncFetchingWithUrlString:urlString
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
