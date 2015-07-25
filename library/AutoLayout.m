//
//  AutoLayout.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/18.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "AutoLayout.h"

@implementation AutoLayout
- (id)initWithAddView:(id)addView
             baseView:(id)baseView
{
    if (self = [super init])
    {
        [addView setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        // Top
        _topConstraint = [NSLayoutConstraint constraintWithItem:addView
                                                      attribute:NSLayoutAttributeTop
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:baseView
                                                      attribute:NSLayoutAttributeTop
                                                     multiplier:1.0
                                                       constant:0.0];
        
        // Down
        _bottomConstraint = [NSLayoutConstraint constraintWithItem:addView
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:baseView
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:0.0];
        // Left
        _leftConstraint = [NSLayoutConstraint constraintWithItem:addView
                                                       attribute:NSLayoutAttributeLeft
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:baseView
                                                       attribute:NSLayoutAttributeLeft
                                                      multiplier:1.0
                                                        constant:0.0];
        
        
        // Right
        _rightConstraint = [NSLayoutConstraint constraintWithItem:addView
                                                        attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:baseView
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1.0
                                                         constant:0.0];
        // add Constraint List
        _constraints = @[].mutableCopy;
        [_constraints addObject:_topConstraint];
        [_constraints addObject:_bottomConstraint];
        [_constraints addObject:_leftConstraint];
        [_constraints addObject:_rightConstraint];
    }
    return self;
}
@end
