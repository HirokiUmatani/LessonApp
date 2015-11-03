//
//  MoviePropertyManager.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/08/22.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MoviePropertyManager.h"

@implementation MoviePropertyManager
- (NSArray *)fetchMovieEntityList
{
    NSArray *propertyLists = [[self class] fetchArrayWithPlist:@"MoviePropertyList"];
    return [self convertMovieEntityListFromPlists:propertyLists];
}

- (NSArray *)convertMovieEntityListFromPlists:(NSArray *)plists
{
    
    NSMutableArray *results =@[].mutableCopy;
    for (NSDictionary *propertyDict in plists)
    {
        MovieEntity *entity = [MovieEntity new];
        entity = [MovieEntity setEntityWithCellType:[propertyDict[@"cellType"] integerValue]
                                       progressRait:[propertyDict[@"progressRait"] floatValue]
                                     thumbnailImage:[UIImage imageNamed:propertyDict[@"thumbnailImage"]]
                                              title:propertyDict[@"title"]
                                         isDownload:(BOOL)propertyDict[@"isDownload"]
                                         isFavorite:(BOOL)propertyDict[@"isFavorite"]];
        [results addObject:entity];
    }
    return results;
}
@end
