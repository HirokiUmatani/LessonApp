//
//  OpenWeatherMapFetcher.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "OpenWeatherMapFetcher.h"


@implementation OpenWeatherMapFetcher
- (void)startFetchingWithLatitude:(NSString *)latitude
                        longitude:(NSString *)longitude
                          success:(OpenWeatherMapFetchSuccess)success
                          failed:(OpenWeatherMapFetchFailed)failed
{
    [self startFetchingWithUrlString:[NSString stringWithFormat:
                                      CONST_OPEN_WEATHER_MAP_URL,
                                      latitude,
                                      longitude]
     
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

- (void)startFetchingIconImageWithIconCd:(NSString *)icon
                                 success:(OpenWeatherMapIconImageFetchSuccess)success
                                  failed:(OpenWeatherMapFetchFailed)failed
{
    [self startFetchingWithUrlString:[NSString stringWithFormat:
                                      CONST_OPEN_WEATHER_MAP_ICON_URL,
                                      icon]
     
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
