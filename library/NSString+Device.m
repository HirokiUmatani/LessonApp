//
//  NSString+Device.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/18.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "NSString+Device.h"

@implementation NSObject(Device)
+ (NSDictionary *)appInfo
{
    return [NSBundle.mainBundle infoDictionary];
}
+ (CGRect)screenRect
{
    return UIScreen.mainScreen.bounds;
}
+ (CGFloat)screenWidth
{
    return self.screenRect.size.width;
}
+ (CGFloat)screenHeight
{
    return self.screenRect.size.height;
}
@end
