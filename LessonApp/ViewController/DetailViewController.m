//
//  DetailViewController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/27.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIView *detailView;

@end

@implementation DetailViewController
- (void)loadView
{
    [super loadView];
    [self initDetailView];
    [_detailView addSubview:_contentView];
}
- (void)initDetailView
{
    if (_contentView)
        return;
    _contentView = [[DetailView alloc]initWithXibName:@"DetailView"];
}
@end
