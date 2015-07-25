//
//  TopViewController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/02.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//
#import "TopViewController.h"
@interface TopViewController ()

// Enum
typedef NS_ENUM(NSInteger, MenuSelectCell)
{
    MenuSelectSignup,
    MenuSelectHome,
    MenuSelectLicenses
};

typedef NS_ENUM(NSInteger, ChildViewController)
{
    MenuChildViewController = 0,
    SignupChildViewController = 1,
    ItemChildViewController = 2,
    WeatherChildViewController = 3,
};

@property (weak, nonatomic) IBOutlet UIView *weatherView;
@property (weak, nonatomic) IBOutlet UIView *itemView;
@property (weak, nonatomic) IBOutlet UIView *signupView;
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UIView *mainView;

@property (nonatomic,strong) MenuTableViewController *menuViewController;
@property (nonatomic,strong) SignupTableViewController *signupTableViewController;
@property (nonatomic,strong) ItemCollectionViewController *itemCollectionViewController;
@property (nonatomic,strong) OpenWeatherMapController * openWeatherMapController;
// BOOL
@property BOOL isSideMenu;

// IBAction
- (IBAction)tapSideMenuButton:(UIBarButtonItem *)sender;
@end

@implementation TopViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setBackGroundImage:@"subtle_stripes"];
    [self setDelegate];
}

#pragma mark - IBAction
- (IBAction)tapSideMenuButton:(UIBarButtonItem *)sender
{
    if (_isSideMenu)
        [self hideMenuView];
    else
        [self showMenuView];
}

#pragma mark - MenuTableViewControllerDelegate
- (void)didSelectMenuTableViewIndexPath:(NSIndexPath *)indexPath
{
    [self tapSideMenuButton:nil];
    [self removeMainView];
    switch (indexPath.row)
    {
        case MenuSelectSignup:
        {
            [_signupView addSubview:_signupTableViewController.view];
            self.navigationItem.title = @"Signup";
            [AnimationView transformAlpha:_signupView
                                    alpha:1.0f
                               completion:^(BOOL finished){}];
            return;
        }
        case MenuSelectHome:
        case MenuSelectLicenses:
        {
            [_itemView addSubview:_itemCollectionViewController.view];
            self.navigationItem.title = @"Home";
            [AnimationView transformAlpha:_itemView
                                    alpha:1.0f
                               completion:^(BOOL finished){}];
            return;
        }
    }
}

#pragma mark - ItemCollectionViewControllerDelegate / MenuTableViewControllerDelegate
- (void)showWetherView
{
    [AnimationView transformInit:_weatherView
                      completion:^(BOOL finished){}];
}
- (void)hideWetherView
{
    [AnimationView transformMove:_weatherView
                           moveX:CONST_ANIMATION_NONE
                           moveY:_weatherView.frame.size.height
                      completion:^(BOOL finished){}];
}

#pragma mark - private
- (void)showMenuView
{
    [AnimationView transformMove:_mainView
                           moveX:[NSObject screenWidth] * 2/ 5
                           moveY:CONST_ANIMATION_NONE
                      completion:^(BOOL finished){}];
    [AnimationView transformAlpha:_menuView alpha:1.0f
                       completion:^(BOOL finished) {}];
    _isSideMenu = YES;
}

- (void)hideMenuView
{
    [AnimationView transformInit:_mainView
                      completion:^(BOOL finished){}];
    [AnimationView transformAlpha:_menuView alpha:0.0f
                       completion:^(BOOL finished) {}];
    _isSideMenu = NO;
}

- (void)removeMainView
{
    [_itemCollectionViewController.view removeFromSuperview];
    [_signupTableViewController.view removeFromSuperview];
}

- (void)setDelegate
{
    _menuViewController = self.childViewControllers
    [MenuChildViewController];
    _signupTableViewController = self.childViewControllers
    [SignupChildViewController];
    _itemCollectionViewController = self.childViewControllers
    [ItemChildViewController];
    _openWeatherMapController = self.childViewControllers
    [WeatherChildViewController];
    
    _menuViewController.delegate = self;
    _itemCollectionViewController.delegate = self;
}
@end