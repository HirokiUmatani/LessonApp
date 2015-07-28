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
@property (strong, nonatomic) IBOutlet OpenWeatherMapView *weatherView;

@end

@implementation OpenWeatherMapController
static NSString *CONST_VIEW_CLASS_NAME = @"OpenWeatherMapView";
#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setBackGroundImage:@"subtle_stripes"];
    [self fetchLocation];
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
    if(!_openWeatherMapFetcher)
    {
        _openWeatherMapFetcher = [OpenWeatherMapFetcher new];
    }
    
    [_openWeatherMapFetcher startAsyncFetchingWithLatitude:_locationFetcher.latitude
                                                 longitude:_locationFetcher.longitude
                                                   success:^(OpenWeatherMapEntity *openWeatherMapEntity)
     {
         if(!_iconOpenWeatherMapFetcher)
         {
             _iconOpenWeatherMapFetcher = [OpenWeatherMapFetcher new];
         }
         
         [_iconOpenWeatherMapFetcher startAsyncFetchingIconImageWithEntity:openWeatherMapEntity
                                                                   success:^(UIImage *iconImage)
         {
             [_weatherView setView:openWeatherMapEntity];
             [_locationFetcher stopLocation];
         }
                                                                    failed:^(NSError *error)
         {
             _iconOpenWeatherMapFetcher = nil;
             [_locationFetcher stopLocation];
         }];
     }
                                                    failed:^(NSError *error)
    {
        _openWeatherMapFetcher = nil;
        [_locationFetcher stopLocation];
    }];
}

@end
