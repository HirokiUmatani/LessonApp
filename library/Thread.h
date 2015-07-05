//
//  Thread.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/04.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//


@interface Thread : NSObject

typedef void (^ThreadBlocks)(void);

@property (nonatomic,assign) NSInteger maxThread;

+ (Thread *)sharedInstance;

- (void)asyncThread:(ThreadBlocks)blocks;


@end
