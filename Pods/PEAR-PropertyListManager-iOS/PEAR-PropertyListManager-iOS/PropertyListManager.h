//
//  PropertyListManager.h
//  PropertyListManager
//
//  Created by hirokiumatani on 2015/11/03.
//  Copyright © 2015年 hirokiumatani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PropertyListManager : NSObject
+ (NSArray *)fetchArrayWithPlist:(NSString *)plist;
+ (NSDictionary *)fetchDictWithPlist:(NSString *)plist;
@end
