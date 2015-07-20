//
//  Const.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "WebAPIConst.h"

@implementation WebAPIConst
// WEB API URL
NSString * const CONST_OPEN_WEATHER_MAP_DATA_API = @"http://api.openweathermap.org/data/2.5/weather?units=metric&lat=%@&lon=%@&APPID=8dba7e87b472032722e919d91b2c0d55";
NSString * const CONST_OPEN_WEATHER_MAP_ICON_IMAGE_API = @"http://openweathermap.org/img/w/%@.png";

NSString * const CONST_M3U8_DOWNLOAD_API = @"http://49.212.39.17/mario/high_15.m3u8";
NSString * const CONST_MOVIE_DOWNLOAD_API = @"http://49.212.39.17/mario/high_15_%zd.ts";


// Common
NSString * const CONST_BLANK_STRING = @"";
@end
