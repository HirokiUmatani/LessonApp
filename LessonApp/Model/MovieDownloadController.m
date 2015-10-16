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
- (void)downloadMovieWithUrl:(NSString *)url
{
    // Parse URL
    URLEntity *urlEntity = [URLEntity new];
    urlEntity = [URLParser urlParse:url];
    
    __SERIAL_THREAD_START__
    // m3u8 Download
    [self m3u8Download:urlEntity];
    // movie Download
    [self movieDownload:urlEntity];
    __THREAD_END__
}

- (void)m3u8Download:(URLEntity *)urlEntity
{
    // check m3u8 file
    if([DirectoryFileManager checkFileWithDirPath:urlEntity.path filePath:urlEntity.lastPath])
        return;
    
    // check save directory
    if (![DirectoryFileManager checkDirectory:urlEntity.path])
    {
        // create save directory
        [DirectoryFileManager createDirectory:urlEntity.path permisson:@0755];
    }
    
    // download m3u8 data
    [[MovieDownloadFetcher new] m3u8FetchingWithURL:urlEntity.url
                                            success:^(NSData *m3u8Binary)
    {
        // m3u8 AES128 encode
        NSData *enM3U8Binary = [m3u8Binary AES128EncryptWithKey:nil iv:nil];
        
        // create m3u8 file
        [DirectoryFileManager createFile:enM3U8Binary dirPath:urlEntity.path filePath:urlEntity.lastPath permisson:@0755];
        
        // CoreData m3u8 file path insert
        DownLoadMovieCoreDataManager * downloadMovieCoreDataManager = [DownLoadMovieCoreDataManager new];
        NSString * moviePlayDirPath = [NSString stringWithFormat:@"%@/%@",urlEntity.path,urlEntity.lastPath];
        NSPredicate *predicate = [downloadMovieCoreDataManager setPredicateWithSearchKey:@"moviePlayDirPath" searchValue:moviePlayDirPath];
        [downloadMovieCoreDataManager insertWithPredicate:predicate
                                         moviePlayDirPath:moviePlayDirPath];
    }failed:^{}];
}

- (void)movieDownload:(URLEntity *)urlEntity
{
    // check m3u8 file
    if (![DirectoryFileManager checkFileWithDirPath:urlEntity.path filePath:urlEntity.lastPath])
    {
        // download m3u8 data
        [self m3u8Download:urlEntity];
    }
    
    // get m3u8 data
    NSData *m3u8Binary = [DirectoryFileManager getFileWithDirPath:urlEntity.path filePath:urlEntity.lastPath];
    
    // m3u8 data AES128 decode
    NSData *deM3U8Binary = [m3u8Binary AES128DecryptWithKey:nil iv:nil];
    
    // make movie download lists
    NSArray *downloadLists = [M3U8Serializer movieDownloadListsFromM3UList:deM3U8Binary];
    
    // make movie download lists data
    NSData *downloadData = [NSKeyedArchiver archivedDataWithRootObject:downloadLists];
    
    // *** CoreData movie download List update
    DownLoadMovieCoreDataManager * downloadMovieCoreDataManager = [DownLoadMovieCoreDataManager new];
    NSString * moviePlayDirPath = [NSString stringWithFormat:@"%@/%@",urlEntity.path,urlEntity.lastPath];
    NSPredicate *predicate = [downloadMovieCoreDataManager setPredicateWithSearchKey:@"moviePlayDirPath" searchValue:moviePlayDirPath];
    [downloadMovieCoreDataManager updateWithPredicate:predicate downloadURLList:downloadData downloadCount:@(0) downloadRait:0.0f];
    
    for (NSInteger i = 0; i < downloadLists.count; i++)
    {
        @autoreleasepool
        {
            // check movie file
            if ([DirectoryFileManager checkFileWithDirPath:urlEntity.path filePath:downloadLists[i]])continue;
            
            NSString *urlString = [NSString stringWithFormat:@"http://%@/%@/%@",urlEntity.host,urlEntity.path,downloadLists[i]];
            
            // download movie data
            [[MovieDownloadFetcher new] movieFetchingWithURL:urlString
                                                     success:^(NSData *movieBinary)
             {
                 // movie data AES128 encode
                 NSData *enMovieBinary = [movieBinary AES128EncryptWithKey:nil iv:nil];
                 
                 // create movie file
                 [DirectoryFileManager createFile:enMovieBinary dirPath:urlEntity.path filePath:downloadLists[i] permisson:@0755];
             }failed:^{}];
        }
    }
}
@end
