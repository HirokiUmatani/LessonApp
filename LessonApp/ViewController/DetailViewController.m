//
//  DetailViewController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/27.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "DetailViewController.h"
#import "MoviewViewController.h"
@interface DetailViewController ()

@property (nonatomic, strong) MoviewViewController * movieViewController;

@property (nonatomic,strong) LocalServer *localServer;
@property (weak, nonatomic) IBOutlet UIView *movieView;

@end

@implementation DetailViewController
- (void)loadView
{
    [super loadView];
    [self setBackGroundImage:@"subtle_stripes"];
    [self startLocalServer];
    [self initMoviePlayerView];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [_movieViewController movieStop];
    _localServer = nil;
    [super viewWillDisappear:animated];
}

- (void)initMoviePlayerView
{
    _movieViewController = [MoviewViewController new];
    [_movieViewController setMovieURLString:@"http://127.0.0.1:8080/mario/high_15.m3u8"];
    [_movieView addSubview:_movieViewController.player.view];
    [self initMovieViewAutoLayout];
    [_movieViewController movieStart];
    
}
- (void)initMovieViewAutoLayout
{
    [AutoLayout addConstraintView:_movieViewController.player.view targetView:_movieView];
}

- (void)startLocalServer
{
    /***** local server *****/
    _localServer = [LocalServer new];
    [_localServer start];
}
@end
