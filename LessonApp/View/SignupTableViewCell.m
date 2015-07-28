//
//  SignupTableViewCell.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "SignupTableViewCell.h"

@implementation SignupTableViewCell
NSString * const CONST_SIGNUP_CELL_IDENTIFIRE = @"SignupTableViewCell";
- (void)setView:(NSArray *)cellLists
      indexPath:(NSIndexPath *)indexPath
{
    SignupEntity *signupCellEntity = [SignupEntity new];
    signupCellEntity = cellLists[indexPath.row];
    _titleLabel.text = signupCellEntity.title;
    _textField.text = signupCellEntity.textField;
}
@end
