//
//  WaterQualitySet.m
//  FishTank
//
//  Created by Mac on 16/7/14.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "WaterQualitySet.h"

@implementation WaterQualitySet

- (instancetype)initWithTemperatureSet:(int)temperatureSet phValueSet:(double)phValueSet oxContentSet:(int)oxContentSet temperatureRealTime:(int)temperatureRealTime phValueRealTime:(double)phValueRealTime oxContentRealTime:(int)oxContentRealTime{
    self = [super init];
    if(self) {
        self.temperatureRealTime = temperatureRealTime;
        self.phValueRealTime = phValueRealTime;
        self.oxContentRealTime = oxContentRealTime;
        
        self.temperatureSet = temperatureSet;
        self.phValueSet = phValueSet;
        self.oxContentSet = oxContentSet;
    }
    return self;
}

-(NSString *)temperatureJudge
{
    NSString *temJudgeShow;
    if (_temperatureRealTime<(_temperatureSet-3)) {
        temJudgeShow = @"温度过低";
        return temJudgeShow;
    }
    else if (_temperatureRealTime<=(_temperatureSet+3)){
        temJudgeShow = @"温度正常";
        return temJudgeShow;
    }
    else{
        temJudgeShow = @"温度过高";
        return temJudgeShow;
    }
}

-(NSString *)phValueJudge
{
    NSString *phJudgeShow;
    if (_phValueRealTime<(_phValueSet-0.2)) {
        phJudgeShow = @"ph值过低";
        return phJudgeShow;
    }
    else if (_phValueRealTime<=(_phValueSet+0.2)){
        phJudgeShow = @"ph值正常";
        return phJudgeShow;
    }
    else{
        phJudgeShow = @"ph值过高";
        return phJudgeShow;
    }
}

-(NSString *)oxContentJudge
{
    NSString *oxJudge;
    if (_oxContentRealTime<(_oxContentSet-5)) {
        oxJudge = @"氧含量过低";
        return oxJudge;
    }
    else if (_oxContentRealTime<=(_oxContentSet+5)){
        oxJudge = @"氧含量正常";
        return oxJudge;
    }
    else{
        oxJudge = @"氧含量过高";
        return oxJudge;
    }
}

@end
