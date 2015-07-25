//
//  ItemCollectionController.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@protocol ItemCollectionViewControllerDelegate <NSObject>
- (void)hideWetherView;
- (void)showWetherView;
@end

@interface ItemCollectionViewController : UIViewController

@property (nonatomic, weak) id<ItemCollectionViewControllerDelegate> delegate;
@end
