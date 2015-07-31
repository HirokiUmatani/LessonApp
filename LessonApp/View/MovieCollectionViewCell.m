//
//  ItemCollectionViewCell.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MovieCollectionViewCell.h"

@interface MovieCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UIProgressView *downloadBar;
- (IBAction)tapDownloadButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *downloadButton;
@end

@implementation MovieCollectionViewCell
NSString * const CONST_MOVIE_CELL_IDENTIFIRE = @"MovieCollectionViewCell";
- (IBAction)tapDownloadButton:(UIButton *)sender
{
    MovieDownloadController *movieDownloadController = [MovieDownloadController new];
    movieDownloadController.delegate = self;
    [movieDownloadController downloadMovieWithUrl:CONST_M3U8_DOWNLOAD_API];
}
#pragma mark - MovieDownloadControllerDelegate
- (void)updateDownloadProgressBar:(CGFloat)barFloat
{
    __MAIN_THREAD_START__
    [self.downloadBar setProgress:barFloat animated:YES];
    if (barFloat == 1.0f)
    {
        _downloadButton.titleLabel.text = @"Complete";
    }
    __THREAD_END__
}

- (void)updateView:(NSArray *)cellLists
         indexPath:(NSIndexPath *)indexPath
{
    MovieEntity *itemCellEntity = [MovieEntity new];
    itemCellEntity = cellLists[indexPath.row];
    _thumbnailView.image = itemCellEntity.thumbnailImage;
    if (itemCellEntity.progressRait == 1.0f)
    {
        _downloadButton.titleLabel.text = @"Complete";
        return;
    }
    [_downloadBar setProgress:itemCellEntity.progressRait animated:YES];
    }
@end
