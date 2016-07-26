//
//  FTUserInfoViewController.m
//  FishTank
//
//  Created by Student05 on 16/7/15.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTUserInfoViewController.h"
#import "FTUserViewController.h"
#define ScreenWidth  self.view.frame.size.width
#define ScreenHeight self.view.frame.size.height
#define  HeadX      (ScreenWidth-0.25*ScreenWidth)/2
#define  HeadY        80
#define HeadWidth     0.25*ScreenWidth
#define HeadHeight    0.25*ScreenWidth
@interface FTUserInfoViewController ()
@property (nonatomic ,strong)UITextField *nicknametext;
@property (nonatomic ,strong)UIView *lineView;
//@property (nonatomic ,strong)UIButton *UserImageBtn;
//@property (nonatomic , strong)UILabel *nicknamelabel;
//@property (nonatomic , strong)UITextField *nicknametext;
//@property (nonatomic , strong)UIButton *signoutBtn;
//@property (nonatomic, weak) id<PassValueDelegate> delegate;
@end

@implementation FTUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorFromRGB(0xede9e9);
    _nicknametext =[[UITextField alloc]initWithFrame:CGRectMake(5, 100, ScreenWidth, 100)];
    _nicknametext.text =@"Mr.李";
    _nicknametext.placeholder = @"输入你的新昵称";
    [self.view addSubview:_nicknametext];
    [_nicknametext setValue:@20 forKey:@"LimitInput"];
    _lineView = [[UIView alloc]initWithFrame:CGRectMake(5, 170, ScreenWidth-10, 1)];
    _lineView.layer.borderWidth =1;
    _lineView.layer.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor blackColor]);
    [self.view addSubview:_lineView];
        //确定修改
        UIBarButtonItem *rightBtn=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(rightBtnClick)];
        self.navigationItem.rightBarButtonItem =rightBtn;
    
}
//确定按钮的点击事件
- (void)rightBtnClick
{
    NSLog(@"确定修改");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
