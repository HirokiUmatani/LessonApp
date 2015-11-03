//
//  UIColor+extention.h
//  UIColorExtention
//
//  Created by hirokiumatani on 2015/11/03.
//  Copyright © 2015年 hirokiumatani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(extention)
+ (UIColor *)colorWithColorCode:(NSString *)colorCode alpha:(CGFloat)alpha;
+ (UIColor *)colorWithImageName:(NSString *)imageName;
@end