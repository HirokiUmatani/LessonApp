//
//  UIView+extention.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/28.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "UIView+extention.h"

@implementation UIView(extention)
- (id)initWithXibName:(NSString *)xibName
{
    return [[NSBundle.mainBundle loadNibNamed:xibName
                                        owner:nil
                                      options:0] firstObject];
}
@end
