//
//  MovieDownloadController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/20.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MovieDownloadController.h"
#import "MovieDownloadFetcher.h"
@implementation MovieDownloadController
- (void)download
{
    __SERIAL_THREAD_START__
    [DirectoryFileManager createDirectory:self.dirPath
                                permisson:self.permission];
    
    [self m3u8Download];
    [self movieDownload];
    __THREAD_END__
}
- (void)m3u8Download
{
//    if ([DirectoryFileManager checkFileWithDirPath:self.dirPath
//                                          filePath:self.m3u8Path])
//        return;
    
    [[MovieDownloadFetcher new] m3u8FetchingWithURL:CONST_M3U8_DOWNLOAD_API
                                            success:^(NSData *m3u8Binary)
    {
        [DirectoryFileManager createFile:m3u8Binary
                                 dirPath:self.dirPath
                                filePath:self.m3u8Path
                               permisson:self.permission];
    }
                                             failed:^
    {
        
    }];
}
- (NSArray *)downloadlist
{
    NSData *data = [DirectoryFileManager getFileWithDirPath:self.dirPath
                                                   filePath:self.m3u8Path];
    NSString *pattern = @"([\\w\\_-]+.ts)";
    NSString *searchValue = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSArray *result = [RegularExpression searchReqularExpressinWithPattern:pattern
                                                               searchValue:searchValue];
    NSMutableArray *downloadLists = @[].mutableCopy;
    for (NSTextCheckingResult *match in result)
    {
        [downloadLists addObject:[searchValue substringWithRange:[match rangeAtIndex:1]]];
    }
    return downloadLists;
}
- (void)movieDownload
{
    NSArray * downloadLists = [self downloadlist];
    for (NSInteger i = 0; i < downloadLists.count; i++)
    {
//        if ([DirectoryFileManager checkFileWithDirPath:self.dirPath
//                                              filePath:downloadLists[i]])
//            continue;
        
        [[MovieDownloadFetcher new] movieFetchingWithURL:CONST_MOVIE_DOWNLOAD_API
                                                   count:i
                                                 success:^(NSData *movieBinary)
         {
             [DirectoryFileManager createFile:movieBinary
                                      dirPath:self.dirPath
                                     filePath:downloadLists[i]
                                    permisson:self.permission];
             NSInteger j = i+1;
             
             CGFloat downloadPercent = (CGFloat)j / (CGFloat)downloadLists.count;
             [self.movieDownloadControllerDelegate updateDownloadProgressBar:downloadPercent];
         }
                                                  failed:^
         {
             
         }];
    }
}
- (NSString *)dirPath
{
    return @"mario";
}
- (NSString *)m3u8Path
{
    return @"high_15.m3u8";
}
- (NSNumber *)permission
{
    return @0755;
}
@end
