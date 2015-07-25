//
//  DirectoryFileManager.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/20.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//


@interface DirectoryFileManager : NSObject
+ (NSArray *)getDirectory:(NSString *)dirPath;

+ (NSData *)getFileWithDirPath:(NSString *)dirPath
                      filePath:(NSString *)filePath;

+ (BOOL)checkFileWithDirPath:(NSString *)dirPath
                    filePath:(NSString *)filePath;

+ (BOOL)checkDirectory:(NSString *)dirPath;

+ (void)createDirectory:(NSString *)dirPath
              permisson:(NSNumber *)permission;

+ (void)createFile:(NSData   *)fileData
           dirPath:(NSString *)dirPath
          filePath:(NSString *)filePath
         permisson:(NSNumber *)permission;

+ (void)deleteDirectory:(NSString *)dirPath;

+ (void)deleteFileWithDirPath:(NSString *)dirPath
                     filePath:(NSString *)filePath;
@end
