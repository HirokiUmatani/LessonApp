//
//  MenuTableViewController.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//


@protocol MenuTableViewControllerDelegate <NSObject>
- (void)hideWetherView;
- (void)showWetherView;
- (void)didSelectMenuTableViewIndexPath:(NSIndexPath *)indexPath;
@end

@interface MenuTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property UITableView *contentView;
@property (nonatomic, weak) id<MenuTableViewControllerDelegate> delegate;
@end
