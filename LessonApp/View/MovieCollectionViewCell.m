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
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIButton *downloadButton;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (strong ,nonatomic) IndicatorView *indicator;
@property (strong ,nonatomic) MovieDownloadController *movieDownloadController;
@property (strong ,nonatomic) UIWindow *window;
- (IBAction)tapFavoraiteButton:(UIButton *)sender;
- (IBAction)tapDownloadButton:(UIButton *)sender;
@end

@implementation MovieCollectionViewCell
NSString * const CONST_MOVIE_CELL_IDENTIFIRE = @"MovieCollectionViewCell";

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
- (IBAction)tapFavoraiteButton:(UIButton *)sender
{
    
}

- (IBAction)tapDownloadButton:(UIButton *)sender
{
    
    _movieDownloadController = [MovieDownloadController new];
    _movieDownloadController.delegate = self;

    [_movieDownloadController downloadMovieWithUrl:@"http://pear.chat/movie/high_15.m3u8"];
}

- (void)finishDownLoad
{
    

}
@end
