//
//  DirectoryFileManager.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/20.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "DirectoryFileManager.h"

@implementation DirectoryFileManager
+ (NSArray *)getDirectoryFileWithDirPath:(NSString *)dirPath
{
    if ([self checkDirectoryWithDirPath:dirPath])
    {
        return [[NSFileManager new] contentsOfDirectoryAtPath:dirPath error:nil];
    }
    return @[].copy;
}
+ (NSData *)getFileWithDirPath:(NSString *)dirPath
                  filePath:(NSString *)filePath
{
    if ([self checkFileWithDirPath:dirPath filePath:filePath])
    {
        return [[NSFileManager new] contentsAtPath:[NSString stringWithFormat:
                                                    @"%@/%@/%@",
                                                    NSHomeDirectory(),
                                                    dirPath,
                                                    filePath]];
    }
    return @[].copy;
}
#pragma mark - check
+ (BOOL)checkFileWithDirPath:(NSString *)dirPath
                    filePath:(NSString *)filePath
{
    
    return [[NSFileManager new] fileExistsAtPath:[NSString stringWithFormat:
                                                  @"%@/%@/%@",
                                                  NSHomeDirectory(),
                                                  dirPath,
                                                  filePath]];
}
+ (BOOL)checkDirectoryWithDirPath:(NSString *)dirPath
{
    
    return [[NSFileManager new] fileExistsAtPath:[NSString stringWithFormat:
                                                  @"%@/%@",
                                                  NSHomeDirectory(),
                                                  dirPath]];
}
#pragma mark - create
+ (void)createDirectory:(NSString *)dirPath
              permisson:(NSNumber *)permission
{
    if ([self checkDirectoryWithDirPath:dirPath])
        return;
    
    [[NSFileManager new] createDirectoryAtPath:[NSString stringWithFormat:
                                                @"%@/%@",
                                                NSHomeDirectory(),
                                                dirPath]
                   withIntermediateDirectories:YES
                                    attributes:@{NSFilePosixPermissions: permission}
                                         error:nil];
    
    
}

+ (void)createFile:(NSData   *)fileData
           dirPath:(NSString *)dirPaht
          filePath:(NSString *)filePath
         permisson:(NSNumber *)permission
{
    
    if ([self checkFileWithDirPath:dirPaht filePath:filePath])
        return;
    
    [[NSFileManager new] createFileAtPath:[NSString stringWithFormat:
                                           @"%@/%@/%@",
                                           NSHomeDirectory(),
                                           dirPaht,
                                           filePath]
                                 contents:fileData
                               attributes:@{NSFilePosixPermissions: permission}];
}
@end
