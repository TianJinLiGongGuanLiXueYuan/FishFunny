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
@property(nonatomic,assign) int temperatureRealTime;
@property(nonatomic,assign) double  phValueRealTime;
@property(nonatomic,assign) int oxContentRealTime;

@property(nonatomic,assign) int temperatureSet;
@property(nonatomic,assign) double  phValueSet;
@property(nonatomic,assign) int oxContentSet;


- (instancetype)initWithTemperatureSet:(int)temperatureSet phValueSet:(double)phValueSet oxContentSet:(int)oxContentSet temperatureRealTime:(int)temperatureRealTime phValueRealTime:(double)phValueRealTime oxContentRealTime:(int)oxContentRealTime;

-(NSString *)temperatureJudge;
-(NSString *)phValueJudge;
-(NSString *)oxContentJudge;


@end
