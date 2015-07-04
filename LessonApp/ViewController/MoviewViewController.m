//
//  MoviewViewController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/27.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MoviewViewController.h"

@implementation MoviewViewController
- (id)init
{
    if (self != [super init])
        return self;
    
    _moviePlayerController = [MPMoviePlayerController new];
    return self;
}
- (void)setMovieURLString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    [_moviePlayerController setContentURL:url];
}
- (void)start
{
    [_moviePlayerController prepareToPlay];
}
- (void)stop
{
    [_moviePlayerController stop];
}
@end
