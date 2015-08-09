//
//  BaseContainerviewController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/08/09.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "BaseContainerviewController.h"

@interface BaseContainerviewController ()

@end

@implementation BaseContainerviewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setBackGroundImage:@"subtle_stripes"];
    [self setViewController:@"MovieCollectionViewController"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (void)setViewController:(NSString *)identifire
{
    [self removeContainerView];
    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:identifire];
    [self addChildViewController:viewController];
    [viewController didMoveToParentViewController:self];
    [self.view addSubview:viewController.view];
}

- (void)removeContainerView
{
    for (UIViewController *viewController in self.childViewControllers)
    {
        [viewController.view removeFromSuperview];
        [viewController removeFromParentViewController];
    }
}
@end
