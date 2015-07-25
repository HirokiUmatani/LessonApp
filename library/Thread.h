//
//  Thread.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/04.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//


@interface Thread : NSObject
#define __MAIN_THREAD_START__ dispatch_async(dispatch_get_main_queue(), ^{

#define __SERIAL_THREAD_START__ dispatch_async(dispatch_queue_create("SERIAL", DISPATCH_QUEUE_SERIAL),^{

#define __PARALLEL_THREAD_START__ dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{

#define __THREAD_END__ });


@end
