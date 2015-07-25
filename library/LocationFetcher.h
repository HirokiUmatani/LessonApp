//
//  LocationFetcher.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

#pragma mark - LocationDelegate
/*** @class locacion delegate */
@protocol LocationFetcherDelegate <NSObject>

/*** call back locacion update */
- (void)didUpdateToLocation;

/*** call back location failed */
- (void)didFailWithError;
@end


#pragma mark - Location
/*** @class fetch location class */
@interface LocationFetcher : NSObject<CLLocationManagerDelegate>
/*** latitude */
@property (nonatomic,retain) NSString *latitude;

/*** longitude */
@property (nonatomic,retain) NSString *longitude;

/*** location delegate */
@property (nonatomic,weak) id <LocationFetcherDelegate> delegate;

/*** fetch location start */
- (void)startLocation;
/*** fetch location stop */
- (void)stopLocation;
@end
