//
//  UICollectionViewCell+extention.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/28.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@interface UICollectionViewCell(extention)
- (id)initWithCollectionView:(UICollectionView *)collectionView
                     xibName:(NSString *)xibName
              cellIdentifire:(NSString *)cellIdentifire
                   indexPath:(NSIndexPath *)indexPath;
@end
