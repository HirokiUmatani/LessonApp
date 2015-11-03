//
//  SignupTableViewController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "SignupTableViewController.h"
#import "SignupTableViewCell.h"
#import "SignupButtonTableViewCell.h"
#import "SignupPropertyManager.h"

@interface SignupTableViewController ()
@property (nonatomic,strong) PEAR_KeyboardNotification_iOS *keyboardNotification;
@property (nonatomic, strong) NSMutableArray * signupCellLists;
@property (nonatomic, strong) SignupPropertyManager * signupFetcher;
@property (nonatomic, strong) SignupEntity *signupEntity;
@property (nonatomic, strong) SignupTableViewCell *signupCell;
@property (nonatomic, strong) SignupButtonTableViewCell *signupButtonCell;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableView_bottomConstraint;
@property (weak, nonatomic) IBOutlet BaseTableView *tableView;
@end

@implementation SignupTableViewController
#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setCellLists];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setKeyBoardNotification];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [self removeKeyBoardNotification];
    [super viewWillDisappear:animated];
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return _signupCellLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    _signupEntity = [SignupEntity new];
    _signupEntity = _signupCellLists[indexPath.row];
    switch (_signupEntity.cellType)
    {
        case titleAndTextFieldCellType:
        {
            _signupCell = [[SignupTableViewCell alloc] initWithTableView:tableView
                                                                 xibName:CONST_SIGNUP_CELL_IDENTIFIRE
                                                          cellIdentifire:CONST_SIGNUP_CELL_IDENTIFIRE
                                                               indexPath:indexPath];
            [_signupCell setView:_signupCellLists indexPath:indexPath];
            _signupCell.textField.delegate = self;
            cell = _signupCell;
            break;
        }
        case buttonCellType:
        {
            _signupButtonCell = [tableView dequeueReusableCellWithIdentifier:CONST_SIGNUP_BUTTON_CELL_IDENTIFIRE
                                                                forIndexPath:indexPath];
            cell = _signupButtonCell;
            break;
        }
        case blankCellType:
        default:
            break;
    }
    return cell;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark - KeyboardNotification
- (void)setKeyBoardNotification
{
    _keyboardNotification = [PEAR_KeyboardNotification_iOS sharedInstance];
    [_keyboardNotification setKeyBoardReciveNotification];
    _keyboardNotification.bottomConstraint = _tableView_bottomConstraint;
    _keyboardNotification.updateView = self.view;
    _keyboardNotification.offset = 64;
}

- (void)removeKeyBoardNotification
{
    [_keyboardNotification removeKeyBoardNotification];
}

#pragma mark - Private
- (void)setCellLists
{
    SignupPropertyManager * signupPropertyManager = [SignupPropertyManager new];
    _signupCellLists = @[].mutableCopy;
    _signupCellLists = [signupPropertyManager fetchSignupEntityList].mutableCopy;
}

@end
