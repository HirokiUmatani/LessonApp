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
    if (![[url lastPathComponent] isEqualToString:@""])
    {
        if (![[url lastPathComponent] isEqualToString:@"/"])
        {
            urlEntity.lastPath = [url lastPathComponent];
        }
    }
    if (![[urlEntity.lastPath pathExtension] isEqualToString:@""])
    {
        urlEntity.fileName = [urlEntity.lastPath stringByDeletingPathExtension];
    }
    if (![[urlEntity.lastPath pathExtension] isEqualToString:@""])
    {
        urlEntity.extention = [urlEntity.lastPath pathExtension];
    }
    
    NSArray *tmpPath = [url pathComponents];
    
    NSMutableArray *pathsTmp = @[].mutableCopy;
    for (NSString *path in tmpPath)
    {
        if (![path isEqualToString:@"/"])
        {
            if(![[url lastPathComponent] isEqualToString:path])
            {
                [pathsTmp addObject:path];
            }
            
        }
    }
    if (pathsTmp.count > 0)
    {
        urlEntity.paths = pathsTmp;
    }
    
    NSString *dirpath=@"";
    
    for (NSInteger i = 0; i < urlEntity.paths.count; i++)
    {
        NSString *tmp = urlEntity.paths[i];
        if (i == 0)
        {
            dirpath = tmp;
        }
        else
        {
            dirpath = [NSString stringWithFormat:@"%@/%@",dirpath,tmp];
        }
    }
    
    if (urlEntity.paths.count == 1)
    {
        urlEntity.path = dirpath;
        
    }
    else if (urlEntity.paths.count > 1)
    {
        urlEntity.path = [dirpath stringByDeletingLastPathComponent];
    }
    
    
    

    
    
    return urlEntity;
}
@end
