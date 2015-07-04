//
//  OpenWeatherMapView.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/04.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@class OpenWeatherMapEntity;
@interface OpenWeatherMapView : UIView

@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

- (void)setView:(OpenWeatherMapEntity *)openWeatherMapEntity;
@end
