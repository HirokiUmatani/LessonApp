//
//  OpenWeatherMapViewController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeatherFetcher.h"

@interface WeatherViewController ()
@property LocationFetcher *locationFetcher;
@property WeatherFetcher *weatherFetcher;
@property WeatherFetcher *iconWeatherFetcher;
@property (strong, nonatomic) IBOutlet WeatherView *weatherView;

@end

@implementation WeatherViewController
#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self fetchLocation];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
- (void)dealloc
{
    _locationFetcher = nil;
    _weatherFetcher = nil;
    _iconWeatherFetcher = nil;
    _weatherView = nil;
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
    [_locationFetcher stopLocation];
}

#pragma mark - private
- (void)fetchLocation
{
    if (!_locationFetcher)
    {
        _locationFetcher = [LocationFetcher new];
        _locationFetcher.delegate = self;
    }
    [_locationFetcher startLocation];
}

- (void)fetchWeather
{
    if(!_weatherFetcher)
    {
        _weatherFetcher = [WeatherFetcher new];
    }
    
    [_weatherFetcher fetchDataWithLatitude:_locationFetcher.latitude
                                 longitude:_locationFetcher.longitude
                                   success:^(WeatherEntity *openWeatherMapEntity)
     {
         if(!_iconWeatherFetcher)
         {
             _iconWeatherFetcher = [WeatherFetcher new];
         }
         
         [_iconWeatherFetcher fetchIconImageWithEntity:openWeatherMapEntity
                                               success:^(UIImage *iconImage)
         {
             // update entity
             WeatherEntity *updateEnity = [WeatherEntity updateEntity:openWeatherMapEntity
                                                                    wetherImageIcon:iconImage];
             [_weatherView updateView:updateEnity];
             [_locationFetcher stopLocation];
         }
                                                failed:^(NSError *error)
         {
             _iconWeatherFetcher = nil;
             [_locationFetcher stopLocation];
         }];
     }
                                    failed:^(NSError *error)
    {
        _weatherFetcher = nil;
        [_locationFetcher stopLocation];
    }];
}

@end
