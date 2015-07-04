//
//  JsonSerialize.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

/**
 * @class Jsonデータを取り扱うClass
 */
@interface NSJSONSerialization(Serialize)

#pragma mark Method
/**
 * JsonDataをNSdictionaryに変換
 * @param jsonData サーバーからのJsonレスポンスデータ
 * @return NSDictionary
 */
+ (NSDictionary *)dictionaryFromJsonData:(NSData *)jsonData;

/**
 * NSDictionaryをJsonDataに変換
 * @param NSDictionary サーバーに送信するNSDictionary
 * @return JsonData
 */
+ (NSData *)jsonDataFromDictionary:(NSDictionary *)dictionary;
@end
