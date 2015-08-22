//
//  ItemCellEntity.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/25.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@interface MovieEntity : NSObject

typedef NS_ENUM(NSInteger, cellType)
{
    normalCellType,
};

@property (nonatomic,assign)NSInteger   cellType;
@property (nonatomic,strong)UIImage *   thumbnailImage;
@property (nonatomic,strong)NSString *  title;
@property (nonatomic,assign)CGFloat     progressRait;
@property (nonatomic,assign)BOOL        isDownload;
@property (nonatomic,assign)BOOL        isFavorite;

+ (MovieEntity *)setEntityWithCellType:(cellType)cellType
                          progressRait:(CGFloat)progressRait
                        thumbnailImage:(UIImage *)thumbnailImage
                                 title:(NSString *)title
                            isDownload:(BOOL)isDownload
                            isFavorite:(BOOL)isFavorite;
@end
