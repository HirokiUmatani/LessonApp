//
//  ItemCellEntity.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/25.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@interface ItemEntity : NSObject

typedef NS_ENUM(NSInteger, cellType)
{
    normalCellType,
};

@property (nonatomic,assign)NSInteger   cellType;
@property (nonatomic,assign)CGFloat     progressRait;
@property (nonatomic,strong)UIImage *   thumbnailImage;
@property (nonatomic,strong)NSString *  titleString;

+ (ItemEntity *)setEntity:(cellType)cellType
             progressRait:(CGFloat)progressRait
           thumbnailImage:(UIImage *)thumbnailImage
              titleString:(NSString *)titleString;
@end
