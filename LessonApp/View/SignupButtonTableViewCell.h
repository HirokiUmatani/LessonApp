//
//  SignupButtonTableViewCell.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/11.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//
#import "SignupEntity.h"
@interface SignupButtonTableViewCell : UITableViewCell

extern NSString * const CONST_SIGNUP_BUTTON_CELL_IDENTIFIRE;
- (void)setView:(NSArray *)cellLists
      indexPath:(NSIndexPath *)indexPath;
@end
