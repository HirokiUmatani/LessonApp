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
// NSMutableArray
@property NSMutableArray * signupCellLists;
@property CGFloat defaultTableViewheight;;
@end

@implementation SignupTableViewController
- (void)loadView
{
    [super loadView];
    [self setTableView];
    [self setCellLists];
    [self setKeyBoardNotification];
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    [_delegate keyboardWillShow:notification];
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    [_delegate keyboardWillHide:notification];
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
    UITableViewCell *resultCell = UITableViewCell.new;
    SignupCellEntity *signupCellEntity = SignupCellEntity.new;
    signupCellEntity = _signupCellLists[indexPath.row];
    switch (signupCellEntity.cellType)
    {
        case titleAndTextFieldCellType:
        {
            SignupTableViewCell *cell = [[SignupTableViewCell alloc]initWithTableView:tableView
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
            SignupButtonTableViewCell *cell = [[SignupButtonTableViewCell alloc]initWithTableView:tableView
                                                                                          xibName:CONST_SIGNUP_BUTTON_CELL_IDENTIFIRE
                                                                                   cellIdentifire:CONST_SIGNUP_BUTTON_CELL_IDENTIFIRE
                                                                                        indexPath:indexPath];
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
- (void)setCellLists
{
    _signupCellLists = SignupCellEntity.setCellLists.mutableCopy;
}

- (void)setTableView
{
    _contentView = [UITableView new];
    _contentView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _contentView.dataSource = self;
    _contentView.delegate = self;
}
- (void)setKeyBoardNotification
{
    Notification *notification = [Notification new];
    [notification setReciveNotificationAddObserver:self
                                          selector:@selector(keyboardWillShow:)
                                              name:UIKeyboardWillShowNotification
                                            object:nil];
    
    [notification setReciveNotificationAddObserver:self
                                          selector:@selector(keyboardWillHide:)
                                              name:UIKeyboardWillHideNotification
                                            object:nil];
}
@end
