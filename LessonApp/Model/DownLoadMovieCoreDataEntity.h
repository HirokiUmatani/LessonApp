//
//  DownLoadMovie.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/26.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DownLoadMovieCoreDataEntity : NSManagedObject

@property (nonatomic, retain) NSString * create;
@property (nonatomic, retain) NSString * update;
@property (nonatomic, retain) NSData   * downloadURLList;
@property (nonatomic, retain) NSNumber * downloadCount;
@property (nonatomic, assign) CGFloat    downloadRait;
@property (nonatomic, retain) NSString * moviePlayDirPath;

@end
