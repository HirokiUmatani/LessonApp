//
//  DetailViewController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/27.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "DetailViewController.h"
#import "MoviePlayerViewController.h"
@interface DetailViewController ()
@property (nonatomic, strong) MoviePlayerViewController * movieViewController;
@property (nonatomic,strong) LocalServer *localServer;
@property (weak, nonatomic) IBOutlet UIView *movieView;
@end

@implementation DetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self startLocalServer];
    [self initMoviePlayerView];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [_movieViewController movieStop];
    [_localServer stop];
    [super viewWillDisappear:animated];
}

- (void)dealloc
{
    _movieViewController = nil;
    _localServer = nil;
}

- (void)initMoviePlayerView
{
    _movieViewController = [MoviePlayerViewController new];
    [_movieViewController setMovieURLString:@"http://127.0.0.1:8080/movie/high_15.m3u8"];
    [self initMovieViewAutoLayout];
    
    
    [_movieViewController movieStart];
    
}
- (void)initMovieViewAutoLayout
{
    AutoLayout *movieAutoLayout =[AutoLayout baseView:_movieView addSubView:_movieViewController.player.view];
    
    [movieAutoLayout part:BOTTOM_CONSTRAINT margin:0];
    [_movieView layoutIfNeeded];
}

- (void)startLocalServer
{
    _localServer = [LocalServer new];
    [_localServer start];
}
@end
