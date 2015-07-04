//
//  Const.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "Const.h"

@implementation Const
// OpenWeatherMapFetcher
NSString * const CONST_OPEN_WEATHER_MAP_URL = @"http://api.openweathermap.org/data/2.5/weather?units=metric&lat=%@&lon=%@&APPID=8dba7e87b472032722e919d91b2c0d55";
NSString * const CONST_OPEN_WEATHER_MAP_ICON_URL = @"http://openweathermap.org/img/w/%@.png";

// ItemCollectionViewController
NSString * const CONST_ITEM_CELL_IDENTIFIRE = @"ItemCollectionViewCell";
NSString * const CONST_BLANK_STRING = @"";
// MenuTableViewController
NSString * const CONST_MENU_CELL_IDENTIFIRE = @"MenuTableViewCell";
// OpenWeatherMapView
NSString * const CONST_DEGRESS_CENTIGRADE = @"%@℃";
// SignupTableViewController
NSString * const CONST_SIGNUP_CELL_IDENTIFIRE = @"SignupTableViewCell";
NSString * const CONST_SIGNUP_BUTTON_CELL_IDENTIFIRE = @"SignupButtonTableViewCell";


@end
