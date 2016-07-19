//
//  FTMyFishBallViewController.m
//  FishTank
//
//  Created by Student03 on 16/7/14.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTMyFishBallViewController.h"
#import "FTUserViewController.h"
@interface FTMyFishBallViewController ()
//@property(nonatomic,strong) UIView *myballtopView;
@property(nonatomic,strong) UIButton *goldfishBtn;
@property(nonatomic,strong) UIButton *koifishBtn;
@property(nonatomic,strong) UIButton *maryfishBtn;

@end

@implementation FTMyFishBallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.goldfishBtn];
    [self.view addSubview:self.koifishBtn];
    [self.view addSubview:self.maryfishBtn];
    UIBarButtonItem *tankleftBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(tankbackBtnClick)];
    self.navigationItem.leftBarButtonItem  = tankleftBtn;


   self.title=@"我的鱼缸";

    //[self.view addSubview:self.myballtopView];
}
#pragma mark - getter
-(UIButton *)goldfishBtn{
    if(!_goldfishBtn){
        _goldfishBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _goldfishBtn.frame=CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 40);
        _goldfishBtn.backgroundColor=[UIColor colorWithRed:127 green:255 blue:212 alpha:1.0];
        [_goldfishBtn setTitle:@"金鱼" forState:UIControlStateNormal];
        [_goldfishBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _goldfishBtn.layer.borderWidth=1;
        [_goldfishBtn addTarget:self action:@selector(goldBtntoDataViewClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goldfishBtn;
}
-(UIButton *)koifishBtn{
    if(!_koifishBtn){
        _koifishBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _koifishBtn.frame=CGRectMake(0, 170, [UIScreen mainScreen].bounds.size.width, 40);
        _koifishBtn.backgroundColor=[UIColor yellowColor];
        [_koifishBtn setTitle:@"锦鲤" forState:UIControlStateNormal];
        [_koifishBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _koifishBtn.layer.borderWidth=1;
        [_koifishBtn addTarget:self action:@selector(koiBtntoDataViewClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _koifishBtn;
}
-(UIButton *)maryfishBtn{
    if(!_maryfishBtn){
        _maryfishBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _maryfishBtn.frame=CGRectMake(0, 240, [UIScreen mainScreen].bounds.size.width, 40);
        _maryfishBtn.backgroundColor=[UIColor orangeColor];
        [_maryfishBtn setTitle:@"马丽鱼" forState:UIControlStateNormal];
        [_maryfishBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _maryfishBtn.layer.borderWidth=1;
        [_maryfishBtn addTarget:self action:@selector(maryBtntoDataViewClick) forControlEvents:UIControlEventTouchUpInside];
        [_maryfishBtn setBackgroundImage:[UIImage imageNamed:@"123.jpg"] forState:UIControlStateNormal];
    }
    return _maryfishBtn;
}
//-(UIView *)myballtopView{
//    if(!_myballtopView){
//        _myballtopView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
//        _myballtopView.backgroundColor=[UIColor blueColor];
//    }
//    return _myballtopView;
//}
-(void)tankbackBtnClick{
    FTUserViewController *backVC = [[FTUserViewController alloc]init];
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
