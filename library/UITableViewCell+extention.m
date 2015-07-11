//
//  UITableViewCell+extention.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/28.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "UITableViewCell+extention.h"

@implementation UITableViewCell(extention)
- (id)initWithTableView:(UITableView *)tableView
                xibName:(NSString *)xibName
         cellIdentifire:(NSString *)cellIdentifire
              indexPath:(NSIndexPath *)indexPath
{
    UINib *nib = [UINib nibWithNibName:xibName
                                bundle:nil];
    [tableView registerNib:nib
    forCellReuseIdentifier:cellIdentifire];
    
    return [tableView dequeueReusableCellWithIdentifier:cellIdentifire
                                           forIndexPath:indexPath];
}
@end
