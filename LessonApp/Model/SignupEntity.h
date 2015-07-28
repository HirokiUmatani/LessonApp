//
//  SignupEntity.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/11.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@interface SignupEntity : NSObject

typedef NS_ENUM(NSInteger, cellType)
{
    titleAndTextFieldCellType = 0,
    buttonCellType = 1,
    blankCellType
};

@property (nonatomic,assign) NSInteger  cellType;
@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString * textField;

+ (SignupEntity *)setEntity:(cellType)cellType
                      title:(NSString *)title
                  textField:(NSString *)textField;

@end
