//
//  FTwaterQualityViewController.m
//  FishTank
//
//  Created by Mac on 16/7/15.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTwaterQualityViewController.h"
#import "WaterQualitySet.h"
#import "FTSearchViewController.h"

#define UIScreenWidth     [UIScreen mainScreen].bounds.size.width
#define UIScreenHeight    [UIScreen mainScreen].bounds.size.height

#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0  blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

#define FONT_19 IS_IPHONE_6P ? [UIFont systemFontOfSize:22] : IS_IPHONE_6 ? [UIFont systemFontOfSize:20] : [UIFont systemFontOfSize:19]

#define kSubviewCellSizePro  UIScreenWidth/1080
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

@property(nonatomic ,strong) UILabel *centerLine;


@property(nonatomic ,strong) NSString *jinYu;//用于接收鱼的种类


@end

@implementation FTwaterQualityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.temperatureShow resignFirstResponder];
}


-(UIView *)line1
{
    if (!_line1){
        _line1 = [[UIView alloc]initWithFrame:CGRectMake(211*kSubviewCellSizePro, 564*kSubviewCellSizePro, 759*kSubviewCellSizePro, 3*kSubviewCellSizePro)];
        _line1.backgroundColor = [UIColor grayColor];
    }
    return _line1;
}

-(UIView *)line2
{
    if (!_line2){
         _line2 = [[UIView alloc]initWithFrame:CGRectMake(211*kSubviewCellSizePro, 721*kSubviewCellSizePro, 759*kSubviewCellSizePro, 3*kSubviewCellSizePro)];
        _line2.backgroundColor = [UIColor grayColor];
    }
    return _line2;
}

-(UIView *)line3
{
    if (!_line3){
        _line3 = [[UIView alloc]initWithFrame:CGRectMake(211*kSubviewCellSizePro, 1285*kSubviewCellSizePro, 759*kSubviewCellSizePro, 3*kSubviewCellSizePro)];
        _line3.backgroundColor = [UIColor grayColor];
    }
    return _line3;
}

-(UIView *)line4
{
    if (!_line4){
        _line4 = [[UIView alloc]initWithFrame:CGRectMake(211*kSubviewCellSizePro, 1443*kSubviewCellSizePro, 759*kSubviewCellSizePro, 3*kSubviewCellSizePro)];
        _line4.backgroundColor = [UIColor grayColor];
    }
    return _line4;
}

#pragma mark - 实时水质数据

-(UILabel *)ftInfo
{
    if (!_ftInfo){
        _ftInfo = [[UILabel alloc]init];
        _ftInfo.frame = CGRectMake(105*kSubviewCellSizePro, 390*kSubviewCellSizePro, 90*kSubviewCellSizePro, 475*kSubviewCellSizePro);
        _ftInfo.backgroundColor = UIColorFromRGBA(0xb0c4de, 255);
        _ftInfo.text = @"鱼缸现状";
        _ftInfo.font = [UIFont systemFontOfSize:20];
        _ftInfo.numberOfLines = 4;
        _ftInfo.textAlignment  = NSTextAlignmentCenter;
        _ftInfo.layer.cornerRadius = 4.5;
        _ftInfo.layer.masksToBounds = YES;
        NSLog(@"%f",UIScreenWidth);
        NSLog(@"%f",UIScreenHeight);
    }
    return _ftInfo;
}
-(UILabel *)frame1FT
{
    if (!_frame1FT){
        _frame1FT = [[UILabel alloc]initWithFrame:CGRectMake(205*kSubviewCellSizePro, 390*kSubviewCellSizePro, 770*kSubviewCellSizePro, 474*kSubviewCellSizePro)];
        _frame1FT.backgroundColor = UIColorFromRGBA(0xEDE9E9, 255);
        _frame1FT.layer.borderWidth = 1.2;
        _frame1FT.layer.cornerRadius = 4.5;
    }
    return _frame1FT;
}

-(UILabel *)temperatureRealTimeFrame
{
    if (!_temperatureRealTimeFrame){
        _temperatureRealTimeFrame = [[UILabel alloc]init];
        _temperatureRealTimeFrame.frame = CGRectMake(225*kSubviewCellSizePro, 410*kSubviewCellSizePro, 200*kSubviewCellSizePro, 150*kSubviewCellSizePro);
        _temperatureRealTimeFrame.backgroundColor = UIColorFromRGBA(0xEDE9E9, 255);
        _temperatureRealTimeFrame.text = @" 温度值 ";
        _temperatureRealTimeFrame.font = [UIFont systemFontOfSize:20];
        _temperatureRealTimeFrame.textColor = [UIColor grayColor];
        }
    return  _temperatureRealTimeFrame;
}

-(UILabel *)phValueFrameRealTimeFrame{
    if (!_phValueFrameRealTimeFrame){
        _phValueFrameRealTimeFrame = [[UILabel alloc]init];
        _phValueFrameRealTimeFrame.frame = CGRectMake(225*kSubviewCellSizePro, 570*kSubviewCellSizePro, 200*kSubviewCellSizePro, 140*kSubviewCellSizePro);
        _phValueFrameRealTimeFrame.backgroundColor = UIColorFromRGBA(0xEDE9E9, 255);
        _phValueFrameRealTimeFrame.text = @" PH值 ";
        _phValueFrameRealTimeFrame.font = [UIFont systemFontOfSize:20];
        _phValueFrameRealTimeFrame.textColor = [UIColor grayColor];
       ;
    }
    return  _phValueFrameRealTimeFrame;
}
-(UILabel *)oxContentRealTimeFrame
{
    if (!_oxContentRealTimeFrame){
        _oxContentRealTimeFrame = [[UILabel alloc]init];
        _oxContentRealTimeFrame.frame = CGRectMake(225*kSubviewCellSizePro, 733*kSubviewCellSizePro, 200*kSubviewCellSizePro, 120*kSubviewCellSizePro);
        _oxContentRealTimeFrame.backgroundColor = UIColorFromRGBA(0xEDE9E9, 255);
        _oxContentRealTimeFrame.text = @" 含氧量";
        _oxContentRealTimeFrame.font = [UIFont systemFontOfSize:20];
        _oxContentRealTimeFrame.textColor = [UIColor grayColor];
            }
    return  _oxContentRealTimeFrame;
}
-(UILabel *)temperatureRealTimeTextView
{
    if (!_temperatureRealTimeTextView){
        _temperatureRealTimeTextView = [[UILabel alloc]init];
        _temperatureRealTimeTextView.frame = CGRectMake(745*kSubviewCellSizePro, 410*kSubviewCellSizePro, 200*kSubviewCellSizePro, 150*kSubviewCellSizePro);
        _temperatureRealTimeTextView.backgroundColor = UIColorFromRGBA(0xEDE9E9, 255);
    }
    return  _temperatureRealTimeTextView;
}
-(UILabel *)phValueTextRealTimeView
{
    if (!_phValueTextRealTimeView){
        _phValueTextRealTimeView = [[UILabel alloc]init];
        _phValueTextRealTimeView.frame = CGRectMake(745*kSubviewCellSizePro, 570*kSubviewCellSizePro, 200*kSubviewCellSizePro, 140*kSubviewCellSizePro);
        _phValueTextRealTimeView.backgroundColor = UIColorFromRGBA(0xEDE9E9, 255);
        }
    return  _phValueTextRealTimeView;
}

-(UILabel *)oxcontentTextRealTimeView
{
    if (!_oxcontentTextRealTimeView){
        _oxcontentTextRealTimeView = [[UILabel alloc]init];
        _oxcontentTextRealTimeView.frame = CGRectMake(745*kSubviewCellSizePro, 733*kSubviewCellSizePro, 200*kSubviewCellSizePro, 120*kSubviewCellSizePro);
        _oxcontentTextRealTimeView.backgroundColor = UIColorFromRGBA(0xEDE9E9, 255);
       ;
    }
    return  _oxcontentTextRealTimeView;
}

#pragma  mark - 首次登陆添加设置
-(UIButton *)_addBtn
{
    if (!_addBtn){
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addBtn.frame = CGRectMake(kSubviewCellSizePro*800, kSubviewCellSizePro*1600, kSubviewCellSizePro*200, kSubviewCellSizePro*200);
        _addBtn.backgroundColor = UIColorFromRGBA(0xEDE9E9, 255);
        [_addBtn setImage:[UIImage imageNamed:@"鱼缸－首页添加"] forState:UIControlStateNormal];
        [_addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return  _addBtn;
}
#pragma makr - 添加设置响应方法
-(void)addBtnClick{
    NSLog(@"000.000");
    FTSearchViewController *svc = [[FTSearchViewController alloc]init];
    [self.navigationController pushViewController:svc animated:YES];
}

#pragma mark - 预设水质数据
-(UILabel *)centerLine
{
    if (!_centerLine){
        _centerLine = [[UILabel alloc]init];
        _centerLine.frame = CGRectMake(20*kSubviewCellSizePro, 945*kSubviewCellSizePro, 1040*kSubviewCellSizePro, 100*kSubviewCellSizePro);
        _centerLine.backgroundColor = UIColorFromRGBA(0xede9e9, 255);
        _centerLine.text = @"   —————— 标准数据参考 ——————";
        
        _centerLine.font = [UIFont systemFontOfSize:20];
        _centerLine.textColor = [UIColor grayColor];

        }
    return  _centerLine;
}

-(UILabel *)theBestInfo
{
    if (!_theBestInfo){
        _theBestInfo = [[UILabel alloc]init];
        _theBestInfo.frame = CGRectMake(105*kSubviewCellSizePro, 1110*kSubviewCellSizePro, 90*kSubviewCellSizePro, 475*kSubviewCellSizePro);
        _theBestInfo.backgroundColor = UIColorFromRGBA(0xb0c4de, 255);
        _theBestInfo.text = [NSString stringWithFormat:@"%@",_jinYu];
        _theBestInfo.font = [UIFont systemFontOfSize:20];
        _theBestInfo.numberOfLines = [_jinYu length];
        _theBestInfo.textAlignment = NSTextAlignmentCenter;
        _theBestInfo.layer.cornerRadius = 4.5;
        _theBestInfo.layer.masksToBounds = YES;

    }
    return  _theBestInfo;
}

-(UILabel *)frame2FT
{
    if (!_frame2FT){
        _frame2FT = [[UILabel alloc]initWithFrame:CGRectMake(205*kSubviewCellSizePro, 1110*kSubviewCellSizePro, 770*kSubviewCellSizePro, 474*kSubviewCellSizePro)];
        _frame2FT.backgroundColor = UIColorFromRGBA(0xEDE9E9, 255);
        _frame2FT.layer.borderWidth = 1.2;
        _frame2FT.layer.cornerRadius = 4.5;
    }
    return  _frame2FT;
}

-(UILabel *)temperatureSetFrame
{
    if (!_temperatureSetFrame){
        _temperatureSetFrame = [[UILabel alloc]init];
        _temperatureSetFrame.frame = CGRectMake(225*kSubviewCellSizePro, 1130*kSubviewCellSizePro, 200*kSubviewCellSizePro, 150*kSubviewCellSizePro);
        _temperatureSetFrame.backgroundColor = UIColorFromRGBA(0xEDE9E9, 255);
        _temperatureSetFrame.text = @" 温度值 ";
        _temperatureSetFrame.font = [UIFont systemFontOfSize:20];
        _temperatureSetFrame.textColor = [UIColor grayColor];
       
    }
    return  _temperatureSetFrame;
}

-(UILabel *)phValueSetFrame
{
    if (!_phValueSetFrame){
        _phValueSetFrame = [[UILabel alloc]init];
        _phValueSetFrame.frame = CGRectMake(225*kSubviewCellSizePro, 1290*kSubviewCellSizePro, 200*kSubviewCellSizePro, 140*kSubviewCellSizePro);
        _phValueSetFrame.backgroundColor = UIColorFromRGBA(0xEDE9E9, 255);
        _phValueSetFrame.text = @" PH值 ";
        _phValueSetFrame.font = [UIFont systemFontOfSize:20];
        _phValueSetFrame.textColor = [UIColor grayColor];
     
    }
    return  _phValueSetFrame;
}

-(UILabel *)oxContentSetFrame
{
    if (!_oxContentSetFrame){
        _oxContentSetFrame = [[UILabel alloc]init];
        _oxContentSetFrame.frame = CGRectMake(225*kSubviewCellSizePro, 1453*kSubviewCellSizePro, 200*kSubviewCellSizePro, 120*kSubviewCellSizePro);
        _oxContentSetFrame.backgroundColor = UIColorFromRGBA(0xEDE9E9, 255);
        _oxContentSetFrame.text = @" 含氧量";
        _oxContentSetFrame.font = [UIFont systemFontOfSize:20];
        _oxContentSetFrame.textColor = [UIColor grayColor];

    }
    return  _oxContentSetFrame;
}

-(UILabel *)temperatureShow
{
    if (!_temperatureShow) {
        _temperatureShow = [[UILabel alloc]init];
        _temperatureShow.frame = CGRectMake(725*kSubviewCellSizePro, 1130*kSubviewCellSizePro, 230*kSubviewCellSizePro, 150*kSubviewCellSizePro);
        _temperatureShow.backgroundColor =  UIColorFromRGBA(0xEDE9E9, 255);
        
    }
    return _temperatureShow;
}

-(UILabel *)phValueShow
{
    if (!_phValueShow) {
        _phValueShow = [[UILabel alloc]init];
        _phValueShow.frame = CGRectMake(725*kSubviewCellSizePro, 1290*kSubviewCellSizePro, 230*kSubviewCellSizePro, 140*kSubviewCellSizePro);
        _phValueShow.backgroundColor =  UIColorFromRGBA(0xEDE9E9, 255);

    }
    return _phValueShow;
}
-(UILabel *)oxcontentShow
{
    if (!_oxcontentShow) {
        _oxcontentShow = [[UILabel alloc]init];
        _oxcontentShow.frame = CGRectMake(725*kSubviewCellSizePro, 1453*kSubviewCellSizePro, 230*kSubviewCellSizePro, 120*kSubviewCellSizePro);
        _oxcontentShow.backgroundColor = UIColorFromRGBA(0xEDE9E9, 255);

    }
    return _oxcontentShow;
}
#pragma  mark - 一键设置

-(UIButton *)_setBtn
{
    if (!_setBtn){
        _setBtn = [[UIButton alloc]init];
        _setBtn.frame = CGRectMake(UIScreenWidth/2-50, kSubviewCellSizePro*1670, kSubviewCellSizePro*300, kSubviewCellSizePro*80);
        _setBtn.backgroundColor = UIColorFromRGBA(0xEDE9E9, 255);
        _setBtn.layer.borderWidth = 0.8;
        _setBtn.layer.cornerRadius = 4.5;
        [_setBtn setTitle:@"一键调整" forState:UIControlStateNormal];
        [_setBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [_setBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        
    }
    return  _setBtn;
}



@end
