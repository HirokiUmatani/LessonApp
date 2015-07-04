//
//  OpenWeatherMapEntity.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "OpenWeatherMapWeatherEntity.h"
@interface OpenWeatherMapEntity : NSObject
@property(nonatomic,strong)NSNumber *humidity;
@property(nonatomic,strong)NSNumber *pressure;
@property(nonatomic,strong)NSNumber *temp;
@property(nonatomic,strong)NSNumber *temp_max;
@property(nonatomic,strong)NSNumber *temp_min;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *country;
@property(nonatomic,strong)NSNumber *sys_id;
@property(nonatomic,strong)NSNumber *message;
@property(nonatomic,strong)NSNumber *sunrise;
@property(nonatomic,strong)NSNumber *sunset;
@property(nonatomic,strong)NSNumber *type;
@property(nonatomic,strong)NSNumber *visibility;
@property(nonatomic,strong)OpenWeatherMapWeatherEntity *weather;
@property(nonatomic,strong)NSNumber *deg;
@property(nonatomic,strong)NSNumber *speed;

+ (OpenWeatherMapEntity *)convertEntityFromDictionary:(NSDictionary *)dictionary;
@end
