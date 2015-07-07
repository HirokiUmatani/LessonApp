//
//  TopViewController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/02.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//
#import "TopViewController.h"
#import "DetailViewController.h"
#import "UserCoreDataManager.h"

@interface TopViewController ()

// Enum
typedef NS_ENUM(NSInteger, MenuSelectCell)
{
    MenuSelectSignup,
    MenuSelectHome,
    MenuSelectLicenses
};

// Controller
@property (nonatomic,strong) ItemCollectionViewController  *itemViewController;
@property (nonatomic,strong) OpenWeatherMapViewController  *weatherViewController;
@property (nonatomic,strong) MenuTableViewController       *menuViewController;
@property (nonatomic,strong) SignupTableViewController     *signupViewController;
@property (nonatomic,strong) DetailViewController *detailViewController;

@property (nonatomic,strong) LocalServer *localServer;
// AutoLayout
@property (nonatomic,strong) AutoLayout *itemViewAutoLayout;
@property (nonatomic,strong) AutoLayout *signupViewAutoLayout;
@property (nonatomic,strong) AutoLayout *weatherViewAutoLayout;
@property (nonatomic,strong) AutoLayout *menuViewAutoLayout;


// BOOL
@property BOOL isSideMenu;
@property BOOL isDetailView;

// IBOutlet[BaseView]
@property IBOutlet UIView *mainLayoutView;
@property IBOutlet UIView *weatherLayoutView;
@property IBOutlet UIView *menuLayoutView;

// IBAction
- (IBAction)tapSideMenuButton:(UIBarButtonItem *)sender;
@end

@implementation TopViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setBackGroundImage:@"subtle_stripes"];
    [self setOpenWeatherMapViewController];
    [self setMenuTableViewController];
    [self setItemCollectionViewController];

    [self setWeatherViewAutoLayout];
    [self setMenuTableViewAutoLayout];
    [self setItemCollectionViewAutoLayout];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    /***** local server*****/
    _localServer = [LocalServer new];
    [_localServer test];
    
    
    /***** core data *****/
    UserCoreDataManager *test = [UserCoreDataManager new];
    //insert check
    NSString *dateString = [NSObject stringFromDate:[NSDate date]];
    
    [test insertEntityWithName:[NSString stringWithFormat:@"%d",rand()]
                          mail:[NSString stringWithFormat:@"%d",rand()]
                        create:dateString
                        update:dateString
                        finish:^(BOOL finished)
    {
        
    }];
         
    // fetch check
    [test fetchEntityListWithPredicate:nil
                            fetchLists:^(NSArray *fetchDataLists)
    {
<<<<<<< HEAD
        for (User *userEntity in fetchDataLists)
        {
            NSString * name = userEntity.name;
            NSString * mail = userEntity.mail;
            NSString * update = userEntity.update;
            NSString * create = userEntity.create;
        }
=======
>>>>>>> feature/issue14_enhance_local_server

    }
                            fetchError:^(NSError *error)
    {
        
    }];
    
    
    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    _localServer = nil;
    [super viewWillDisappear:animated];
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
                 self.navigationItem.title = @"Signup";
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
                 self.navigationItem.title = @"Home";
                 [AnimationView transformAlpha:_itemViewController.contentView
                                         alpha:1.0f
                                    completion:^(BOOL finished){}];
             }];
            return;
        }
        case MenuSelectLicenses:
        {
            
        }
            return;
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
    [self performSegueWithIdentifier:@"DetailViewController" sender:self];
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
    _menuLayoutView.alpha = 0.0f;
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"DetailViewController"])
    {
        
    }
}

#pragma mark - Dealloc
- (void)deallocObject
{
    // Controller
    _itemViewController     = nil;
    _weatherViewController  = nil;
    _menuViewController     = nil;
    _signupViewController   = nil;
    
    // AutoLayout
    _itemViewAutoLayout     = nil;
    _signupViewAutoLayout   = nil;
    _weatherViewAutoLayout  = nil;
    _menuViewAutoLayout     = nil;
}
@end
