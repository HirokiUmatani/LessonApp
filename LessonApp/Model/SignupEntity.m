//
//  SignupCellEntity.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/11.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "SignupEntity.h"

@implementation SignupEntity
+ (SignupEntity *)setEntity:(cellType)cellType
                      title:(NSString *)title
                  textField:(NSString *)textField
{
    SignupEntity *entiry = [SignupEntity new];
    entiry.cellType = cellType;
    entiry.title = title;
    entiry.textField = textField;
    return entiry;
}
@end
