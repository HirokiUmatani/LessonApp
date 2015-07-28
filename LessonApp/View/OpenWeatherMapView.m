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
static NSString *degressCentigrade = @"%@℃";
- (void)setView:(OpenWeatherMapEntity *)entity
{
    _iconImage.image = entity.weather.image;
    _tempLabel.text = [NSString stringWithFormat:degressCentigrade,entity.temp];
}
@end
