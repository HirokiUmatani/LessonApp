//
//  MenuCellEntity.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/11.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@interface MenuCellEntity : NSObject

typedef NS_ENUM(NSInteger, cellType)
{
    titleCellType = 0,
};

@property (nonatomic,assign) NSInteger cellType;
@property (nonatomic,strong) NSString * title;

+ (MenuCellEntity *)setCellEntity:(cellType)cellType
                            title:(NSString *)title;
+ (NSArray *)setCellLists;
@end
