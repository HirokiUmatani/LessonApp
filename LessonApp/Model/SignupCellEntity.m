//
//  SignupCellEntity.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/11.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "SignupCellEntity.h"

@implementation SignupCellEntity
+ (NSArray *)setCellLists
{
    NSMutableArray *tempList =@[].mutableCopy;
    SignupCellEntity *entity;
    entity = SignupCellEntity.new;
    entity.cellType = blankCellType;
    [tempList addObject:entity];
    
    entity = SignupCellEntity.new;
    entity.cellType = titleAndTextFieldCellType;
    entity.title = @"Nick Name";
    [tempList addObject:entity];
    
    entity = SignupCellEntity.new;
    entity.cellType = titleAndTextFieldCellType;
    entity.title = @"Mail Address";
    [tempList addObject:entity];
    
    entity = SignupCellEntity.new;
    entity.cellType = titleAndTextFieldCellType;
    entity.title = @"Password";
    [tempList addObject:entity];
    
    entity = SignupCellEntity.new;
    entity.cellType = titleAndTextFieldCellType;
    entity.title = @"Password\n(Confirm)";
    [tempList addObject:entity];
    
    entity = SignupCellEntity.new;
    entity.cellType = buttonCellType;
    [tempList addObject:entity];
    
    return tempList;
}
@end
