//
//  MenuTableViewController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MenuTableViewController.h"
#import "MenuTableViewCell.h"
#import "MenuCellEntity.h"

@interface MenuTableViewController ()
// NSMutableArray
@property NSMutableArray * menuCellLists;
// CGFloat
@property CGFloat tableViewOldOffset;
@end

@implementation MenuTableViewController
- (void)loadView
{
    [super loadView];
    [self setTableView];
    [self setMenuCellLists];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                  willDecelerate:(BOOL)decelerate
{
    if (_tableViewOldOffset > scrollView.contentOffset.y)
        [_delegate showWetherView];
    else
        [_delegate hideWetherView];
    _tableViewOldOffset = scrollView.contentOffset.y;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_delegate didSelectMenuTableViewIndexPath:indexPath];
}
#pragma mark - UITableViewDataSource
// required
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSInteger cellCount = 0;
    cellCount = _menuCellLists.count;
    return cellCount;
}
// required
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *resultCell = [UITableViewCell new];
    MenuCellEntity *menuCellEntity = [MenuCellEntity new];
    menuCellEntity = _menuCellLists[indexPath.row];
    switch (menuCellEntity.cellType)
    {
        case titleCellType:
        {
            MenuTableViewCell *cell = [[MenuTableViewCell alloc]initWithTableView:tableView
                                                                          xibName:CONST_MENU_CELL_IDENTIFIRE
                                                                      cellIdentifire:CONST_MENU_CELL_IDENTIFIRE
                                                                        indexPath:indexPath];
            
            [cell setView:_menuCellLists indexPath:indexPath];
            resultCell = cell;
            break;
        }
        default:
            break;
    }
    return resultCell;
}
#pragma mark - Private
- (void)setMenuCellLists
{
    _menuCellLists = [MenuCellEntity setCellLists].mutableCopy;
}

- (void)setTableView
{
    _contentView = [UITableView new];
    _contentView.backgroundColor = [UIColor clearColor];
    _contentView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _contentView.dataSource = self;
    _contentView.delegate = self;
}
@end
