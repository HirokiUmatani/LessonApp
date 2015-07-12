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
    
    _player = [MPMoviePlayerController new];
    return self;
}
- (void)setMovieURLString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    [_player setContentURL:url];
}
- (void)start
{
    [_player prepareToPlay];
    [_player play];
}
- (void)stop
{
    [_player stop];
}
@end
