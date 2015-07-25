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
@property (strong, nonatomic)OpenWeatherMapView *weatherView;
@end

@implementation OpenWeatherMapController
static NSString *CONST_VIEW_CLASS_NAME = @"OpenWeatherMapView";
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setBackGroundImage:@"subtle_stripes"];
    [self initOpenWeatherMapView];
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

- (void)initOpenWeatherMapView
{
    if (_weatherView)
        return;
    _weatherView = [[OpenWeatherMapView alloc]initWithXibName:CONST_VIEW_CLASS_NAME];
    [self.view addSubview:_weatherView];
    [AutoLayout addConstraintView:_weatherView targetView:self.view];
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
             [_weatherView updateView:openWeatherMapEntity];
         }
                                                                    failed:^(NSError *error)
         {
             _iconOpenWeatherMapFetcher = nil;
         }];
     }
                                                    failed:^(NSError *error)
    {
        _openWeatherMapFetcher = nil;
    }];
}

@end
