//
//  PEARFileManager.h
//  FileManager
//
//  Created by hirokiumatani on 2015/10/31.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PEARFileManager : NSObject
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
