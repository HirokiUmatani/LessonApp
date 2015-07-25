//
//  ItemCollectionViewCell.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "ItemCollectionViewCell.h"
#import "ItemCellEntity.h"
@interface ItemCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UIProgressView *downloadBar;
- (IBAction)tapDownloadButton:(UIButton *)sender;
@end

@implementation ItemCollectionViewCell
NSString * const CONST_ITEM_CELL_IDENTIFIRE = @"ItemCollectionViewCell";
- (IBAction)tapDownloadButton:(UIButton *)sender
{
    MovieDownloadController *movieDownloadController = [MovieDownloadController new];
    movieDownloadController.delegate = self;
    [movieDownloadController download];
}
#pragma mark - MovieDownloadControllerDelegate
- (void)updateDownloadProgressBar:(CGFloat)barFloat
{
    __MAIN_THREAD_START__
    [self.downloadBar setProgress:barFloat animated:YES];
    __THREAD_END__
}

- (void)updateView:(NSArray *)cellLists
         indexPath:(NSIndexPath *)indexPath
{
    ItemCellEntity *itemCellEntity = [ItemCellEntity new];
    itemCellEntity = cellLists[indexPath.row];
    _thumbnailView.image = itemCellEntity.thumbnailImage;
    [_downloadBar setProgress:itemCellEntity.progressRait animated:YES];
}
@end
