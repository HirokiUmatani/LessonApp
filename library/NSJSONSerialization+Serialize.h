//
//  JsonSerialize.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

/*** @class json class */
@interface NSJSONSerialization(Serialize)

+ (NSDictionary *)dictionaryFromJsonData:(NSData *)jsonData;

+ (NSData *)jsonDataFromDictionary:(NSDictionary *)dictionary;
@end
