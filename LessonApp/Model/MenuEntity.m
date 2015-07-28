//
//  MenuCellEntity.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/11.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MenuEntity.h"

@implementation MenuEntity
+ (MenuEntity *)setEntity:(cellType)cellType
                            title:(NSString *)title
{
    MenuEntity *entity = [MenuEntity new];
    entity.cellType = cellType;
    entity.title = title;
    return entity;
}

@end
