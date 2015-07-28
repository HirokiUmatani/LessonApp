//
//  ItemCellEntity.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/25.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "ItemEntity.h"

@implementation ItemEntity
+ (ItemEntity *)setEntity:(cellType)cellType
             progressRait:(CGFloat)progressRait
           thumbnailImage:(UIImage *)thumbnailImage
              titleString:(NSString *)titleString
{
    ItemEntity *entity = [ItemEntity new];
    entity.cellType = cellType;
    entity.progressRait = progressRait;
    entity.thumbnailImage = thumbnailImage;
    entity.titleString = titleString;
    return entity;
}
@end
