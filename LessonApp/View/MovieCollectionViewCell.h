//
//  ItemCollectionViewCell.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MovieEntity.h"
#import "MovieDownloadController.h"
@interface MovieCollectionViewCell : UICollectionViewCell <MovieDownloadControllerDelegate>
extern NSString * const CONST_MOVIE_CELL_IDENTIFIRE;

- (void)updateView:(NSArray *)cellLists
         indexPath:(NSIndexPath *)indexPath;
@end
