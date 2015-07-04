//
//  OpenWeatherMapViewController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "OpenWeatherMapViewController.h"
#import "OpenWeatherMapFetcher.h"

@interface OpenWeatherMapViewController ()
@property LocationFetcher *locationFetcher;
@property OpenWeatherMapFetcher *openWeatherMapFetcher;
@end

@implementation OpenWeatherMapViewController
static NSString *CONST_VIEW_CLASS_NAME = @"OpenWeatherMapView";
- (void)loadView
{
    [super loadView];
    [self createLocationFetcher];
    [self startLocation];
    [self initOpenWeatherMapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - GeodeticDelegate
- (void)didUpdateToLocation
{
    [self fetchWeather];
}

- (void)didFailWithError
{
    
}

#pragma mark - private
- (void)createLocationFetcher
{
    if (_locationFetcher)
        return;
    _locationFetcher = [LocationFetcher new];
    _locationFetcher.delegate = self;

}
- (void)startLocation
{
    [_locationFetcher startLocation];
}

- (void)fetchWeather
{
    _openWeatherMapFetcher = OpenWeatherMapFetcher.new;
    [_openWeatherMapFetcher startFetchingWithLatitude:_locationFetcher.latitude
                                            longitude:_locationFetcher.longitude
                                              success:^(OpenWeatherMapEntity *openWeatherMapEntity)
     {
         [_contentView setView:openWeatherMapEntity];
     }
                                               failed:^(NSError *error)
     {
     }];
}

- (void)initOpenWeatherMapView
{
    if (_contentView)
        return;
    _contentView = [[OpenWeatherMapView alloc]initWithXibName:CONST_VIEW_CLASS_NAME];
}

@end
