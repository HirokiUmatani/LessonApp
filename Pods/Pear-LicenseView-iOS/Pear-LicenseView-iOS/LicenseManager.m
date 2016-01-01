//
//  LicenseManager.m
//  LicenseViewer
//
//  Created by hirokiumatani on 2015/12/31.
//  Copyright © 2015年 hirokiumatani. All rights reserved.
//

#import "LicenseManager.h"
#import "LicenseEntity.h"
@implementation LicenseManager
- (NSArray *)fetchLisenceEntityList
{
    NSMutableArray *result = @[].mutableCopy;
    NSDictionary *licenceDict = [PropertyListManager fetchDictWithPlist:@"Pods-acknowledgements"];
    
    for (NSInteger i =0; i < [licenceDict[@"PreferenceSpecifiers"] count]; i++)
    {
        NSDictionary *items = licenceDict[@"PreferenceSpecifiers"][i];
        LicenseEntity * licenseEnity = [LicenseEntity new];
        licenseEnity.title = items[@"Title"];
        licenseEnity.footerText = items[@"FooterText"];
        licenseEnity.type = items[@"Type"];
        [result addObject:licenseEnity];
    }
    return result;
}
@end
