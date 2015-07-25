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
#import "SignupCellEntity.h"

@interface SignupTableViewController ()
@property NSMutableArray * signupCellLists;
@property CGFloat defaultTableViewheight;;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableView_bottomConstraint;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) Notification *keyboardNotification;
@end

@implementation SignupTableViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setBackGroundImage:@"subtle_stripes"];
    [self setCellLists];
    [self setKeyBoardReciveNotification];
}

#pragma mark - UITableViewDataSource
// required
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSInteger cellCount = 0;
    cellCount = _signupCellLists.count;
    return cellCount;
}
// required
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *resultCell = [UITableViewCell new];
    resultCell.backgroundColor = [UIColor clearColor];
    SignupCellEntity *signupCellEntity = [SignupCellEntity new];
    signupCellEntity = _signupCellLists[indexPath.row];
    switch (signupCellEntity.cellType)
    {
        case titleAndTextFieldCellType:
        {
            SignupTableViewCell *cell = [[SignupTableViewCell alloc]
                                         initWithTableView:tableView
                                         xibName:CONST_SIGNUP_CELL_IDENTIFIRE
                                         cellIdentifire:CONST_SIGNUP_CELL_IDENTIFIRE
                                         indexPath:indexPath];
            
            [cell setView:_signupCellLists indexPath:indexPath];
            cell.textField.delegate = self;
            resultCell = cell;
            break;
        }
        case buttonCellType:
        {
            SignupButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CONST_SIGNUP_BUTTON_CELL_IDENTIFIRE forIndexPath:indexPath];
            resultCell = cell;
            break;
        }
        case blankCellType:
        default:
            break;
    }
    return resultCell;
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
#pragma mark - Private
- (void)setKeyBoardReciveNotification
{
    _keyboardNotification = [Notification new];
    [_keyboardNotification setReciveNotificationAddObserver:self
                                          selector:@selector(keyboardWillShow:)
                                              name:UIKeyboardWillShowNotification
                                            object:nil];
    
    [_keyboardNotification setReciveNotificationAddObserver:self
                                          selector:@selector(keyboardWillHide:)
                                              name:UIKeyboardWillHideNotification
                                            object:nil];
    
}

- (void)removeKeyBoardNotification
{
    [_keyboardNotification removeObserver:self forKeyPath:UIKeyboardWillHideNotification];
    [_keyboardNotification removeObserver:self forKeyPath:UIKeyboardWillShowNotification];
    _keyboardNotification = nil;
}
- (void)keyboardWillShow:(NSNotification *)notification
{
    CGRect keyboardRect = [[[notification userInfo]
                            objectForKey:UIKeyboardFrameEndUserInfoKey]
                           CGRectValue];
    CGFloat keyboardHeight = keyboardRect.size.height;
    _tableView_bottomConstraint.constant -= keyboardHeight;
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    CGRect keyboardRect = [[[notification userInfo]
                            objectForKey:UIKeyboardFrameEndUserInfoKey]
                           CGRectValue];
    CGFloat keyboardHeight = keyboardRect.size.height;
    _tableView_bottomConstraint.constant += keyboardHeight;
}

- (void)setCellLists
{
    _signupCellLists = [SignupCellEntity setCellLists].mutableCopy;
}

@end
