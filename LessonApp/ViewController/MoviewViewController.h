//
//  MoviewViewController.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/27.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>

@interface MoviewViewController : UIViewController
@property (strong, nonatomic) MPMoviePlayerController *player;
- (void)setMovieURLString:(NSString *)urlString;
- (void)movieStart;
- (void)movieStop;
@end
