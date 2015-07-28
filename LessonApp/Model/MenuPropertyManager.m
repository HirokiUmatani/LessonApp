//
//  MenuPropertyManager.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/29.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MenuPropertyManager.h"

@implementation MenuPropertyManager
- (NSArray *)fetchMenuListWithPlist:(NSString *)plist
{
    NSArray *menuPlists = [self fetchPropertyListWithPlist:plist];
    return [self convertMenuEntityFromPlists:menuPlists];
}

- (NSArray *)convertMenuEntityFromPlists:(NSArray *)plists
{
    
    NSMutableArray *results =@[].mutableCopy;
    for (NSDictionary *propertyDict in plists)
    {
        MenuEntity *entity = [MenuEntity new];
        entity = [MenuEntity setEntity:[propertyDict[@"cellType"] integerValue]
                                 title: propertyDict[@"title"]];
        [results addObject:entity];
    }
    return results;
}
@end
