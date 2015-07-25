//
//  SignupCellEntity.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/11.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "SignupCellEntity.h"

@implementation SignupCellEntity
+ (SignupCellEntity *)setCellEntity:(cellType)cellType
                              title:(NSString *)title
                          textField:(NSString *)textField
{
    SignupCellEntity *entiry = [SignupCellEntity new];
    entiry.cellType = cellType;
    entiry.title = title;
    entiry.textField = textField;
    return entiry;
}
+ (NSArray *)setCellLists
{
    NSString* propertyDataFile = [[NSBundle mainBundle]pathForResource:@"SignupCellPropertyList"
                                                                ofType:@"plist"];
    NSArray *propertyDataList = [NSArray arrayWithContentsOfFile:propertyDataFile];
    NSMutableArray *results =@[].mutableCopy;
    for (NSDictionary *propertyDict in propertyDataList)
    {
        SignupCellEntity *entity = [SignupCellEntity new];
        entity = [self setCellEntity:[propertyDict[@"cellType"] integerValue]
                               title: propertyDict[@"title"]
                           textField: propertyDict[@"textField"]];
        [results addObject:entity];
    }
    return results;
}
@end
