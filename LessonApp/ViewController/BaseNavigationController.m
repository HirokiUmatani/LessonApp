//
//  BaseNavigationController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/10/16.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [UINavigationBar appearance].barTintColor = [UIColor colorWithColorCode:CONST_BASE_NAVIGATIN_BAR_BACK_GROUND_COLOR alpha:1.0];
}

@end
