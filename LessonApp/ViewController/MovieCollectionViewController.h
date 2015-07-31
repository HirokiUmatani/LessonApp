//
//  ItemCollectionController.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@protocol MovieCollectionViewControllerDelegate <NSObject>
- (void)hideWetherView;
- (void)showWetherView;
@end

@interface MovieCollectionViewController : UIViewController
@property (nonatomic, weak) id<MovieCollectionViewControllerDelegate> delegate;
@end
