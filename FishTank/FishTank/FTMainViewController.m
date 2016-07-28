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
#import "AFNetworking.h"
#import "FTSearchViewController.h"


@interface FTMainViewController ()
@property (nonatomic , strong)UIButton *leftBtn;
@property (nonatomic , strong)WaterQualitySet *waterQuality;
@property (nonatomic , strong)NSString *tempRT;

@property (nonatomic , strong)UITableView *mainTableView;
@property (nonatomic , strong)NSMutableArray *logs;
@property (nonatomic , strong)UIRefreshControl *refreshControl;

@property (nonatomic , strong)FTwaterQualityViewController *ftShwo;



@end

@implementation FTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGBA(0xede9e9, 255);
    self.title = @"主页";
    [self.navigationController setNavigationBarHidden:NO];
//    self.view.backgroundColor =  UIColorFromRGBA(0xede9e9, 255);
    self.navigationController.navigationBar.backgroundColor = UIColorFromRGBA(0xede9e9, 255);
    
    _ftShwo = [[FTwaterQualityViewController alloc]init];
    _waterQuality = [[WaterQualitySet alloc]init];
    
//隐藏表视图
    self.mainTableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.mainTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.mainTableView];
    
#pragma mark - 下拉刷新
    
    if (_firstLoad== NO) {
        _refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
        _refreshControl = [[UIRefreshControl alloc]init];
        [_refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
        [self.mainTableView addSubview:_refreshControl];
    }
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self loadDataFromWeb];
    
#pragma mark - 实时数据展示

    _ftShwo.temperatureRealTimeTextView.font = [UIFont systemFontOfSize:20];
    _ftShwo.temperatureRealTimeTextView.textColor = UIColorFromRGBA(0x961414, 255);
    

    _ftShwo.phValueTextRealTimeView.font = [UIFont systemFontOfSize:20];
    _ftShwo.phValueTextRealTimeView.textColor = UIColorFromRGBA(0x961414, 255);
    

    _ftShwo.oxcontentTextRealTimeView.font = [UIFont systemFontOfSize:20];
    _ftShwo.oxcontentTextRealTimeView.textColor = UIColorFromRGBA(0x961414, 255);
    
#pragma mark - 鱼缸水质提醒
    _ftShwo.temperatureShow.text = [NSString stringWithFormat:@"%@",_waterQuality.temperatureJudge];
    _ftShwo.temperatureShow.textColor = [UIColor grayColor];
    _ftShwo.phValueShow.text = [NSString stringWithFormat:@"%@",_waterQuality.phValueJudge];
    _ftShwo.phValueShow.textColor = [UIColor grayColor];
    _ftShwo.oxcontentShow.text = [NSString stringWithFormat:@"%@",_waterQuality.oxContentJudge];
    _ftShwo.oxcontentShow.textColor = [UIColor grayColor];
    //固定显示frame®
    
    [self.view addSubview:_ftShwo.ftInfo];
    [self.view addSubview:_ftShwo.frame1FT];
    [self.view addSubview:_ftShwo.temperatureRealTimeFrame];
    [self.view addSubview:_ftShwo.phValueFrameRealTimeFrame];
    [self.view addSubview:_ftShwo.oxContentRealTimeFrame];
    
    [self.view addSubview:_ftShwo.temperatureRealTimeTextView];
    [self.view addSubview:_ftShwo.phValueTextRealTimeView];
    [self.view addSubview:_ftShwo.oxcontentTextRealTimeView];
    
    [self.view addSubview:_ftShwo.line1];
    [self.view addSubview:_ftShwo.line2];
    
//第一次登陆
    if(_firstLoad == YES)
    {
// 首次登陆添加设置
     [self.view addSubview:_ftShwo._addBtn];
    }
    
    //非第一次登陆
    else
    {
        [self.view addSubview:_ftShwo.centerLine];
        [self.view addSubview:_ftShwo.theBestInfo];
        [self.view addSubview:_ftShwo.frame2FT];

        [self.view addSubview:_ftShwo.temperatureSetFrame];
        [self.view addSubview:_ftShwo.phValueSetFrame];
        [self.view addSubview:_ftShwo.oxContentSetFrame];
        [self.view addSubview:_ftShwo.temperatureShow];
        [self.view addSubview:_ftShwo.phValueShow];
        [self.view addSubview:_ftShwo.oxcontentShow];
        
        [self.view addSubview:_ftShwo.line3];
        [self.view addSubview:_ftShwo.line4];
//一键设置
        [self.view addSubview:_ftShwo._setBtn];
    }
        
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftBtn];
    self.navigationItem.leftBarButtonItem  = leftBtnItem;

    [_ftShwo.setBtn addTarget:self action:@selector(touchSettingClick) forControlEvents:UIControlEventTouchUpInside];


}

//假数据
-(WaterQualitySet *)loadDataFromWeb{
    _waterQuality = [[WaterQualitySet alloc]initWithTemperatureSet:25 phValueSet:6.5 oxContentSet:15 temperatureRealTime:28 phValueRealTime:6.8 oxContentRealTime:12];
    return _waterQuality;
}

#pragma mark - 下拉刷新
-(void)refresh
{
    if(_firstLoad)
        
    {
        
        [_refreshControl beginRefreshing];
        NSLog(@"200");
        
        return;
        
    }
    
    //模拟下载数据
    
    _firstLoad=YES;
    
    //    NSData*data=[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    
#pragma mark - 网络调用
    AFHTTPSessionManager *search = [AFHTTPSessionManager manager];
    search.responseSerializer = [AFHTTPResponseSerializer serializer];
    search.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *paramDict = @{@"fish_id":@""};
    [search POST:@"http://127.0.0.1/FishTank/index.php/Home/User/fishSearch" parameters:paramDict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSData *data = [[NSData alloc]initWithData:responseObject];
        NSDictionary *searchDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",searchDic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    
    AFHTTPSessionManager *fishTankInfo = [AFHTTPSessionManager manager];
    fishTankInfo.responseSerializer = [AFHTTPResponseSerializer serializer];
    fishTankInfo.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *fTDict = @{@"user_id":@"",
                             @"tank_id":@"",
                             @"getInfo_time":@""
                             };
    [fishTankInfo POST:@"http://127.0.0.1/FishTank/index.php/Home/User/fTInfo" parameters:paramDict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSData *data = [[NSData alloc]initWithData:responseObject];
        NSDictionary *fTInfoDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",fTInfoDic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    NSLog(@"100");
    
    _ftShwo.temperatureRealTimeTextView.text = [NSString stringWithFormat:@"%d℃",_waterQuality.temperatureRealTime];
    _ftShwo.phValueTextRealTimeView.text = [NSString stringWithFormat:@"%.1f",_waterQuality.phValueRealTime];
    _ftShwo.oxcontentTextRealTimeView.text = [NSString stringWithFormat:@"%dmg/L",_waterQuality.oxContentRealTime];
    [_mainTableView reloadData];
    
    [_refreshControl endRefreshing];
    
    _firstLoad=NO;
}



#pragma  mark - 一键设置响应事件
-(void)touchSettingClick
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"确定远程调控？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *CancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"The \"Okay/Cancel\" alert's Cancel action occured.");
    }];
    [alertVC addAction:CancelAction];
    UIAlertAction *OkAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"The \"Okay/Cancel\" alert's other action occured.");
    }];
    [alertVC addAction:OkAction];
    [self presentViewController:alertVC animated:YES completion:nil];
    
    //完成上述步骤后按照参考数据调整鱼缸水质
    
}

#pragma  mark - 响应方法

-(void)leftBtnClick{
    
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
