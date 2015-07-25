//
//  MenuCellEntity.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/11.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MenuCellEntity.h"

@implementation MenuCellEntity
+ (MenuCellEntity *)setCellEntity:(cellType)cellType
                            title:(NSString *)title
{
    MenuCellEntity *entity = [MenuCellEntity new];
    entity.cellType = cellType;
    entity.title = title;
    return entity;
}

+ (NSArray *)setCellLists
{
    NSString* propertyDataFile = [[NSBundle mainBundle]pathForResource:@"MenuCellPropertyList" ofType:@"plist"];
    NSArray *propertyDataList = [NSArray arrayWithContentsOfFile:propertyDataFile];
    NSMutableArray *results =@[].mutableCopy;

    for (NSDictionary *propertyDict in propertyDataList)
    {
        MenuCellEntity *entity = [MenuCellEntity new];
        entity = [self setCellEntity:[propertyDict[@"cellType"] integerValue]
                               title: propertyDict[@"title"]];
        [results addObject:entity];
    }
    return results;
}
@end
