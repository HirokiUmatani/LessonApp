//
//  PEARURLParser.m
//  URLParser
//
//  Created by hirokiumatani on 2015/10/31.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "PEARURLParser.h"

@implementation PEARURLParser
+ (URLEntity *)urlParse:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    URLEntity *urlEntity = [URLEntity new];
    urlEntity.url = urlString;
    urlEntity.scheme = [url scheme];
    urlEntity.host = [url host];
    
    NSArray *tmpPath = [url pathComponents];
    
    NSMutableArray *pathsTmp = @[].mutableCopy;
    for (NSString *path in tmpPath)
    {
        if (![path isEqualToString:@"/"])
        {
            [pathsTmp addObject:path];
        }
    }
    if (pathsTmp.count > 0)
    {
        urlEntity.paths = pathsTmp;
    }
    

    if (pathsTmp.count > 0)
    {
        urlEntity.lastPath = [url lastPathComponent];
    }
    if (![[urlEntity.lastPath pathExtension] isEqualToString:@""])
    {
        urlEntity.fileName = [urlEntity.lastPath stringByDeletingPathExtension];
    }
    if (![[urlEntity.lastPath pathExtension] isEqualToString:@""])
    {
        urlEntity.extention = [urlEntity.lastPath pathExtension];
    }
    
    return urlEntity;
}
@end
