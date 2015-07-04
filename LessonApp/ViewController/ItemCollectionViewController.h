//
//  ItemCollectionController.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "ItemCollectionView.h"

@protocol ItemCollectionViewControllerDelegate <NSObject>
- (void)hideWetherView;
- (void)showWetherView;
- (void)didSelectItemCollectionViewIndexPath:(NSIndexPath *)indexPath;
@end

@interface ItemCollectionViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property ItemCollectionView *contentView;
@property (nonatomic, weak) id<ItemCollectionViewControllerDelegate> delegate;
@end
