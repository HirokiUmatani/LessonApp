//
//  OpenWeatherMapFetcher.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "OpenWeatherMapFetcher.h"

@interface OpenWeatherMapFetcher()
@property HttpFercher *httpFetcher;
@property HttpFercher *httpIconImageFetcher;
@end

@implementation OpenWeatherMapFetcher
- (void)startFetchingWithLatitude:(NSString *)latitude
                        longitude:(NSString *)longitude
                          success:(OpenWeatherMapFetchSuccess)success
                          failed:(OpenWeatherMapFetchFailed)failed
{
    [self stopFetching];
    _httpFetcher = HttpFercher.new;
    [_httpFetcher startFetchingWithUrlString:[NSString stringWithFormat:
                                              CONST_OPEN_WEATHER_MAP_URL,
                                              latitude,
                                              longitude]
     
                                     success:^(NSData *responceData)
    {
        NSDictionary *jsonObject = [NSJSONSerialization dictionaryFromJsonData:responceData];
        success([OpenWeatherMapEntity convertEntityFromDictionary:jsonObject]);
        [self stopFetching];
    }
                                      failed:^(NSError *error)
    {
        failed(error);
        [self stopFetching];
    }];
}

- (void)startFetchingIconImageWithIconCd:(NSString *)icon
                                 success:(OpenWeatherMapIconImageFetchSuccess)success
                                  failed:(OpenWeatherMapFetchFailed)failed
{
    [self stopIconImageFetching];
    _httpIconImageFetcher = HttpFercher.new;
    
    [_httpIconImageFetcher startFetchingWithUrlString:[NSString stringWithFormat:
                                              CONST_OPEN_WEATHER_MAP_ICON_URL,
                                              icon]
     
                                              success:^(NSData *responceData)
     {
         UIImage *imageIcon = [UIImage imageWithData:responceData];
         success(imageIcon);
         [self stopIconImageFetching];
     }
                                               failed:^(NSError *error)
     {
         failed(error);
         [self stopIconImageFetching];
     }];

}
- (void)stopFetching
{
    if (_httpFetcher)
        _httpFetcher = nil;
}

- (void)stopIconImageFetching
{
    if (_httpIconImageFetcher)
        _httpIconImageFetcher = nil;
}
@end
