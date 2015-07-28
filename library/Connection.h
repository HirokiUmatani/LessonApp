//
//  Connection.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/28.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Connection : NSObject <NSStreamDelegate>
- (void)connectWithURL:(NSString *)url
                  port:(NSUInteger)port;
@end
