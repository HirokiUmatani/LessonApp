//
//  LicenseViewController.m
//  LicenseViewer
//
//  Created by hirokiumatani on 2015/12/31.
//  Copyright © 2015年 hirokiumatani. All rights reserved.
//

#import "LicenseViewController.h"
#import "LicenseManager.h"
#import "LicenseEntity.h"
#import "LicenceCellTableViewCell.h"

@interface LicenseViewController ()
@property (nonatomic,strong)NSArray  *licenseEntityLists;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
#define CELL @"LicenceCellTableViewCell"
#define CONTROLLER @"LicenseViewController"
@implementation LicenseViewController
- (id)init
{
    if (self == [super init])
    {
        self  = [self initWithNibName:CONTROLLER bundle:nil];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchLicenseLists];
    [self setXib];
    [_tableView reloadData];
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _licenseEntityLists.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    LicenseEntity *licenseEntity = [LicenseEntity new];
    licenseEntity = _licenseEntityLists[section];
    return licenseEntity.title;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView loadCellForRowAtIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView loadCellForRowAtIndexPath:indexPath];
    [cell layoutSubviews];
    CGFloat height = [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return height;
}

- (void)fetchLicenseLists
{
    LicenseManager * manager = [LicenseManager new];
    _licenseEntityLists = [manager fetchLisenceEntityList];
}

- (void)setXib
{
    UINib *nib = [UINib nibWithNibName:CELL bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:CELL];
}

- (UITableViewCell *)tableView:(UITableView *)tableView loadCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LicenceCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL forIndexPath:indexPath];
    [cell updateCellWithLicenseEntity:_licenseEntityLists[indexPath.section]];
    return cell;
}
@end
