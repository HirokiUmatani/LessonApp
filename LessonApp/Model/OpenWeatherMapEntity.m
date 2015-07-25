//
//  OpenWeatherMapEntity.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "OpenWeatherMapEntity.h"
@implementation OpenWeatherMapEntity
+ (OpenWeatherMapEntity *)convertEntityFromDictionary:(NSDictionary *)dictionary
{
    OpenWeatherMapEntity * entity = OpenWeatherMapEntity.new;
    
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
    for (NSInteger i = 0; i < [dictionary[@"weather"] count]; i++)
    {
        entity.weather = OpenWeatherMapWeatherEntity.new;
        entity.weather.weather_description = dictionary[@"weather"][i][@"description"];
        entity.weather.icon = dictionary[@"weather"][i][@"icon"];
        entity.weather.weather_id = dictionary[@"weather"][i][@"id"];
        entity.weather.main = dictionary[@"weather"][i][@"main"];
    }
    
    // wind
    entity.deg = dictionary[@"wind"][@"deg"];
    entity.speed = dictionary[@"wind"][@"speed"];
    
    return entity;
}

+ (OpenWeatherMapEntity *)addEntityItem:(OpenWeatherMapEntity *)entity
                    wetherImageIconData:(NSData *)iconImageData
{
    UIImage *imageIcon = [UIImage imageWithData:iconImageData];
    entity.weather.image = imageIcon;
    return entity;
}
@end
