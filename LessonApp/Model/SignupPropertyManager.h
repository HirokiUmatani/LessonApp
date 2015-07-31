//
//  SignupFetcher.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/29.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//
#import "SignupEntity.h"
@interface SignupPropertyManager : PropertyListManager
- (NSArray *)fetchSignupEntityList;
@end
