//
//  ItemCollectionController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "ItemCollectionViewController.h"
#import "ItemCollectionViewCell.h"

@interface ItemCollectionViewController ()
// Float
@property CGFloat collectionViewOldOffset;
// NSMutableArray
@property NSMutableArray * itemCellLists;
@end

@implementation ItemCollectionViewController
static NSString *CONST_VIEW_CLASS_NAME = @"ItemCollectionView";
- (void)loadView
{
    [super loadView];
    [self setCollectionView];
    [self setCellLists];
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

    ItemCollectionViewCell *cell = [[ItemCollectionViewCell alloc]
                                    initWithCollectionView:collectionView
                                    xibName:CONST_ITEM_CELL_IDENTIFIRE 
                                    cellIdentifire:CONST_ITEM_CELL_IDENTIFIRE
                                    indexPath:indexPath];
    return cell;
}
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate didSelectItemCollectionViewIndexPath:indexPath];
}
#pragma mark - private
- (void)setCellLists
{
    _itemCellLists = @[].mutableCopy;
    for (NSInteger i = 0; i < 100; i++)
        [_itemCellLists addObject:CONST_BLANK_STRING];
}

- (void)setCollectionView
{
    _contentView = [[ItemCollectionView alloc]initWithXibName:CONST_VIEW_CLASS_NAME];
    _contentView.collectionView.dataSource = self;
    _contentView.collectionView.delegate = self;
}
@end
