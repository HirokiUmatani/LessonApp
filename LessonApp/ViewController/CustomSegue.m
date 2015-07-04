//
//  CustomSegue.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/04.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "CustomSegue.h"

@implementation CustomSegue
- (void)perform
{
    // from view
    UIViewController *sourceViewController = (UIViewController *)self.sourceViewController;
    // to view
    UIViewController *destinationViewController = (UIViewController *)self.destinationViewController;
    
    // push navigation controller
    [sourceViewController.navigationController pushViewController:destinationViewController animated:YES];
}
@end
