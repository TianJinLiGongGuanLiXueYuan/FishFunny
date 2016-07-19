//
//  WaterQualitySet.h
//  FishTank
//
//  Created by Mac on 16/7/14.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WaterQualitySet : NSObject
@property(nonatomic,strong) NSString *temperatureRealTime;
@property(nonatomic,strong) NSString *phValueRealTime;
@property(nonatomic,strong) NSString *oxContentRealTime;

@property(nonatomic,strong) NSString *temperatureSet;
@property(nonatomic,strong) NSString *phValueSet;
@property(nonatomic,strong) NSString *oxContentSet;

- (instancetype)initWithTemperatureSet:(NSString *)temperatureSet phValueSet:(NSString *)phValueSet oxContentSet:(NSString *)oxContentSet temperatureRealTime:(NSString *)temperatureRealTime phValueRealTime:(NSString *)phValueRealTime oxContentRealTime:(NSString *)oxContentRealTime;


@end
