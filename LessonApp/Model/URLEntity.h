//
//  URLEntity.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/26.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLEntity : NSObject
@property (nonatomic,strong)NSString * url;
@property (nonatomic,strong)NSString * scheme;
@property (nonatomic,strong)NSString * host;
@property (nonatomic,strong)NSString * path;
@property (nonatomic,strong)NSArray  * paths;
@property (nonatomic,strong)NSString * lastPath;
@property (nonatomic,strong)NSString * fileName;
@property (nonatomic,strong)NSString * extention;
@end
