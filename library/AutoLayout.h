//
//  AutoLayout.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/18.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@interface AutoLayout : NSObject
@property (nonatomic,strong)NSLayoutConstraint *topConstraint;
@property (nonatomic,strong)NSLayoutConstraint *bottomConstraint;
@property (nonatomic,strong)NSLayoutConstraint *leftConstraint;
@property (nonatomic,strong)NSLayoutConstraint *rightConstraint;
@property (nonatomic,strong)NSLayoutConstraint *widthConstraint;
@property (nonatomic,strong)NSLayoutConstraint *heightConstraint;
@property (nonatomic,strong)NSMutableArray *constraints;

- (id)initWithAddView:(id)addView
             baseView:(id)baseView;

@end
