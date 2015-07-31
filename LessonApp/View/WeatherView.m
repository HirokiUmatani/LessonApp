//
//  OpenWeatherMapView.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/04.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "WeatherView.h"
#import "WeatherFetcher.h"

@interface WeatherView()
@property WeatherFetcher *iconFetcher;
@end

@implementation WeatherView
static NSString *degressCentigrade = @"%@℃";
- (void)updateView:(WeatherEntity *)entity
{
    _iconImage.image = entity.image;
    _tempLabel.text = [NSString stringWithFormat:degressCentigrade,entity.temp];
}
@end
