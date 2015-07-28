//
//  SignupTableViewCell.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//
#import "SignupEntity.h"
@interface SignupTableViewCell : UITableViewCell

extern NSString * const CONST_SIGNUP_CELL_IDENTIFIRE;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (void)setView:(NSArray *)cellLists
      indexPath:(NSIndexPath *)indexPath;
@end
