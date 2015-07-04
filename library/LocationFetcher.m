//
//  LocationFetcher.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "LocationFetcher.h"

@interface LocationFetcher()

@property CLLocationManager *locationManager;

@end

@implementation LocationFetcher
static NSString * CONST_FORTH_DECIMAL = @"%f04";

- (void)startLocation
{
    [self stopLocation];
    _locationManager = CLLocationManager.new;
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    [_locationManager requestWhenInUseAuthorization];
    [_locationManager startUpdatingLocation];
    
}
// 位置取得成功時
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    // 緯度経度 取得
    _latitude = [NSString stringWithFormat:CONST_FORTH_DECIMAL,
                 newLocation.coordinate.latitude].copy;
    _longitude = [NSString stringWithFormat:CONST_FORTH_DECIMAL,
                  newLocation.coordinate.longitude].copy;
    [_delegate didUpdateToLocation];
    [self stopLocation];
}

// 位置取得失敗時
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    if (!error)
        return;
    
    switch ([error code])
    {
        case kCLErrorDenied:
            break;
        default:
            break;
    }
    [_delegate didFailWithError];
    [self stopLocation];
}
- (void)stopLocation
{
    if (!_locationManager)
    return
        
    [_locationManager stopUpdatingLocation];
    _locationManager = nil;
}
@end
