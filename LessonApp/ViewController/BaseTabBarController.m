//
//  BaseTabBarController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/10/16.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [UITabBar appearance].tintColor = [UIColor colorWithImageName:CONST_BASE_TAB_BAR_BACK_GROUND_COLOR];
}
@end
