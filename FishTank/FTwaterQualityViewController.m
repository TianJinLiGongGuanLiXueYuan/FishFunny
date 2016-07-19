//
//  FTwaterQualityViewController.m
//  FishTank
//
//  Created by Mac on 16/7/15.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTwaterQualityViewController.h"
#import "WaterQualitySet.h"

#define kSubviewCellSizePro 1.1

@interface FTwaterQualityViewController ()<UITextFieldDelegate>

@property(nonatomic,strong) WaterQualitySet* waterQuality;    

@property(nonatomic ,strong) UILabel *ftInfo;
@property(nonatomic ,strong) UILabel *frame1FT;
@property(nonatomic ,strong) UILabel *temperatureRealTimeFrame;
@property(nonatomic ,strong) UILabel *phValueFrameRealTimeFrame;
@property(nonatomic ,strong) UILabel *oxContentRealTimeFrame;

@property(nonatomic ,strong) UILabel *theBestInfo;
@property(nonatomic ,strong) UILabel *frame2FT;
@property(nonatomic ,strong) UILabel *temperatureSetFrame;
@property(nonatomic ,strong) UILabel *phValueSetFrame;
@property(nonatomic ,strong) UILabel *oxContentSetFrame;


@end

@implementation FTwaterQualityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.temperatureSetTextField resignFirstResponder];
}

#pragma mark - 实时水质数据

-(UILabel *)ftInfo
{
    if (!_ftInfo){
    _ftInfo = [[UILabel alloc]init];
    _ftInfo.frame = CGRectMake(144*kSubviewCellSizePro, 73*kSubviewCellSizePro, 80*kSubviewCellSizePro, 28*kSubviewCellSizePro);
    _ftInfo.backgroundColor = [UIColor whiteColor];
    _ftInfo.text = @"鱼缸详情";
    _ftInfo.textAlignment  = NSTextAlignmentCenter;
    }
    return _ftInfo;
}
-(UILabel *)frame1FT
{
    if (!_frame1FT){
    _frame1FT = [[UILabel alloc]initWithFrame:CGRectMake(16*kSubviewCellSizePro, 100*kSubviewCellSizePro, 335*kSubviewCellSizePro, 185*kSubviewCellSizePro)];
    _frame1FT.backgroundColor = [UIColor yellowColor];
    }
    return _frame1FT;
}


-(UILabel *)temperatureRealTimeFrame
{
    if (!_temperatureRealTimeFrame){
    _temperatureRealTimeFrame = [[UILabel alloc]init];
    _temperatureRealTimeFrame.frame = CGRectMake(65*kSubviewCellSizePro, 115*kSubviewCellSizePro, 100*kSubviewCellSizePro, 40*kSubviewCellSizePro);
    _temperatureRealTimeFrame.backgroundColor = [UIColor whiteColor];
    _temperatureRealTimeFrame.text = @" 温度 :";
    }
    return  _temperatureRealTimeFrame;
}

-(UILabel *)phValueFrameRealTimeFrame{
    if (!_phValueFrameRealTimeFrame){
    _phValueFrameRealTimeFrame = [[UILabel alloc]init];
    _phValueFrameRealTimeFrame.frame = CGRectMake(65*kSubviewCellSizePro, 170*kSubviewCellSizePro, 100*kSubviewCellSizePro, 40*kSubviewCellSizePro);
    _phValueFrameRealTimeFrame.backgroundColor = [UIColor whiteColor];
    _phValueFrameRealTimeFrame.text = @" PH值 :";
    }
    return  _phValueFrameRealTimeFrame;
}
-(UILabel *)oxContentRealTimeFrame
{
    if (!_oxContentRealTimeFrame){
    _oxContentRealTimeFrame = [[UILabel alloc]init];
    _oxContentRealTimeFrame.frame = CGRectMake(65*kSubviewCellSizePro, 225*kSubviewCellSizePro, 100*kSubviewCellSizePro, 40*kSubviewCellSizePro);
    _oxContentRealTimeFrame.backgroundColor = [UIColor whiteColor];
    _oxContentRealTimeFrame.text = @" 含氧量:";
    }
    return  _oxContentRealTimeFrame;
}
-(UILabel *)temperatureRealTimeTextView
{
    if (!_temperatureRealTimeTextView){
    _temperatureRealTimeTextView = [[UILabel alloc]init];
    _temperatureRealTimeTextView.frame = CGRectMake(210*kSubviewCellSizePro, 115*kSubviewCellSizePro, 100*kSubviewCellSizePro, 40*kSubviewCellSizePro);
    _temperatureRealTimeTextView.backgroundColor = [UIColor whiteColor];
    }
    return  _temperatureRealTimeTextView;
}
-(UILabel *)phValueTextRealTimeView
{
    if (!_phValueTextRealTimeView){
    _phValueTextRealTimeView = [[UILabel alloc]init];
    _phValueTextRealTimeView.frame = CGRectMake(210*kSubviewCellSizePro, 170*kSubviewCellSizePro, 100*kSubviewCellSizePro, 40*kSubviewCellSizePro);
    _phValueTextRealTimeView.backgroundColor = [UIColor whiteColor];
    }
    return  _phValueTextRealTimeView;
}

-(UILabel *)oxcontentTextRealTimeView
{
    if (!_oxcontentTextRealTimeView){
        _oxcontentTextRealTimeView = [[UILabel alloc]init];
        _oxcontentTextRealTimeView.frame = CGRectMake(210*kSubviewCellSizePro, 225*kSubviewCellSizePro, 100*kSubviewCellSizePro, 40*kSubviewCellSizePro);
        _oxcontentTextRealTimeView.backgroundColor = [UIColor whiteColor];
    }
    return  _oxcontentTextRealTimeView;
}

#pragma  mark - 首次登陆添加设置
-(UIButton *)_addBtn
{
    if (!_addBtn){
        _addBtn = [[UIButton alloc]init];
        _addBtn.frame = CGRectMake(kSubviewCellSizePro*85, kSubviewCellSizePro*336, kSubviewCellSizePro*199, kSubviewCellSizePro*110);
        _addBtn.backgroundColor = [UIColor whiteColor];
        _addBtn.layer.borderWidth = 1.5;
        _addBtn.layer.cornerRadius = 4.5;
    }
    return  _addBtn;
}

#pragma mark - 预设水质数据
-(UILabel *)theBestInfo
{
    if (!_theBestInfo){
    _theBestInfo = [[UILabel alloc]init];
    _theBestInfo.frame = CGRectMake(114*kSubviewCellSizePro, 303*kSubviewCellSizePro, 140*kSubviewCellSizePro, 28*kSubviewCellSizePro);
    _theBestInfo.backgroundColor = [UIColor whiteColor];
    _theBestInfo.text = @"养金鱼最佳条件";
    _theBestInfo.textAlignment = NSTextAlignmentCenter;
    }
    return  _theBestInfo;
}

-(UILabel *)frame2FT
{
    if (!_frame2FT){
    _frame2FT = [[UILabel alloc]initWithFrame:CGRectMake(16*kSubviewCellSizePro, 340*kSubviewCellSizePro, 335*kSubviewCellSizePro, 185*kSubviewCellSizePro)];
    _frame2FT.backgroundColor = [UIColor yellowColor];
    }
    return  _frame2FT;
}

-(UILabel *)temperatureSetFrame
{
    if (!_temperatureSetFrame){
    _temperatureSetFrame = [[UILabel alloc]init];
    _temperatureSetFrame.frame = CGRectMake(65*kSubviewCellSizePro, 355*kSubviewCellSizePro, 100*kSubviewCellSizePro, 40*kSubviewCellSizePro);
    _temperatureSetFrame.backgroundColor = [UIColor whiteColor];
    _temperatureSetFrame.text = @" 温度 :";
    }
    return  _temperatureSetFrame;
}

-(UILabel *)phValueSetFrame
{
    if (!_phValueSetFrame){
    _phValueSetFrame = [[UILabel alloc]init];
    _phValueSetFrame.frame = CGRectMake(65*kSubviewCellSizePro, 410*kSubviewCellSizePro, 100*kSubviewCellSizePro, 40*kSubviewCellSizePro);
    _phValueSetFrame.backgroundColor = [UIColor whiteColor];
    _phValueSetFrame.text = @" PH值 :";
    }
    return  _phValueSetFrame;
}

-(UILabel *)oxContentSetFrame
{
    if (!_oxContentSetFrame){
    _oxContentSetFrame = [[UILabel alloc]init];
    _oxContentSetFrame.frame = CGRectMake(65*kSubviewCellSizePro, 465*kSubviewCellSizePro, 100*kSubviewCellSizePro, 40*kSubviewCellSizePro);
    _oxContentSetFrame.backgroundColor = [UIColor whiteColor];
    _oxContentSetFrame.text = @" 含氧量:";
    }
    return  _oxContentSetFrame;
}

-(UITextField *)temperatureSetTextField
{
    if (!_temperatureSetTextField){
    _temperatureSetTextField = [[UITextField alloc]init];
    _temperatureSetTextField.frame = CGRectMake(210*kSubviewCellSizePro, 355*kSubviewCellSizePro, 100*kSubviewCellSizePro, 40*kSubviewCellSizePro);
    _temperatureSetTextField.keyboardType = UIKeyboardTypeDecimalPad;
    _temperatureSetTextField.backgroundColor = [UIColor whiteColor];
    }
    return  _temperatureSetTextField;
}

-(UITextField *)phValueSetTextField
{
    if (!_phValueSetTextField){
    _phValueSetTextField = [[UITextField alloc]init];
    _phValueSetTextField.frame = CGRectMake(210*kSubviewCellSizePro, 410*kSubviewCellSizePro, 100*kSubviewCellSizePro, 40*kSubviewCellSizePro);
    _phValueSetTextField.keyboardType = UIKeyboardTypeDecimalPad;
    _phValueSetTextField.backgroundColor = [UIColor whiteColor];
    }
    return  _phValueSetTextField;
}

-(UITextField *)oxContentSetTextField
{
    if (!_oxContentSetTextField){
    _oxContentSetTextField = [[UITextField alloc]init];
    _oxContentSetTextField.frame = CGRectMake(210*kSubviewCellSizePro, 465*kSubviewCellSizePro, 100*kSubviewCellSizePro, 40*kSubviewCellSizePro);
    _oxContentSetTextField.keyboardType = UIKeyboardTypeDecimalPad;
    _oxContentSetTextField.backgroundColor = [UIColor whiteColor];
    }
    return  _oxContentSetTextField;
}

#pragma  mark - 一键设置

-(UIButton *)_setBtn
{
    if (!_setBtn){
    _setBtn = [[UIButton alloc]init];
    _setBtn.frame = CGRectMake(kSubviewCellSizePro*95, kSubviewCellSizePro*561, kSubviewCellSizePro*171, kSubviewCellSizePro*39);
    _setBtn.backgroundColor = [UIColor whiteColor];
    _setBtn.layer.borderWidth = 1.5;
    _setBtn.layer.cornerRadius = 4.5;
    }
    return  _setBtn;
}



@end
