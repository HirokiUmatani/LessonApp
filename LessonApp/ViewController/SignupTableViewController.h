//
//  SignupTableViewController.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/10.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@protocol SignupTableViewControllerDelegate
- (void)keyboardWillShow:(NSNotification *)notification;
- (void)keyboardWillHide:(NSNotification *)notification;
@end
@interface SignupTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property UITableView *contentView;
@property (nonatomic,assign) id<SignupTableViewControllerDelegate> delegate;
@end
