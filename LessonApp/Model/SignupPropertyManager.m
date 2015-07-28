//
//  SignupFetcher.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/29.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "SignupPropertyManager.h"

@implementation SignupPropertyManager
- (NSArray *)fetchSignupListWithPlist:(NSString *)plist
{
    NSArray *signupPlists = [self fetchPropertyListWithPlist:plist];
    return [self convertSignupEntityFromPlists:signupPlists];
}

- (NSArray *)convertSignupEntityFromPlists:(NSArray *)plists
{
   
    NSMutableArray *results =@[].mutableCopy;
    for (NSDictionary *propertyDict in plists)
    {
        SignupEntity *entity = [SignupEntity new];
        entity = [SignupEntity setEntity:[propertyDict[@"cellType"] integerValue]
                                   title: propertyDict[@"title"]
                               textField: propertyDict[@"textField"]];
        [results addObject:entity];
    }
    return results;
}
@end

