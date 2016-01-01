//
//  LicenceCellTableViewCell.h
//  LicenseViewer
//
//  Created by hirokiumatani on 2015/12/31.
//  Copyright © 2015年 hirokiumatani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LicenseEntity.h"
@interface LicenceCellTableViewCell : UITableViewCell
- (void)updateCellWithLicenseEntity:(LicenseEntity *)licenseEntity;
@end
