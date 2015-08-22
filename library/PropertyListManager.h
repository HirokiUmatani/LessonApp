//
//  PropertyListFetcher.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/29.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@interface PropertyListManager : NSObject
- (NSArray *)fetchPropertyListWithPlist:(NSString *)plist;
- (BOOL)updatePropertyListWithPlist:(NSString *)plist
                          predicate:(NSDictionary *)predicate;
@end
