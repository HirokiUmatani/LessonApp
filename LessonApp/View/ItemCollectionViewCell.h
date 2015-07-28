//
//  ItemCollectionViewCell.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MovieDownloadController.h"
#import "ItemEntity.h"
@interface ItemCollectionViewCell : UICollectionViewCell<MovieDownloadControllerDelegate>
extern NSString * const CONST_ITEM_CELL_IDENTIFIRE;

- (void)updateView:(NSArray *)cellLists
         indexPath:(NSIndexPath *)indexPath;
@end
