//
//  MovieDownloadFetcher.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/20.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@interface MovieDownloadFetcher : PEARHttpFetcher

- (void)m3u8FetchingWithURL:(NSString *)url
                    success:(FetchSuccess)success
                     failed:(FetchFailed)failed;

- (void)movieFetchingWithURL:(NSString *)url
                     success:(FetchSuccess)success
                      failed:(FetchFailed)failed;
@end
