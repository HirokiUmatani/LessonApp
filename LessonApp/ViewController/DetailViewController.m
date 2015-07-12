//
//  DetailViewController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/27.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailView.h"
#import "MoviewViewController.h"
@interface DetailViewController ()
@property (nonatomic, strong) DetailView *contentView;
@property (nonatomic, strong) MoviewViewController * movieViewController;
@property (nonatomic, strong) AutoLayout *detailViewAutoLayout;
@property (nonatomic, strong) AutoLayout *movieViewAutoLayout;

@property (nonatomic,strong) LocalServer *localServer;

@property (weak, nonatomic) IBOutlet UIView *detailView;

@end

@implementation DetailViewController
- (void)loadView
{
    [super loadView];
    [self setBackGroundImage:@"subtle_stripes"];
    [self startLocalServer];
    [self initDetailView];
    [self initMoviePlayerView];
    [self initDetailViewAutoLayout];
    [self initMovieViewAutoLayout];
    
}

- (void)initDetailView
{
    if (_contentView)
        return;
    _contentView = [[DetailView alloc]initWithXibName:@"DetailView"];
    [_detailView addSubview:_contentView];
}

- (void)initMoviePlayerView
{
    _movieViewController =[MoviewViewController new];
    [_movieViewController setMovieURLString:@"http://127.0.0.1:8080/mario/high_15.m3u8"];//
    [_movieViewController start];
    [_contentView.movieView addSubview:_movieViewController.player.view];
}

- (void)initDetailViewAutoLayout
{
    if (_detailViewAutoLayout)
        return;
    _detailViewAutoLayout = [[AutoLayout alloc]initWithAddView:_contentView
                                                      baseView:_detailView];
    [_detailView addConstraints:_detailViewAutoLayout.constraints];
}

- (void)initMovieViewAutoLayout
{
    if (_movieViewAutoLayout)
        return;
    _movieViewAutoLayout = [[AutoLayout alloc]initWithAddView:_movieViewController.player.view
                                                     baseView:_contentView.movieView];
    [_contentView.movieView addConstraints:_movieViewAutoLayout.constraints];
}

- (void)startLocalServer
{
    /***** local server *****/
    _localServer = [LocalServer new];
    [_localServer start];
}
@end
