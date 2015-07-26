//
//  MovieDownloadController.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/20.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "MovieDownloadController.h"
#import "MovieDownloadFetcher.h"
#import "DownLoadMovieCoreDataManager.h"
@implementation MovieDownloadController
- (void)startMovieDownload:(NSString *)url
{
    URLEntity *urlEntity = [URLEntity new];
    urlEntity = [URLParser urlParse:url];
    __SERIAL_THREAD_START__
    [self m3u8Download:urlEntity];
    [self movieDownload:urlEntity];
    __THREAD_END__
}
- (void)m3u8Download:(URLEntity *)urlEntity
{
    // check save directory
    if (![DirectoryFileManager checkDirectory:urlEntity.path])
    {   // create save directory
        [DirectoryFileManager createDirectory:urlEntity.path
                                    permisson:@0755];
    }
    // check m3u8 file
    if ([DirectoryFileManager checkFileWithDirPath:urlEntity.path
                                          filePath:urlEntity.lastPath])
        return;
    
    // download m3u8 data
    [[MovieDownloadFetcher new] m3u8FetchingWithURL:urlEntity.url
                                            success:^(NSData *m3u8Binary)
    {   // create m3u8 file
        [DirectoryFileManager createFile:m3u8Binary
                                 dirPath:urlEntity.path
                                filePath:urlEntity.lastPath
                               permisson:@0755];
        // CoreData m3u8 file path insert
        DownLoadMovieCoreDataManager * downloadMovieCoreDataManager = [DownLoadMovieCoreDataManager new];
        NSString * moviePlayDirPath = [NSString stringWithFormat:
                                       @"%@/%@",
                                       urlEntity.path,
                                       urlEntity.lastPath];
        
        NSPredicate *predicate = [downloadMovieCoreDataManager setPredicateWithSearchKey:@"moviePlayDirPath"
                                                                             searchValue:moviePlayDirPath];
        
        [downloadMovieCoreDataManager insertWithPredicate:predicate
                                         moviePlayDirPath:moviePlayDirPath];
    }failed:^{}];
}

- (void)movieDownload:(URLEntity *)urlEntity
{
    // check m3u8 file
    if (![DirectoryFileManager checkFileWithDirPath:urlEntity.path
                                           filePath:urlEntity.lastPath])
        return;
    // get m3u8 data
    NSData *data = [DirectoryFileManager getFileWithDirPath:urlEntity.path
                                                   filePath:urlEntity.lastPath];
    // make movie download lists
    NSArray * downloadLists = [M3U8Serializer movieDownloadListsFromM3UList:data];
    
    // make movie download lists data
    NSData *downloadData = [NSKeyedArchiver archivedDataWithRootObject:downloadLists];
    // *** CoreData movie download List update
    DownLoadMovieCoreDataManager * downloadMovieCoreDataManager = [DownLoadMovieCoreDataManager new];
    NSString * moviePlayDirPath = [NSString stringWithFormat:
                                   @"%@/%@",
                                   urlEntity.path,
                                   urlEntity.lastPath];
    
    NSPredicate *predicate = [downloadMovieCoreDataManager setPredicateWithSearchKey:@"moviePlayDirPath"
                                                                         searchValue:moviePlayDirPath];
    [downloadMovieCoreDataManager updateWithPredicate:predicate
                                      downloadURLList:downloadData
                                        downloadCount:@(0)
                                         downloadRait:0.0f];
    for (NSInteger i = 0; i < downloadLists.count; i++)
    {   // check movie file
        if ([DirectoryFileManager checkFileWithDirPath:urlEntity.path
                                              filePath:downloadLists[i]])
            continue;
        // download movie data
        NSString *urlString = [NSString stringWithFormat:
                               @"http://%@/%@/%@",
                               urlEntity.host,
                               urlEntity.path,
                               downloadLists[i]];
        
        [[MovieDownloadFetcher new] movieFetchingWithURL:urlString
                                                 success:^(NSData *movieBinary)
        {   // create movie file
            [DirectoryFileManager createFile:movieBinary
                                     dirPath:urlEntity.path
                                    filePath:downloadLists[i]
                                   permisson:@0755];
            
            // update download progressbar
            NSInteger j = i+1;
            CGFloat downloadPercent = (CGFloat)j / (CGFloat)downloadLists.count;
            [_delegate updateDownloadProgressBar:downloadPercent];
            
            // *** CoreData movie download count update
            [downloadMovieCoreDataManager updateWithPredicate:predicate
                                              downloadURLList:downloadData
                                                downloadCount:@(i)
                                                 downloadRait:downloadPercent];
         }failed:^{}];
    }
}
@end
