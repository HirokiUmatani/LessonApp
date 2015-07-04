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
};

// Controller
@property (nonatomic,strong) ItemCollectionViewController  *itemViewController;
@property (nonatomic,strong) OpenWeatherMapViewController  *weatherViewController;
@property (nonatomic,strong) MenuTableViewController       *menuViewController;
@property (nonatomic,strong) SignupTableViewController     *signupViewController;
@property (nonatomic,strong) DetailViewController          *detailViewController;

// AutoLayout
@property (nonatomic,strong) AutoLayout *itemViewAutoLayout;
@property (nonatomic,strong) AutoLayout *signupViewAutoLayout;
@property (nonatomic,strong) AutoLayout *weatherViewAutoLayout;
@property (nonatomic,strong) AutoLayout *menuViewAutoLayout;
@property (nonatomic,strong) AutoLayout *detailViewAutoLayout;


// BOOL
@property BOOL isSideMenu;
@property BOOL isDetailView;

// IBOutlet[BaseView]
@property IBOutlet UIView *mainLayoutView;
@property IBOutlet UIView *weatherLayoutView;
@property IBOutlet UIView *menuLayoutView;
@property IBOutlet UIView *detailLayoutView;

// IBAction
- (IBAction)tapSideMenuButton:(UIBarButtonItem *)sender;
@end

@implementation TopViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setOpenWeatherMapViewController];
    [self setMenuTableViewController];
    [self setItemCollectionViewController];

    [self setWeatherViewAutoLayout];
    [self setMenuTableViewAutoLayout];
    [self setItemCollectionViewAutoLayout];

    [_detailLayoutView removeFromSuperview];
    [[LocalServer sharedInstance] start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
    switch (indexPath.row)
    {
        case MenuSelectSignup:
        {
            [AnimationView transformAlpha:_itemViewController.contentView
                                    alpha:0.0f
                               completion:^(BOOL finished)
             {
                 [_mainLayoutView removeConstraints:_itemViewAutoLayout.constraints];
                 [_itemViewController.contentView removeFromSuperview];
                 [self setSignupTableViewController];
                 [self setSignupTableViewAutoLayout];
                 [AnimationView transformAlpha:_signupViewController.contentView
                                         alpha:1.0f
                                    completion:^(BOOL finished){}];
             }];
            
            return;
        }
        case MenuSelectHome:
        {
            [AnimationView transformAlpha:_signupViewController.contentView
                                    alpha:0.0f
                               completion:^(BOOL finished)
             {
                 [_mainLayoutView removeConstraints:_signupViewAutoLayout.constraints];
                 [_signupViewController.contentView removeFromSuperview];
                 [self setItemCollectionViewController];
                 [self setItemCollectionViewAutoLayout];
                 [AnimationView transformAlpha:_itemViewController.contentView
                                         alpha:1.0f
                                    completion:^(BOOL finished){}];
             }];
            return;
        }
        default:
            return;
    }
}

#pragma mark - ItemCollectionViewControllerDelegate / MenuTableViewControllerDelegate
- (void)showWetherView
{
    [_weatherLayoutView addSubview:_weatherViewController.contentView];
    [_weatherLayoutView addConstraints:_weatherViewAutoLayout.constraints];
    [AnimationView transformInit:_weatherLayoutView
                      completion:^(BOOL finished)
     {
         
     }];
    [_weatherViewController startLocation];
}
- (void)hideWetherView
{
    [AnimationView transformMove:_weatherLayoutView
                           moveX:CONST_ANIMATION_NONE
                           moveY:_weatherLayoutView.frame.size.height
                      completion:^(BOOL finished)
     {
         [_weatherLayoutView removeConstraints:_weatherViewAutoLayout.constraints];
         [_weatherViewController.contentView removeFromSuperview];

     }];
}

#pragma mark - ItemCollectionViewControllerDelegate
- (void)didSelectItemCollectionViewIndexPath:(NSIndexPath *)indexPath
{
    
}
#pragma mark SignupTableViewControllerDelegate
- (void)keyboardWillShow:(NSNotification *)notification
{
    CGRect keyboardRect = [[[notification userInfo]
                            objectForKey:UIKeyboardFrameEndUserInfoKey]
                           CGRectValue];
    CGFloat keyboardHeight = keyboardRect.size.height;
    _signupViewAutoLayout.bottomConstraint.constant -= keyboardHeight;
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    CGRect keyboardRect = [[[notification userInfo]
                            objectForKey:UIKeyboardFrameEndUserInfoKey]
                           CGRectValue];
    CGFloat keyboardHeight = keyboardRect.size.height;
    _signupViewAutoLayout.bottomConstraint.constant += keyboardHeight;
}

#pragma mark - private
- (void)showMenuView
{
    [AnimationView transformMove:_mainLayoutView
                           moveX:[NSObject screenWidth] * 2/ 5
                           moveY:CONST_ANIMATION_NONE
                      completion:^(BOOL finished){}];
    [AnimationView transformAlpha:_menuLayoutView alpha:1.0f
                       completion:^(BOOL finished) {}];
    _isSideMenu = YES;
}

- (void)hideMenuView
{
    [AnimationView transformInit:_mainLayoutView
                      completion:^(BOOL finished){}];
    [AnimationView transformAlpha:_menuLayoutView alpha:0.0f
                       completion:^(BOOL finished) {}];
    _isSideMenu = NO;
}

- (void)removeMainViewItem
{
    [AnimationView transformAlpha:_signupViewController.contentView
                            alpha:0.6f
                       completion:^(BOOL finished)
    {
        [_mainLayoutView removeConstraints:_signupViewAutoLayout.constraints];
        [_signupViewController.contentView removeFromSuperview];
    }];
    
    [AnimationView transformAlpha:_itemViewController.contentView
                            alpha:0.6f
                       completion:^(BOOL finished)
    {
        [_mainLayoutView removeConstraints:_itemViewAutoLayout.constraints];
        [_itemViewController.contentView removeFromSuperview];
    }];
    
}
- (void)showDetailView
{
    _isDetailView = YES;
}

- (void)hideDetailView
{
    _isDetailView = NO;
}
#pragma mark - Set ViewController


- (void)setOpenWeatherMapViewController
{
    if (!_weatherViewController)
    {
        _weatherViewController = [OpenWeatherMapViewController new];
        [_weatherViewController loadView];
    }
    [_weatherLayoutView addSubview:_weatherViewController.contentView];
}

- (void)setMenuTableViewController
{
    if (!_menuViewController)
    {
        _menuViewController = [MenuTableViewController new];
        _menuViewController.delegate = self;
        [_menuViewController loadView];
 
    }
    [_menuLayoutView addSubview:_menuViewController.contentView];
}

- (void)setItemCollectionViewController
{
    if (!_itemViewController)
    {
        _itemViewController = [ItemCollectionViewController new];
        _itemViewController.delegate = self;
        [_itemViewController loadView];
    }
    [_mainLayoutView addSubview:_itemViewController.contentView];
}

- (void)setSignupTableViewController
{
    if (!_signupViewController)
    {
        _signupViewController = [SignupTableViewController new];
        _signupViewController.delegate = self;
        [_signupViewController loadView];
    }
    [_mainLayoutView addSubview:_signupViewController.contentView];
}
- (void)setDetailViewController
{
    if (!_detailViewController)
    {
        _detailViewController = [DetailViewController new];
        [_detailViewController loadView];
    }
    [_detailLayoutView addSubview:_detailViewController.contentView];
}

#pragma mark - Set Auto Layout

- (void)setWeatherViewAutoLayout
{
    if (!_weatherViewAutoLayout)
    {
        _weatherViewAutoLayout =
        [[AutoLayout alloc]initWithAddView:_weatherViewController.contentView baseView:_weatherLayoutView];
    }
    [_weatherLayoutView addConstraints:_weatherViewAutoLayout.constraints];
}
- (void)setMenuTableViewAutoLayout
{
    if (!_menuViewAutoLayout)
    {
        _menuViewAutoLayout = [[AutoLayout alloc]initWithAddView:_menuViewController.contentView baseView:_menuLayoutView];
    }
    [_menuLayoutView addConstraints:_menuViewAutoLayout.constraints];
}
- (void)setItemCollectionViewAutoLayout
{
    if (!_itemViewAutoLayout)
    {
        _itemViewAutoLayout = [[AutoLayout alloc]initWithAddView:_itemViewController.contentView baseView:_mainLayoutView];
    }
    [_mainLayoutView addConstraints:_itemViewAutoLayout.constraints];
}
- (void)setSignupTableViewAutoLayout
{
    if (!_signupViewAutoLayout)
    {
        _signupViewAutoLayout = [[AutoLayout alloc]initWithAddView:_signupViewController.contentView baseView:_mainLayoutView];
    }
    [_mainLayoutView addConstraints:_signupViewAutoLayout.constraints];
}

- (void)setDetailViewAutoLayout
{
    if (!_detailViewAutoLayout)
    {
        _detailViewAutoLayout = [[AutoLayout alloc]initWithAddView:_detailViewController.contentView baseView:_detailLayoutView];
    }
    [_detailLayoutView addConstraints:_detailViewAutoLayout.constraints];
}
#pragma mark - Dealloc
- (void)deallocObject
{
    // Controller
    _itemViewController     = nil;
    _weatherViewController  = nil;
    _menuViewController     = nil;
    _signupViewController   = nil;
    _detailViewController   = nil;
    // AutoLayout
    _itemViewAutoLayout     = nil;
    _signupViewAutoLayout   = nil;
    _weatherViewAutoLayout  = nil;
    _menuViewAutoLayout     = nil;
    _detailViewAutoLayout   = nil;
}
@end
