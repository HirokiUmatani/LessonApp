//
//  MoviePropertyManager.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/08/22.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MovieEntity.h"

@interface MoviePropertyManager : PropertyListManager
- (NSArray *)fetchMovieEntityList;
@end
