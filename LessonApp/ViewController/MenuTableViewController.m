//
//  MenuTableViewController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MenuTableViewController.h"
#import "MenuTableViewCell.h"
#import "MenuPropertyManager.h"

@interface MenuTableViewController ()
@property (nonatomic, assign)CGFloat tableViewOldOffset;
@property (nonatomic, strong)NSMutableArray *menuCellLists;
@property (nonatomic, strong)MenuPropertyManager *menuPropertyManager;
@property (nonatomic, strong)MenuEntity *menuEntity;
@property (nonatomic, strong)MenuTableViewCell *menuCell;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MenuTableViewController
#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setBackGroundImage:@"subtle_stripes"];
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
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSInteger cellCount = 0;
    cellCount = _menuCellLists.count;
    return cellCount;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    _menuEntity = [MenuEntity new];
    _menuEntity = _menuCellLists[indexPath.row];
    switch (_menuEntity.cellType)
    {
        case titleCellType:
        {
            _menuCell = [tableView dequeueReusableCellWithIdentifier:CONST_MENU_CELL_IDENTIFIRE
                                                                      forIndexPath:indexPath];
            [_menuCell updateView:_menuCellLists indexPath:indexPath];
            cell = _menuCell;
            break;
        }
    }
    return cell;
}
#pragma mark - Private
- (void)setMenuCellLists
{
    _menuPropertyManager = [MenuPropertyManager new];
    _menuCellLists = [_menuPropertyManager fetchMenuListWithPlist:@"MenuCellPropertyList"].mutableCopy;
}

@end
