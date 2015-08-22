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
- (BOOL)updatePropertyListWithPlist:(NSString *)plist
                          predicate:(NSDictionary *)predicate
{
    NSArray *fetchLists = [self fetchPropertyListWithPlist:plist];
    NSString* propertyDataFile = [[NSBundle mainBundle]pathForResource:plist
                                                                ofType:@"plist"];
    for (NSInteger i = 0; i < fetchLists.count; i++)
    {
        
    }
    // write
    BOOL result =[fetchLists writeToFile:propertyDataFile atomically:YES];
    if (!result) {
        NSLog(@"ファイルの書き込みに失敗");
    }
    
    NSLog(@"ファイルの書き込みが完了しました");
    return result;
}
- (NSDictionary *)predicateWithKey:(NSString *)key
                             value:(NSString *)value
{
    return @{key:value}.copy;
}
@end
