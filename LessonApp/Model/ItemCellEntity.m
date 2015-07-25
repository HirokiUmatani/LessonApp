//
//  ItemCellEntity.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/25.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "ItemCellEntity.h"

@implementation ItemCellEntity
+ (ItemCellEntity *)setCellEntity:(cellType)cellType
                     progressRait:(CGFloat)progressRait
                   thumbnailImage:(UIImage *)thumbnailImage
                      titleString:(NSString *)titleString
{
    ItemCellEntity *entity = [ItemCellEntity new];
    entity.cellType = cellType;
    entity.progressRait = progressRait;
    entity.thumbnailImage = thumbnailImage;
    entity.titleString = titleString;
    return entity;
}
@end
