//
//  DetailViewController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/27.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailView.h"
@interface DetailViewController ()
@property (nonatomic, strong) DetailView *contentView;
@property (nonatomic, strong) AutoLayout *detailViewAutoLayout;
@property (weak, nonatomic) IBOutlet UIView *detailView;

@end

@implementation DetailViewController
- (void)loadView
{
    [super loadView];
    [self setBackGroundImage:@"subtle_stripes"];
    [self initDetailView];
    [self initDetailViewAutoLayout];
    
}
- (void)initDetailView
{
    if (_contentView)
        return;
    _contentView = [[DetailView alloc]initWithXibName:@"DetailView"];
    [_detailView addSubview:_contentView];
}
- (void)initDetailViewAutoLayout
{
    if (_detailViewAutoLayout)
        return;
    _detailViewAutoLayout = [[AutoLayout alloc]initWithAddView:_contentView
                                                      baseView:_detailView];
    [_detailView addConstraints:_detailViewAutoLayout.constraints];
}
@end
