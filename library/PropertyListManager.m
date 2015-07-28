//
//  PropertyListFetcher.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/29.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "PropertyListManager.h"

@implementation PropertyListManager
- (NSArray *)fetchPropertyListWithPlist:(NSString *)plist
{
    NSString* propertyDataFile = [[NSBundle mainBundle]pathForResource:plist
                                                                ofType:@"plist"];
    return [NSArray arrayWithContentsOfFile:propertyDataFile];
}
@end
