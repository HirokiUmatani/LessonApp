//
//  ItemCollectionController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "ItemCollectionViewController.h"
#import "ItemCollectionViewCell.h"
#import "DownLoadMovieCoreDataManager.h"

@interface ItemCollectionViewController ()
@property (nonatomic, assign) CGFloat collectionViewOldOffset;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
// [view]item cell
@property (nonatomic, strong) NSMutableArray *itemCellLists;
@property (nonatomic, strong) ItemEntity *itemCellEntity;
@property (nonatomic, strong) ItemCollectionViewCell *itemCell;
// [data] download movie
@property (nonatomic, strong) NSArray *downloadMovieDataLists;
@property (nonatomic, strong) DownLoadMovieCoreDataManager *downLoadMovieCoreDataManager;
@property (nonatomic, strong) DownLoadMovie *downloadMovieEntity;

@end

@implementation ItemCollectionViewController
#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setBackGroundImage:@"subtle_stripes"];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setCellLists];
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

    _itemCell = [collectionView dequeueReusableCellWithReuseIdentifier:CONST_ITEM_CELL_IDENTIFIRE
                                                          forIndexPath:indexPath];
    [_itemCell updateView:_itemCellLists indexPath:indexPath];
    return _itemCell;
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
    
    _downLoadMovieCoreDataManager = [DownLoadMovieCoreDataManager new];
    _downloadMovieDataLists = [_downLoadMovieCoreDataManager fetchWithPredicate:nil];
    if (_downloadMovieDataLists.count == 0)
    {
        // TODO:Itemデータを作成未実装なので仮置き
        _itemCellEntity = [ItemEntity setEntity:normalCellType
                                   progressRait:0.0f
                                 thumbnailImage:[UIImage imageNamed:@"mario.png"]
                                    titleString:@"mario"];
        [_itemCellLists addObject:_itemCellEntity];
        return;
    }
    
    for (_downloadMovieEntity in _downloadMovieDataLists)
    {
        _itemCellEntity = [ItemEntity setEntity:normalCellType
                                   progressRait:_downloadMovieEntity.downloadRait
                                 thumbnailImage:[UIImage imageNamed:@"mario.png"]
                                        titleString:@"mario"];
        [_itemCellLists addObject:_itemCellEntity];
    }
}
@end
