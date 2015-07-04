//
//  HttpFercher.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/02.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

/**
 * 通信成功時のBlocks
 * @param data httpレスポンスデータ
 */
typedef void (^FetchSuccess)(NSData *data);

/**
 * 通信失敗時のBlocks
 * @param error Httpエラー
 */
typedef void (^FetchFailed)(NSError *error);

/**
 * @class HTTP通信を担当するClass
 */
@interface HttpFercher : NSObject

#pragma mark Method
/**
 * HTTP GET同期通信
 * @param urlString 通信を行うURL
 * @param success 通信成功時のブロックス処理
 * @param failed 通信失敗時のブロックス処理
 */
- (void)startSyncFetchingWithUrlString:(NSString *)urlString
                           success:(FetchSuccess)success
                            failed:(FetchFailed)failed;
/**
 * HTTP GET非同期通信
 * @param urlString 通信を行うURL
 * @param success 通信成功時のブロックス処理
 * @param failed 通信失敗時のブロックス処理
 */
- (void)startFetchingWithUrlString:(NSString *)urlString
                           success:(FetchSuccess)success
                            failed:(FetchFailed)failed;

/**
 * HTTP POST非同期通信
 * @param urlString 通信を行うURL
 * @param param POST パラメータ
 * @param success 通信成功時のブロックス処理
 * @param failed 通信失敗時のブロックス処理
 */
- (void)startFetchingWithUrlString:(NSString *)urlString
                         paramData:(NSData *)paramData
                           success:(FetchSuccess)success
                            failed:(FetchFailed)failed;

/**
 * 引数のstringを順番にpostパラメータのStringパラメータに変換する
 * exaple : @"key1",@"value1",@"key2",@"value2" → @"key1=value1&key2:value2"
 * @param paramString 可変 string
 * @return stringパラメータデータ
 */
- (NSData *)setStringParameter:(NSString *)paramString,...NS_REQUIRES_NIL_TERMINATION;
@end
