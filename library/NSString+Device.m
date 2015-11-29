//
//  NSString+Device.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/18.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "NSString+Device.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString(Device)
+ (NSDictionary *)appInfo
{
    return [NSBundle.mainBundle infoDictionary];
}
+ (CGRect)screenRect
{
    return UIScreen.mainScreen.bounds;
}
+ (CGFloat)screenWidth
{
    return self.screenRect.size.width;
}
+ (CGFloat)screenHeight
{
    return self.screenRect.size.height;
}

- (NSString *)md5
{
    if (!self) return nil;
    
    NSString *checksum = [NSString string];
    const char *cStr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    unsigned char buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)[self length], buffer);
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        checksum = [checksum stringByAppendingString:[NSString stringWithFormat:@"%02x", buffer[i]]];
    }
    return checksum;
}
- (NSString *)AES128Key:(NSString *)salt
{
    NSString *uuid = [KeyChainData getUUID];
    NSString *key = [NSString stringWithFormat:@"%@%@",uuid,salt];
    return [key md5];
}
- (NSString *)AES128iv:(NSString *)salt
{
    NSString *key = [self AES128Key:salt];
    NSString *uuid = [KeyChainData getUUID];
    NSString *iv = [NSString stringWithFormat:@"%@%@%@",salt,key,uuid];
    return [iv md5];
}
@end
