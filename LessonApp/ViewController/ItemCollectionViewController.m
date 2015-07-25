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
@interface ItemCollectionViewController ()
// Float
@property CGFloat collectionViewOldOffset;
// NSMutableArray
@property NSMutableArray * itemCellLists;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation ItemCollectionViewController
static NSString *CONST_VIEW_CLASS_NAME = @"ItemCollectionView";
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setBackGroundImage:@"subtle_stripes"];
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
    [self performSegueWithIdentifier:@"DetailViewController" sender:self];
}
#pragma mark - private
- (void)setCellLists
{
    _itemCellLists = @[].mutableCopy;
    for (NSInteger i = 0; i < 1; i++)
        [_itemCellLists addObject:@""];
}
@end
