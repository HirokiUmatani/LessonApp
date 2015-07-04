//
//  MoviewViewController.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/27.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>

@interface MoviewViewController : UIViewController
@property (strong, nonatomic) MPMoviePlayerController *moviePlayerController;
- (void)setMovieURLString:(NSString *)urlString;
- (void)start;
- (void)stop;
@end