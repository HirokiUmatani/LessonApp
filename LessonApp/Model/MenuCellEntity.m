//
//  MenuCellEntity.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/11.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MenuCellEntity.h"

@implementation MenuCellEntity
+ (NSArray *)setCellLists
{
    NSMutableArray *tempList =@[].mutableCopy;
    MenuCellEntity *entity;
    
    entity = MenuCellEntity.new;
    entity.cellType = titleCellType;
    entity.title = @"Sign Up";
    [tempList addObject:entity];
    
    entity = MenuCellEntity.new;
    entity.cellType = titleCellType;
    entity.title = @"Home";
    [tempList addObject:entity];
    
    return tempList;
}
@end
