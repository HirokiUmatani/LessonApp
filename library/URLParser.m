//
//  URLParser.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/26.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "URLParser.h"
@implementation URLParser
+ (URLEntity *)urlParse:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    URLEntity *urlEntity = [URLEntity new];
    urlEntity.url = urlString;
    urlEntity.scheme = [url host];
    urlEntity.host = [url host];
    urlEntity.paths = [url pathComponents];
    NSString *dirpath;
    for (NSInteger i = 0; i < urlEntity.paths.count; i++)
    {
        NSString *tmp = urlEntity.paths[i];
        if (i == 0)
            continue;
        if (i == 1)
        {
            dirpath = tmp;
            continue;
        }
        
        dirpath = [NSString stringWithFormat:@"%@/%@",dirpath,tmp];
        
    }
    urlEntity.path = [dirpath stringByDeletingLastPathComponent];
    urlEntity.lastPath = [url lastPathComponent];
    urlEntity.fileName = [urlEntity.lastPath stringByDeletingPathExtension];
    urlEntity.extention = [urlEntity.path pathExtension];
    return urlEntity;
}
@end
