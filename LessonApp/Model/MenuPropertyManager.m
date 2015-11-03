//
//  MenuPropertyManager.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/29.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MenuPropertyManager.h"

@implementation MenuPropertyManager
- (NSArray *)fetchMenuEntityList
{
    NSArray *propertyLists = [[self class] fetchArrayWithPlist:@"MenuPropertyList"];
    return [self convertMenuEntityListFromPlists:propertyLists];
}

- (NSArray *)convertMenuEntityListFromPlists:(NSArray *)plists
{
    
    NSMutableArray *results =@[].mutableCopy;
    for (NSDictionary *propertyDict in plists)
    {
        MenuEntity *entity = [MenuEntity new];
        entity = [MenuEntity setEntityWithCellType:[propertyDict[@"cellType"] integerValue]
                                             title: propertyDict[@"title"]];
        [results addObject:entity];
    }
    return results;
}
@end
