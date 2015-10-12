//
//  UIViewController+extention.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/04.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "UIViewController+extention.h"

@implementation UIViewController(extention)

- (void)setBackGroundImage:(NSString *)imageName
{
    UIImage *backGroundImage = [UIImage imageNamed:imageName];
    self.view.backgroundColor = [UIColor colorWithImage:backGroundImage];
}
@end
