//
//  MenuTableViewCell.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@interface MenuTableViewCell : UITableViewCell

extern NSString * const CONST_MENU_CELL_IDENTIFIRE;

- (void)updateView:(NSArray *)cellLists
         indexPath:(NSIndexPath *)indexPath;
@end
