//
//  AnimationView.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/09.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@interface AnimationView : NSObject
typedef void (^AnimateFinished)(BOOL finished);
extern const CGFloat CONST_ANIMATION_DURATION_TIME;
extern const CGFloat CONST_ANIMATION_NONE;

+ (void)transformInit:(id)sender
           completion:(AnimateFinished)completion;

+ (void)transformScale:(id)sender
                scaleX:(CGFloat)x
                scaleY:(CGFloat)y
            completion:(AnimateFinished)completion;

+ (void)transformMove:(id)sender
                moveX:(CGFloat)x
                moveY:(CGFloat)y
           completion:(AnimateFinished)completion;


+ (void)transformAlpha:(id)sender
                 alpha:(CGFloat)alpha
            completion:(AnimateFinished)completion;

@end
