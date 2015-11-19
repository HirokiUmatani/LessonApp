### PEAR-DateUnixTime-iOS [![GitHub license](https://img.shields.io/badge/LICENSE-MIT%20LICENSE-blue.svg)](https://github.com/HirokiUmatani/PEAR-DateUnixTime-iOS/LICENSE) [![CocoaPods](https://img.shields.io/badge/platform-ios-lightgrey.svg)](https://cocoapods.org/pods/PEAR-DateUnixTime-iOS) [![CocoaPods](https://img.shields.io/cocoapods/v/PEAR-DateUnixTime-iOS.svg)](https://cocoapods.org/pods/PEAR-DateUnixTime-iOS)  

====
### Overview
Convert  
NSDate -> NSString
NSDate -> unix time  
unix time ->NSString  

NSString -> NSDate  
NSString -> unix time  
unix time -> NSDate  

### Installation
<code>
pod 'PEAR-DateUnixTime-iOS'
</code>

### Usage

#### □ import header file
```
#import "DateUnixTime.h"
```

#### □ sample
```
/**
 convert from NSDate Date Time
 Sample NSDate Data
 */
#define NOW_DATE [NSDate date]
#define OUTPUT_FORMAT @"yyyy-MM-dd HH:mm:ss.SSS"
    
    NSString *date_string =[DateUnixTime convertStringFromDate:NOW_DATE outputFormat:OUTPUT_FORMAT];
    NSLog(@"date -> string :%@",date_string);
    
    double date_time = [DateUnixTime convertUnixTimeFromDate:NOW_DATE];
    NSLog(@"date -> unix_time :%f",date_time);
    
    NSString *time_str =[DateUnixTime convertStringFromUnixTime:date_time outputFormat:OUTPUT_FORMAT];
    NSLog(@"unix_time -> string :%@",time_str);
    
/**
 convert from NSString Date Time
 Sample NSString Data
 */
#define TEST_DATE @"1234-05-06 01:23:45.678"
#define INPUT_FORMAT @"yyyy-MM-dd HH:mm:ss.SSS"
    NSDate * str_date = [DateUnixTime convertDateFromString:TEST_DATE inputFormat:INPUT_FORMAT];
    NSLog(@"string -> date :%@",str_date);
    
    double str_time = [DateUnixTime convertUnixTimeFromString:TEST_DATE inputFormat:INPUT_FORMAT];
    NSLog(@"string -> unix_time :%f",str_time);
    
    NSDate *time_date = [DateUnixTime convertDateFromUnixTime:str_time];
    NSLog(@"unix_time -> date :%@",time_date);
```

### Documents
[library document](http://cocoadocs.org/docsets/PEAR-DateUnixTime-iOS)

### Licence
[MIT](https://github.com/HirokiUmatani/PEAR-DateUnixTime-iOS/blob/master/LICENSE)

### Author
[Hiroki Umatani](https://github.com/HirokiUmatani)
