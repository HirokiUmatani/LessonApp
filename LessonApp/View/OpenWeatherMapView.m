//
//  OpenWeatherMapView.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/04.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "OpenWeatherMapView.h"
#import "OpenWeatherMapFetcher.h"

@interface OpenWeatherMapView()
@property OpenWeatherMapFetcher *iconFetcher;
@end

@implementation OpenWeatherMapView

- (void)setView:(OpenWeatherMapEntity *)openWeatherMapEntity
{
    _iconFetcher = [OpenWeatherMapFetcher new];
    [_iconFetcher startFetchingIconImageWithIconCd:openWeatherMapEntity.weather.icon
                                          success:^(UIImage * image)
    {
        _iconImage.image = image;
        _tempLabel.text = [NSString stringWithFormat:CONST_DEGRESS_CENTIGRADE,openWeatherMapEntity.temp];
    }
                                           failed:^(NSError *error)
    {
    }];
}
@end
