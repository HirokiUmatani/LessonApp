//
//  LicenceCellTableViewCell.m
//  LicenseViewer
//
//  Created by hirokiumatani on 2015/12/31.
//  Copyright © 2015年 hirokiumatani. All rights reserved.
//

#import "LicenceCellTableViewCell.h"
@interface LicenceCellTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *footerLabel;



@end
@implementation LicenceCellTableViewCell

- (void)updateCellWithLicenseEntity:(LicenseEntity *)licenseEntity
{
    _footerLabel.text = licenseEntity.footerText;
}

@end
