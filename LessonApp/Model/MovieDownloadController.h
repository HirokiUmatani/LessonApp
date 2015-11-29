//
//  MovieDownloadController.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/20.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@protocol MovieDownloadControllerDelegate <NSObject>
@optional
- (void)updateDownloadProgressBar:(CGFloat)downloadRait;
- (void)startDownLoad;
- (void)finishDownLoad;
@end

@interface MovieDownloadController : NSObject

@property (nonatomic,assign) id<MovieDownloadControllerDelegate>delegate;

- (void)downloadMovieWithUrl:(NSString *)url;
@end
