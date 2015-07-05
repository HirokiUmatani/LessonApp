//
//  Thread.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/04.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "Thread.h"
@interface Thread()

@property(nonatomic,assign) NSInteger threadCount;

@end

@implementation Thread
static Thread * _sharedInstance = nil;
static dispatch_once_t _onceToken;
#pragma mark - Life Cycle
+ (Thread *)sharedInstance
{
    if (_sharedInstance)
        return _sharedInstance;
    
    dispatch_once(&_onceToken, ^
    {
        _sharedInstance = [Thread new];
    });
    return _sharedInstance;
}

- (dispatch_queue_t)queue
{
    return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
}

- (void)asyncThread:(ThreadBlocks)blocks
{
START_FLAG:
    if ((_sharedInstance.threadCount >=
         _sharedInstance.maxThread)
        &&
        (_sharedInstance.maxThread !=0))
    {
        goto START_FLAG;
    }
    _sharedInstance.threadCount ++;
    dispatch_async([_sharedInstance queue],^
    {
        _sharedInstance.threadCount --;
        blocks();
    });
}

@end
