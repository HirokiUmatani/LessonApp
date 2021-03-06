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
    urlEntity = [PEARURLParser urlParse:url];
    
    __SERIAL_THREAD_START__
    // m3u8 Download
    [self m3u8Download:urlEntity];
    // movie Download
    [self movieDownload:urlEntity];
    __THREAD_END__
}

- (void)m3u8Download:(URLEntity *)urlEntity
{
    
    // create save directory
    [[PEARFileManager sharedInstatnce] createDirectory:urlEntity.path permisson:@0755];

    // download m3u8 data
    MovieDownloadFetcher *m3u8Fetcher = [MovieDownloadFetcher new];
    [m3u8Fetcher m3u8FetchingWithURL:urlEntity.url
                                            success:^(NSData *m3u8Binary)
    {
        // create m3u8 file
        
        [[PEARFileManager sharedInstatnce] createFileWithData:m3u8Binary
                                                     filePath:[[PEARFileManager sharedInstatnce] joinFileName:urlEntity.lastPath
                                                                                                    inDirPath:urlEntity.path]
                                                    permisson:@0755];
    }
                              failed:^(NSError *error)
    {
        
    }];
}

- (void)movieDownload:(URLEntity *)urlEntity
{
    // get m3u8 data
    NSData *m3u8Binary = [[PEARFileManager sharedInstatnce] fetchFileDataWithPath:[[PEARFileManager sharedInstatnce] joinFileName:urlEntity.lastPath
                                                                                                                        inDirPath:urlEntity.path]];
    
    // make movie download lists
    NSArray *downloadLists = [M3U8Serializer movieDownloadListsFromM3UList:m3u8Binary];
   
    for (NSInteger i = 0; i < downloadLists.count; i++)
    {
        
            
        NSString *urlString = [NSString stringWithFormat:@"http://%@/%@/%@",urlEntity.host,urlEntity.path,downloadLists[i]];
        
        // download movie data
        [[MovieDownloadFetcher new] movieFetchingWithURL:urlString
                                                 success:^(NSData *movieBinary)
         {
             
             // create movie file
             [[PEARFileManager sharedInstatnce] createFileWithData:movieBinary
                                                          filePath:[[PEARFileManager sharedInstatnce] joinFileName:downloadLists[i] inDirPath:urlEntity.path]
                                                         permisson:@0755];
         }failed:^(NSError *error){}];
        
    }
}
@end
