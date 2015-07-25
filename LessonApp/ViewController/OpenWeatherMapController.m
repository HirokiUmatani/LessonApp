//
//  OpenWeatherMapViewController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "OpenWeatherMapController.h"
#import "OpenWeatherMapFetcher.h"

@interface OpenWeatherMapController ()
@property LocationFetcher *locationFetcher;
@property OpenWeatherMapFetcher *openWeatherMapFetcher;
@property OpenWeatherMapFetcher *iconOpenWeatherMapFetcher;
@end

@implementation OpenWeatherMapController
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
    _openWeatherMapFetcher = [OpenWeatherMapFetcher new];
    [_openWeatherMapFetcher startAsyncFetchingWithLatitude:_locationFetcher.latitude
                                                 longitude:_locationFetcher.longitude
                                                   success:^(OpenWeatherMapEntity *openWeatherMapEntity)
     {
         _iconOpenWeatherMapFetcher = [OpenWeatherMapFetcher new];
         [_iconOpenWeatherMapFetcher startAsyncFetchingIconImageWithEntity:openWeatherMapEntity
                                                     success:^(UIImage * iconImage)
          {
              [_contentView setView:openWeatherMapEntity];
          }
                                                      failed:^(NSError *error){}];
     }
                                               failed:^(NSError *error){}];
}

- (void)initOpenWeatherMapView
{
    if (_contentView)
        return;
    _contentView = [[OpenWeatherMapView alloc]initWithXibName:CONST_VIEW_CLASS_NAME];
}

@end
