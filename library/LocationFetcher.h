//
//  LocationFetcher.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

#pragma mark - LocationDelegate
/**
 * @class 測位（位置情報）のコールバック用デリゲート
 */
@protocol LocationFetcherDelegate <NSObject>

#pragma mark Method
/**
 * 位置情報取得毎にコールバック
 */
- (void)didUpdateToLocation;

/**
 * 位置情報取得失敗時にコールバック
 */
- (void)didFailWithError;
@end


#pragma mark - Location
/**
 * @class 測位（位置情報）を担当するClass
 */
@interface LocationFetcher : NSObject<CLLocationManagerDelegate>
#pragma mark Property
/**
 * 緯度
 */
@property (nonatomic,retain) NSString *latitude;

/**
 * 経度
 */
@property (nonatomic,retain) NSString *longitude;

/**
 * GeodeticDelegate
 */
@property (nonatomic,weak) id <LocationFetcherDelegate> delegate;
#pragma mark Method
/**
 * 位置情報取得開始
 */
- (void)startLocation;
/**
 * 位置情報取得終了;
 */
- (void)stopLocation;


@end
