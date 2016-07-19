//
//  FTMainViewController.m
//  FishTank
//
//  Created by 天津财经大学信科二 on 16/7/13.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTMainViewController.h"
#import "FTUserViewController.h"
#import "FTwaterQualityViewController.h"
#import "WaterQualitySet.h"


#define kSubviewCellSizePro 1.1

@interface FTMainViewController ()
@property (nonatomic , strong)UIButton *leftBtn;
@property (nonatomic , assign) WaterQualitySet *waterQuality;



@end

@implementation FTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主页";
    self.view.backgroundColor = [UIColor whiteColor];
    FTwaterQualityViewController * ftShwo = [[FTwaterQualityViewController alloc]init];
    BOOL isSetting = YES;
    
    [self loadDateFromWeb];
    
    //固定显示frame
    [self.view addSubview:ftShwo.ftInfo];
    [self.view addSubview:ftShwo.frame1FT];
    [self.view addSubview:ftShwo.temperatureRealTimeFrame];
    [self.view addSubview:ftShwo.phValueFrameRealTimeFrame];
    [self.view addSubview:ftShwo.oxContentRealTimeFrame];
    
    [self.view addSubview:ftShwo.temperatureRealTimeTextView];
    [self.view addSubview:ftShwo.phValueTextRealTimeView];
    [self.view addSubview:ftShwo.oxcontentTextRealTimeView];
    
    ftShwo.temperatureRealTimeTextView.text = self.loadDateFromWeb.temperatureRealTime;
    ftShwo.phValueTextRealTimeView.text = self.loadDateFromWeb.phValueRealTime;
    ftShwo.oxcontentTextRealTimeView.text = self.loadDateFromWeb.oxContentRealTime;
    ftShwo.temperatureSetTextField.text = self.loadDateFromWeb.temperatureSet;
    ftShwo.phValueSetTextField.text = self.loadDateFromWeb.phValueSet;
    ftShwo.oxContentSetTextField.text = self.loadDateFromWeb.oxContentSet;
    //第一次登陆
    if(isSetting == YES)
    {
#pragma  mark - 首次登陆添加设置
        [self.view addSubview:ftShwo._addBtn];
    }
    
    //非第一次登陆
    else
    {
        [self.view addSubview:ftShwo.theBestInfo];
        [self.view addSubview:ftShwo.frame2FT];
        [self.view addSubview:ftShwo.temperatureSetFrame];
        [self.view addSubview:ftShwo.phValueSetFrame];
        [self.view addSubview:ftShwo.oxContentSetFrame];
        
        [self.view addSubview:ftShwo.temperatureSetTextField];
        [self.view addSubview:ftShwo.phValueSetTextField];
        [self.view addSubview:ftShwo.oxContentSetTextField];
#pragma  mark - 一键设置
        [self.view addSubview:ftShwo._setBtn];
    }
    
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftBtn];
    self.navigationItem.leftBarButtonItem  = leftBtnItem;
    
    
}

//假数据
-(WaterQualitySet *)loadDateFromWeb{
    WaterQualitySet *waterQuality = [[WaterQualitySet alloc]initWithTemperatureSet:@"25.0" phValueSet:@"6.8" oxContentSet:@"10.0" temperatureRealTime:@"28.0" phValueRealTime:@"7.0" oxContentRealTime:@"8.0"];
    return waterQuality;
}



#pragma  mark - 响应方法

-(void)leftBtnClick{
    
    
    FTUserViewController *userVC = [[FTUserViewController alloc]initWithTitle:@"我的"];
    [self.navigationController pushViewController:userVC animated:YES];
    
}

#pragma makr - 添加设置响应
-(void)addBtnClick{
    
    FTUserViewController *userVC = [[FTUserViewController alloc]initWithTitle:@"我的"];
    [self.navigationController pushViewController:userVC animated:YES];
}


#pragma  mark - getters

-(UIButton *)leftBtn{
    
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.frame = CGRectMake(0, 0, 30, 30);
        [_leftBtn setTitle:@"我的" forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _leftBtn.backgroundColor = [UIColor whiteColor];
        _leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_leftBtn.layer setMasksToBounds:YES];
        [_leftBtn.layer setCornerRadius:15.0];
        [_leftBtn.layer setBorderColor:[[UIColor grayColor] CGColor]];
        [_leftBtn.layer setBorderWidth:1.0];
    }
    return _leftBtn;
}



@end
