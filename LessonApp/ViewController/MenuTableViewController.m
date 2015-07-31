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
@property (nonatomic, strong)NSMutableArray *cellLists;
@property (nonatomic, strong)MenuPropertyManager *menuPropertyManager;
@property (nonatomic, strong)MenuEntity *menuEntity;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MenuTableViewController
#pragma mark - Life Cycle
- (void)loadView
{
    [super loadView];
    [self setBackGroundImage:@"subtle_stripes"];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setCellLists];
}

- (void)viewWillDisappear:(BOOL)animated
{
    _delegate = nil;
    [super viewWillDisappear:animated];
}
- (void)dealloc
{
    _cellLists = nil;
    _menuPropertyManager = nil;
    _menuEntity = nil;
    _tableView = nil;
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
    return _cellLists.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    _menuEntity = [MenuEntity new];
    _menuEntity = _cellLists[indexPath.row];
    switch (_menuEntity.cellType)
    {
        case titleCellType:
        {
            MenuTableViewCell *menuCell = [tableView dequeueReusableCellWithIdentifier:CONST_MENU_CELL_IDENTIFIRE
                                                                      forIndexPath:indexPath];
            [menuCell updateView:_cellLists indexPath:indexPath];
            cell = menuCell;
            break;
        }
    }
    return cell;
}
#pragma mark - Private
- (void)setCellLists
{
    _menuPropertyManager = [MenuPropertyManager new];
    _cellLists = [_menuPropertyManager fetchMenuEntityList].mutableCopy;
}

@end
