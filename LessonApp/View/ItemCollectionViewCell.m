//
//  ItemCollectionViewCell.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "ItemCollectionViewCell.h"


@implementation ItemCollectionViewCell
NSString * const CONST_ITEM_CELL_IDENTIFIRE = @"ItemCollectionViewCell";
- (IBAction)tapDownloadButton:(UIButton *)sender
{
    MovieDownloadController *movieDownloadController = [MovieDownloadController new];
    movieDownloadController.movieDownloadControllerDelegate = self;
    [movieDownloadController download];
}
#pragma mark - MovieDownloadControllerDelegate
- (void)updateDownloadProgressBar:(CGFloat)barFloat
{
    __MAIN_THREAD_START__
    [self.downloadBar setProgress:barFloat animated:YES];
    __THREAD_END__
    
}
@end
