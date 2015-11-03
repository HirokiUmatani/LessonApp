//
//  PropertyListManager.m
//  PropertyListManager
//
//  Created by hirokiumatani on 2015/11/03.
//  Copyright © 2015年 hirokiumatani. All rights reserved.
//

#import "PropertyListManager.h"

@implementation PropertyListManager
+ (NSArray *)fetchArrayWithPlist:(NSString *)plist
{
    NSString* propertyDataFilePath = [[NSBundle mainBundle]pathForResource:plist
                                                                ofType:@"plist"];
   
    return [NSArray arrayWithContentsOfFile:propertyDataFilePath];
}

+ (NSDictionary *)fetchDictWithPlist:(NSString *)plist
{
    NSString* propertyDataFilePath = [[NSBundle mainBundle]pathForResource:plist
                                                                    ofType:@"plist"];
    return [NSDictionary dictionaryWithContentsOfFile:propertyDataFilePath];
}
@end
