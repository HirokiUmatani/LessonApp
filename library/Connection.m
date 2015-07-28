//
//  Connection.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/28.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "Connection.h"
@interface Connection()
{
    
}
@end
@implementation Connection
- (void)connectWithURL:(NSString *)url
                  port:(NSUInteger)port
{
    
    NSInputStream *iStream;
    NSOutputStream *oStream;
    
    NSURL *website = [NSURL URLWithString:url];
    [NSStream getStreamsToHostWithName:[website host]
                                  port:port
                           inputStream:&iStream
                          outputStream:&oStream];
    
    [iStream scheduleInRunLoop:[NSRunLoop currentRunLoop]
                       forMode:NSDefaultRunLoopMode];
    [oStream scheduleInRunLoop:[NSRunLoop currentRunLoop]
                       forMode:NSDefaultRunLoopMode];
    
    iStream.delegate = self;
    oStream.delegate = self;
    
    [iStream open];
    [oStream open];
    

}
-(void)disconnect
{
    
}

- (void)stream:(NSStream *)stream handleEvent:(NSStreamEvent)eventCode {
    
//    switch(eventCode) {
//        case NSStreamEventHasBytesAvailable:
//        {
//            if (data == nil) {
//                data = [[NSMutableData alloc] init];
//            }
//            uint8_t buf[1024];
//            unsigned int len = 0;
//            len = [(NSInputStream *)stream read:buf maxLength:1024];
//            if(len) {
//                
//                [data appendBytes:(const void *)buf length:len];
//                int bytesRead;
//                bytesRead += len;
//            } else {
//                NSLog(@"No data.");
//            }
//            
//            NSString *str = [[NSString alloc] initWithData:data
//                                                  encoding:NSUTF8StringEncoding];
//            NSLog(str);
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"From server"
//                                                            message:str
//                                                           delegate:self
//                                                  cancelButtonTitle:@"OK"
//                                                  otherButtonTitles:nil];
//            [alert show];
//            
//            
//            data = nil;
//        } break;
//    }
}
@end
