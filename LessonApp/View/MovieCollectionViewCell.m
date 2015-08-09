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
@end

@implementation MovieCollectionViewCell
NSString * const CONST_MOVIE_CELL_IDENTIFIRE = @"MovieCollectionViewCell";
#pragma mark - MovieDownloadControllerDelegate
- (void)updateDownloadProgressBar:(CGFloat)barFloat
{
    __MAIN_THREAD_START__
    if (barFloat == 1.0f)
    {
        
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
        return;
    }    
}
@end
