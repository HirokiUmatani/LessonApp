//
//  MovieDownloadFetcher.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/20.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MovieDownloadFetcher.h"

@implementation MovieDownloadFetcher
- (void)m3u8FetchingWithURL:(NSString *)url
                    success:(FetchSuccess)success
                     failed:(FetchFailed)failed
{
    
    [self fetchSyncWithUrlString:url
                         success:^(NSData *responceData)
    {
        success(responceData);
    }
                          failed:^(NSError *error)
    {
        failed(error);
    }];
}

- (void)movieFetchingWithURL:(NSString *)url
                     success:(FetchSuccess)success
                      failed:(FetchFailed)failed
{
    [self fetchSyncWithUrlString:url
                         success:^(NSData *responceData)
    {
        success(responceData);
    }
                          failed:^(NSError *error)
    {
        failed(error);
    }];
}
@end
