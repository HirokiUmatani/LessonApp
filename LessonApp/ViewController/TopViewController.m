//
//  TopViewController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/02.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//
#import "TopViewController.h"
#import "BaseContainerviewController.h"
@interface TopViewController ()
// Enum
typedef NS_ENUM(NSInteger,MenuSelectCell)
{
    MenuSelectSignup,
    MenuSelectHome,
    MenuSelectFavorite,
    MenuSelectDownload,
    MenuSelectLicenses
};
typedef NS_ENUM(NSInteger,TopContainerViewIndex)
{
    TopContainerMenuView,
    TopContainerMainView
};
// ViewController
@property (nonatomic,strong) BaseContainerviewController *containerViewController;
@property (nonatomic,strong) MenuTableViewController *menuTableViewController;
@property (nonatomic,strong) MovieCollectionViewController *movieCollectionViewController;
// Flagment
@property (nonatomic,assign) BOOL isShowSideMenu;
// IBOutlet
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIView *weatherView;
// IBAction
- (IBAction)tapSideMenuButton:(UIBarButtonItem *)sender;
@end

@implementation TopViewController
#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated
{
    [self setViewController];
    [self setDelegate];
}

#pragma mark - MenuTableViewControllerDelegate
- (void)didSelectMenuTableViewIndexPath:(NSIndexPath *)indexPath
{
    [self hideMenuView];
    switch (indexPath.row)
    {
        case MenuSelectSignup:
        {
            self.navigationItem.title = @"Signup";
            [_containerViewController setViewController:@"SignupTableViewController"];
            return;
        }
        case MenuSelectHome:
        {
            self.navigationItem.title = @"Home";
            [_containerViewController setViewController:@"MovieCollectionViewController"];
            return;
        }
        case MenuSelectFavorite:
        {
            self.navigationItem.title = @"Favorite";
            [_containerViewController removeContainerView];
            return;
        }
        case MenuSelectDownload:
        {
            self.navigationItem.title = @"Download";
            [_containerViewController removeContainerView];
            return;
        }
        case MenuSelectLicenses:
        {
            self.navigationItem.title = @"Licenses";
            [_containerViewController removeContainerView];
            return;
        }
    }
}

#pragma mark - MenuTableViewControllerDelegate
#pragma mark MovieCollectionViewControllerDelegate
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
                      completion:^(BOOL finished)
     {
         _isShowSideMenu = YES;
     }];
}

#pragma mark - MovieCollectionViewControllerDelegate
- (void)didSelectMovieCollectionViewIndexPath:(NSIndexPath *)indexPath
{
    [self hideMenuView];
}

#pragma mark - IBAction
- (IBAction)tapSideMenuButton:(UIBarButtonItem *)sender
{
    if (_isShowSideMenu)
        [self hideMenuView];
    else
        [self showMenuView];
}

#pragma mark - Private
- (void)setViewController
{
    _menuTableViewController = self.childViewControllers[TopContainerMenuView];
    _containerViewController = self.childViewControllers[TopContainerMainView];
    _movieCollectionViewController = _containerViewController.childViewControllers[0];
}

- (void)setDelegate
{
    _menuTableViewController.delegate = self;
    _movieCollectionViewController.delegate = self;
}

- (void)showMenuView
{
    [AnimationView transformMove:_mainView
                           moveX:[NSString screenWidth] * 2/ 5
                           moveY:CONST_ANIMATION_NONE
                      completion:^(BOOL finished)
     {
         _isShowSideMenu = YES;
     }];
}
- (void)hideMenuView
{
    [AnimationView transformInit:_mainView
                      completion:^(BOOL finished)
     {
         _isShowSideMenu = NO;
     }];
}
@end