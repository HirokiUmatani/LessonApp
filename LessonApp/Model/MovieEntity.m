//
//  ItemCellEntity.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/25.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MovieEntity.h"
@implementation MovieEntity
+ (MovieEntity *)setEntityWithCellType:(cellType)cellType
                          progressRait:(CGFloat)progressRait
                        thumbnailImage:(UIImage *)thumbnailImage
                                 title:(NSString *)title
                            isDownload:(BOOL)isDownload
                            isFavorite:(BOOL)isFavorite
{
    MovieEntity *entity = [MovieEntity new];
    entity.cellType = cellType;
    entity.progressRait = progressRait;
    entity.thumbnailImage = thumbnailImage;
    entity.title = title;
    entity.isDownload = isDownload;
    entity.isFavorite = isFavorite;
    return entity;
}
@end
