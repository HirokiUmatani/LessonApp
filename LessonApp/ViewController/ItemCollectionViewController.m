//
//  ItemCollectionController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "ItemCollectionViewController.h"
#import "ItemCollectionViewCell.h"
#import "MovieDownloadController.h"
#import "ItemCellEntity.h"

@interface ItemCollectionViewController ()
@property CGFloat collectionViewOldOffset;
@property NSMutableArray * itemCellLists;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation ItemCollectionViewController
#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setBackGroundImage:@"subtle_stripes"];
    [self setCellLists];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_collectionView reloadData];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                  willDecelerate:(BOOL)decelerate
{
    if (_collectionViewOldOffset > scrollView.contentOffset.y)
        [_delegate showWetherView];
    else
        [_delegate hideWetherView];
    
    _collectionViewOldOffset = scrollView.contentOffset.y;
}
#pragma mark - UICollectionViewDataSource
// required
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return _itemCellLists.count;
}
// required
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    ItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:
                                    CONST_ITEM_CELL_IDENTIFIRE
                                                                             forIndexPath:
                                    indexPath];
    [cell updateView:_itemCellLists indexPath:indexPath];
    return cell;
}
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"DetailViewController" sender:self];
}
#pragma mark - private
- (void)setCellLists
{
    _itemCellLists = @[].mutableCopy;
    for (NSInteger i = 0; i < 1; i++)
    {
        ItemCellEntity *entity = [ItemCellEntity setCellEntity:normalCellType
                                                  progressRait:0.0f
                                                thumbnailImage:[UIImage imageNamed:@"mario.png"]
                                                   titleString:@"mario"];
        [_itemCellLists addObject:entity];
    }
}
@end
