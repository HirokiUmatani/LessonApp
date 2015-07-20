//
//  OpenWeatherMapWeatherEntity.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@interface OpenWeatherMapWeatherEntity : NSObject
@property (nonatomic,strong)NSString *weather_description;
@property (nonatomic,strong)NSString *icon;
@property (nonatomic,strong)NSNumber *weather_id;
@property (nonatomic,strong)NSString *main;

@end
