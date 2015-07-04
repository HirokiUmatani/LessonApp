//
//  MenuTableViewCell.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@interface MenuTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)setView:(NSArray *)cellLists
      indexPath:(NSIndexPath *)indexPath;
@end
