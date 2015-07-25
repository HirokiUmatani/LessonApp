//
//  OpenWeatherMapViewController.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "OpenWeatherMapView.h"
@interface OpenWeatherMapController : UIViewController<LocationFetcherDelegate>
@property (nonatomic,strong) OpenWeatherMapView *contentView;
- (void)startLocation;
@end
