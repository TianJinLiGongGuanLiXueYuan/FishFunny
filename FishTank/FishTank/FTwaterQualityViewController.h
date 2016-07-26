//
//  FTwaterQualityViewController.h
//  FishTank
//
//  Created by Mac on 16/7/15.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTwaterQualityViewController : UIViewController



@property(nonatomic,strong) UILabel *temperatureRealTimeTextView;
@property(nonatomic,strong) UILabel *phValueTextRealTimeView;
@property(nonatomic,strong) UILabel *oxcontentTextRealTimeView;

@property(nonatomic,strong) UILabel *temperatureShow;
@property(nonatomic,strong) UILabel *phValueShow;
@property(nonatomic,strong) UILabel *oxcontentShow;

@property(nonatomic,strong) UIButton *addBtn;
@property(nonatomic,strong) UIButton *setBtn;

@property(nonatomic ,strong) UIView *line1;
@property(nonatomic ,strong) UIView *line2;
@property(nonatomic ,strong) UIView *line3;
@property(nonatomic ,strong) UIView *line4;



-(UIView *)line1;
-(UIView *)line2;
-(UIView *)line3;
-(UIView *)line4;

-(UILabel *)ftInfo;
-(UILabel *)frame1FT;

-(UILabel *)temperatureRealTimeFrame;
-(UILabel *)phValueFrameRealTimeFrame;
-(UILabel *)oxContentRealTimeFrame;
-(UILabel *)temperatureRealTimeTextView;
-(UILabel *)phValueTextRealTimeView;
-(UILabel *)oxcontentTextRealTimeView;
-(UIButton *)_addBtn;

-(UILabel *)centerLine;

-(UILabel *)theBestInfo;
-(UILabel *)frame2FT;

-(UILabel *)temperatureSetFrame;
-(UILabel *)phValueSetFrame;
-(UILabel *)oxContentSetFrame;
-(UILabel *)temperatureShow;
-(UILabel *)phValueShow;
-(UILabel *)oxcontentShow;

-(UIButton *)_setBtn;
@end
