//
//  AnimationView.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/09.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "AnimationView.h"

@implementation AnimationView

const CGFloat CONST_ANIMATION_DURATION_TIME = 0.4;
const CGFloat CONST_ANIMATION_NONE = 0.0;

+ (void)transformInit:(id)sender
           completion:(AnimateFinished)completion
{
    UIView *view = sender;
    [UIView animateWithDuration:CONST_ANIMATION_DURATION_TIME
                     animations:^
    {
        view.transform = CGAffineTransformIdentity;
    }
                     completion:^(BOOL finished)
    {
        completion(finished);
    }];
}
+ (void)transformScale:(id)sender
                scaleX:(CGFloat)x
                scaleY:(CGFloat)y
            completion:(AnimateFinished)completion
{
    UIView * view = sender;
    [UIView animateWithDuration:CONST_ANIMATION_DURATION_TIME
                     animations:^
    {
        view.transform = CGAffineTransformMakeScale(x, y);
    }
                     completion:^(BOOL finished)
    {
        completion(finished);
    }];
}
+ (void)transformMove:(id)sender
                moveX:(CGFloat)x
                moveY:(CGFloat)y
           completion:(AnimateFinished)completion
{
    UIView * view = sender;
    [UIView animateWithDuration:CONST_ANIMATION_DURATION_TIME
                     animations:^
    {
        view.transform = CGAffineTransformMakeTranslation(x, y);
    }
                     completion:^(BOOL finished)
    {
        completion(finished);
    }];
}

+ (void)transformAlpha:(id)sender
                alpha:(CGFloat)alpha
            completion:(AnimateFinished)completion
{
    UIView * view = sender;
    [UIView animateWithDuration:CONST_ANIMATION_DURATION_TIME
                     animations:^
    {
        view.alpha = alpha;
    }
                     completion:^(BOOL finished)
    {
        completion(finished);
    }];
}


@end
