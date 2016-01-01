//
//  ViewController.m
//  LicenseViewer
//
//  Created by hirokiumatani on 2015/12/31.
//  Copyright © 2015年 hirokiumatani. All rights reserved.
//

#import "ViewController.h"
#import "LicenseViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic,strong)LicenseViewController *licenseViewController;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _licenseViewController = [LicenseViewController new];
    [AutoLayout baseView:_contentView addSubView:_licenseViewController.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
