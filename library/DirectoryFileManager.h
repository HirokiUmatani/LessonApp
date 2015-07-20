//
//  DirectoryFileManager.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/20.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//


@interface DirectoryFileManager : NSObject
+ (NSArray *)getDirectoryFileWithDirPath:(NSString *)dirPath;

+ (NSData *)getFileWithDirPath:(NSString *)dirPath
                      filePath:(NSString *)filePath;

+ (BOOL)checkFileWithDirPath:(NSString *)dirPath
                    filePath:(NSString *)filePath;

+ (BOOL)checkDirectoryWithDirPath:(NSString *)dirPath;

+ (void)createDirectory:(NSString *)dirPath
              permisson:(NSNumber *)permission;

+ (void)createFile:(NSData   *)fileData
           dirPath:(NSString *)dirPaht
          filePath:(NSString *)filePath
         permisson:(NSNumber *)permission;
@end
