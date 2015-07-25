//
//  ItemCollectionViewCell.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MovieDownloadController.h"

@interface ItemCollectionViewCell : UICollectionViewCell<MovieDownloadControllerDelegate>
extern NSString * const CONST_ITEM_CELL_IDENTIFIRE;
@property (weak, nonatomic) IBOutlet UIProgressView *downloadBar;

- (IBAction)tapDownloadButton:(UIButton *)sender;
- (void)updateDownloadProgressBar:(CGFloat)barFloat;

@end
