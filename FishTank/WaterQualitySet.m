//
//  WaterQualitySet.m
//  FishTank
//
//  Created by Mac on 16/7/14.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "WaterQualitySet.h"

@implementation WaterQualitySet

- (instancetype)initWithTemperatureSet:(NSString *)temperatureSet phValueSet:(NSString *)phValueSet oxContentSet:(NSString *)oxContentSet temperatureRealTime:(NSString *)temperatureRealTime phValueRealTime:(NSString *)phValueRealTime oxContentRealTime:(NSString *)oxContentRealTime;{
    self = [super init];
    if(self) {
        self.temperatureRealTime = temperatureRealTime;
        self.oxContentRealTime = oxContentRealTime;
        self.phValueRealTime = phValueRealTime;
        
        self.temperatureSet = temperatureSet;
        self.phValueSet = phValueSet;
        self.oxContentSet = oxContentSet;
    }
    return self;
}


@end
