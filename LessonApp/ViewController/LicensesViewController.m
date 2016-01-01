//
//  LicensesViewController.m
//  LessonApp
//
//  Created by hirokiumatani on 2016/01/01.
//  Copyright © 2016年 hirokiumatani. All rights reserved.
//

#import "LicensesViewController.h"

@interface LicensesViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic,strong) LicenseViewController *licenseViewController;
@end

@implementation LicensesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _licenseViewController = [LicenseViewController new];
    [AutoLayout baseView:_contentView addSubView:_licenseViewController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
