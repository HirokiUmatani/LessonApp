//
//  MenuTableViewCell.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MenuTableViewCell.h"
#import "MenuCellEntity.h"

@implementation MenuTableViewCell
NSString * const CONST_MENU_CELL_IDENTIFIRE = @"MenuTableViewCell";
- (void)setView:(NSArray *)cellLists
      indexPath:(NSIndexPath *)indexPath
{
    MenuCellEntity *menuCellEntity = [MenuCellEntity new];
    menuCellEntity = cellLists[indexPath.row];
    _titleLabel.text = menuCellEntity.title;
}
@end
