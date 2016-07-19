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
@property(nonatomic,strong) UITextField *temperatureSetTextField;
@property(nonatomic,strong) UITextField *phValueSetTextField;
@property(nonatomic,strong) UITextField *oxContentSetTextField;

@property(nonatomic,strong) UIButton *addBtn;
@property(nonatomic,strong) UIButton *setBtn;

-(UILabel *)ftInfo;
-(UILabel *)frame1FT;

-(UILabel *)temperatureRealTimeFrame;
-(UILabel *)phValueFrameRealTimeFrame;
-(UILabel *)oxContentRealTimeFrame;
-(UILabel *)temperatureRealTimeTextView;
-(UILabel *)phValueTextRealTimeView;
-(UILabel *)oxcontentTextRealTimeView;
-(UIButton *)_addBtn;


-(UILabel *)theBestInfo;
-(UILabel *)frame2FT;

-(UILabel *)temperatureSetFrame;
-(UILabel *)phValueSetFrame;
-(UILabel *)oxContentSetFrame;
-(UITextField *)temperatureSetTextField;
-(UITextField *)phValueSetTextField;
-(UITextField *)oxContentSetTextField;
-(UIButton *)_setBtn;
@end
