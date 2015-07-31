//
//  OpenWeatherMapEntity.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "WeatherEntity.h"
@implementation WeatherEntity
+ (WeatherEntity *)convertEntityFromDictionary:(NSDictionary *)dictionary
{
    WeatherEntity * entity = [WeatherEntity new];
    
    // main
    entity.humidity =   dictionary[@"main"][@"humidity"];
    entity.pressure =   dictionary[@"main"][@"pressure"];
    entity.temp =       dictionary[@"main"][@"temp"];
    entity.temp_max =   dictionary[@"main"][@"temp_max"];
    entity.temp_min =   dictionary[@"main"][@"temp_min"];
    
    // name
    entity.name =       dictionary[@"name"];
    
    // sys
    entity.country =    dictionary[@"sys"][@"country"];
    entity.sys_id =     dictionary[@"sys"][@"id"];
    entity.message =    dictionary[@"sys"][@"message"];
    entity.sunrise =    dictionary[@"sys"][@"sunrise"];
    entity.sunset =     dictionary[@"sys"][@"sunset"];
    entity.type =       dictionary[@"sys"][@"type"];
    
    // visibility
    entity.visibility = dictionary[@"visibility"];
    
    // weather
    for (NSInteger i = 0; i< [dictionary[@"weather"] count]; i++)
    {
        entity.weather_description = dictionary[@"weather"][i][@"description"];
        entity.icon = dictionary[@"weather"][i][@"icon"];
        entity.weather_id = dictionary[@"weather"][i][@"id"];
        entity.main = dictionary[@"weather"][i][@"main"];
    }
    
    // wind
    entity.deg = dictionary[@"wind"][@"deg"];
    entity.speed = dictionary[@"wind"][@"speed"];
    
    return entity;
}

+ (WeatherEntity *)updateEntity:(WeatherEntity *)entity
                       wetherImageIcon:(UIImage *)iconImage
{
    entity.image = iconImage;
    return entity;
}
@end
