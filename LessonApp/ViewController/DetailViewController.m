//
//  DetailViewController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/27.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
- (void)loadView
{
    [super loadView];
    [self initDetailView];
}
- (void)initDetailView
{
    if (_contentView)
        return;
    _contentView = [[DetailView alloc]initWithXibName:@"DetailView"];
}
@end
