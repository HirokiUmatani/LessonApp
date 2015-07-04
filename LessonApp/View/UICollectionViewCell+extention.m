//
//  UICollectionViewCell+extention.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/28.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "UICollectionViewCell+extention.h"

@implementation UICollectionViewCell(extention)
- (id)initWithCollectionView:(UICollectionView *)collectionView
                     xibName:(NSString *)xibName
              cellIdentifire:(NSString *)cellIdentifire
                   indexPath:(NSIndexPath *)indexPath
{
    UINib *nib = [UINib nibWithNibName:xibName bundle:nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:cellIdentifire];
    return [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifire
                                                     forIndexPath:indexPath];
}
@end
