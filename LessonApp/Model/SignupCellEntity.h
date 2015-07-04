//
//  SignupCellEntity.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/11.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@interface SignupCellEntity : NSObject
typedef NS_ENUM(NSInteger, cellType)
{
    blankCellType,
    titleAndTextFieldCellType,
    buttonCellType
};
@property (nonatomic,assign) NSInteger cellType;
@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString * textField;

+ (NSArray *)setCellLists;
@end
