//
//  ItemCollectionController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MovieCollectionViewController.h"
#import "MovieCollectionViewCell.h"
#import "MoviePropertyManager.h"
@interface MovieCollectionViewController ()
@property (nonatomic, assign) CGPoint collectionViewOldOffset;
@property (nonatomic, strong) NSMutableArray *itemCellLists;
@property (nonatomic, strong) MovieEntity *itemCellEntity;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) IndicatorView *indicator;
@end

@implementation MovieCollectionViewController
#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
- (void)indicatorStop
{
    [_indicator stop];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setCellLists];
    [_collectionView reloadData];
    
    _indicator= [[IndicatorView alloc]initWithTarget:self.navigationController.view
                                          userEnable:YES
                                             message:nil
                                     backgroundColor:[UIColor blackColor] fontColor:[UIColor whiteColor]];
    [_indicator start];
    [self performSelector:@selector(indicatorStop)
               withObject:nil afterDelay:2.0f];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _collectionViewOldOffset = [scrollView contentOffset];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint currentPoint = [scrollView contentOffset];
    if(_collectionViewOldOffset.y > currentPoint.y)
        [_delegate showWetherView];
    else
        [_delegate hideWetherView];
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

    MovieCollectionViewCell *movieCell = [collectionView dequeueReusableCellWithReuseIdentifier:CONST_MOVIE_CELL_IDENTIFIRE
                                                          forIndexPath:indexPath];
    [movieCell updateView:_itemCellLists indexPath:indexPath];
    return movieCell;
}
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate didSelectMovieCollectionViewIndexPath:indexPath];
    [self performSegueWithIdentifier:@"DetailViewController" sender:self];
}
#pragma mark - private
- (void)setCellLists
{
    _itemCellLists = @[].mutableCopy;
    MoviePropertyManager *moviePropertyManager = [MoviePropertyManager new];
    _itemCellLists = [moviePropertyManager fetchMovieEntityList].mutableCopy;
}
@end
