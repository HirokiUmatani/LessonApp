//
//  TopViewController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/02.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//
#import "TopViewController.h"
@interface TopViewController ()
typedef NS_ENUM(NSInteger, MenuSelectCell)
{
    MenuSelectSignup,
    MenuSelectHome,
    MenuSelectLicenses
};
typedef NS_ENUM(NSInteger, ChildViewController)
{
    MenuChildViewController,
    SignupChildViewController,
    MovieChildViewController,
    WeatherChildViewController,
};
@property (nonatomic,assign) BOOL isSideMenu;
@property (weak, nonatomic) IBOutlet UIView *mainView;
- (IBAction)tapSideMenuButton:(UIBarButtonItem *)sender;
@end

@implementation TopViewController
#pragma mark - Life Cycle
- (void)loadView
{
    [super loadView];
    [self setBackGroundImage:@"subtle_stripes"];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setDelegates];
}

#pragma mark - Button Action
- (IBAction)tapSideMenuButton:(UIBarButtonItem *)sender
{
    if (_isSideMenu)
        [self hideMenuView];
    else
        [self showMenuView];
}
- (void)showMenuView
{
    _isSideMenu = YES;
    [AnimationView transformMove:_mainView
                           moveX:[NSString screenWidth] * 2/ 5
                           moveY:CONST_ANIMATION_NONE
                      completion:^(BOOL finished){}];
}

- (void)hideMenuView
{
    _isSideMenu = NO;
    [AnimationView transformInit:_mainView
                      completion:^(BOOL finished){}];
}

#pragma mark - MenuTableViewControllerDelegate
- (void)didSelectMenuTableViewIndexPath:(NSIndexPath *)indexPath
{
    [self tapSideMenuButton:nil];
    [self removeViews];
    switch (indexPath.row)
    {
        case MenuSelectSignup:
        {
            [_mainView addSubview:[self.childViewControllers[SignupChildViewController] view]];
            self.navigationItem.title = @"Signup";
            [AnimationView transformAlpha:[self.childViewControllers[SignupChildViewController] view]
                                    alpha:1.0f
                               completion:^(BOOL finished){}];
            return;
        }
        case MenuSelectHome:
        case MenuSelectLicenses:
        {
            [_mainView addSubview:[self.childViewControllers[MovieChildViewController] view]];
            self.navigationItem.title = @"Home";
            [AnimationView transformAlpha:[self.childViewControllers[MovieChildViewController] view]
                                    alpha:1.0f
                               completion:^(BOOL finished){}];
            return;
        }
    }
}

#pragma mark - MenuTableViewControllerDelegate
#pragma mark ItemCollectionViewControllerDelegate
- (void)showWetherView
{
    [AnimationView transformInit:[self.childViewControllers[WeatherChildViewController] view]
                      completion:^(BOOL finished){}];
}
- (void)hideWetherView
{
    [AnimationView transformMove:[self.childViewControllers[WeatherChildViewController] view]
                           moveX:CONST_ANIMATION_NONE
                           moveY:[self.childViewControllers[WeatherChildViewController] view].frame.size.height
                      completion:^(BOOL finished){}];
}

#pragma mark - private
- (void)removeViews
{
    [[self.childViewControllers[SignupChildViewController] view] removeFromSuperview];
    [[self.childViewControllers[MovieChildViewController ] view] removeFromSuperview];
}
- (void)setDelegates
{
    [self.childViewControllers[MenuChildViewController ] setDelegate:self];
    [self.childViewControllers[MovieChildViewController] setDelegate:self];
}

@end