//
//  FTFindPasswordViewController.m
//  FishTank
//
//  Created by Student07 on 16/7/15.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTFindPasswordViewController.h"
#import "FTMainViewController.h"
@interface FTFindPasswordViewController ()
@property(nonatomic,strong) UIImageView *backgroundIV;
@property(nonatomic,strong) UIButton *sendCodeBtn;

@property(nonatomic,strong) UITextField *phoneNumberTF;
@property(nonatomic,strong) UITextField *verificationCodeTF;
@property(nonatomic,strong) UITextField *passwordTF;
@property(nonatomic,strong) UITextField *confirmPasswordTF;

@property(nonatomic,strong) UIButton *loginBtn;

@end

@implementation FTFindPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self loadCotrol];
}
#pragma  mark - loadControl
-(void)loadCotrol{
    [self.view addSubview:self.backgroundIV];
    
    [self.backgroundIV addSubview:self.phoneNumberTF];
    [self.backgroundIV addSubview:self.verificationCodeTF];
    [self.backgroundIV addSubview:self.passwordTF];
    [self.backgroundIV addSubview:self.confirmPasswordTF];
    
    [self.backgroundIV addSubview:self.sendCodeBtn];
    [self.backgroundIV addSubview:self.loginBtn];
    
    self.title = @"找回密码";
}

#pragma mark - BGImageView getter
//设置背景图
-(UIImageView *)backgroundIV{
    if (!_backgroundIV) {
        _backgroundIV = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _backgroundIV.userInteractionEnabled = YES;
        _backgroundIV.image = [UIImage imageNamed:@"backgroundIV"];
    }
    return _backgroundIV;
}
#pragma  mark - TextFile getter
-(UITextField *)phoneNumberTF{
    if (!_phoneNumberTF) {
        _phoneNumberTF = [[UITextField alloc]initWithFrame:CGRectMake(18, 120, 378, 54)];
        _phoneNumberTF.borderStyle =UITextBorderStyleRoundedRect;
        _phoneNumberTF.clearButtonMode = UITextFieldViewModeAlways;
        _phoneNumberTF.placeholder = @"手机号";
        //加左图标
        UIImageView *user = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"phone"]];
        _phoneNumberTF.leftView = user;
        _phoneNumberTF.leftViewMode = UITextFieldViewModeAlways;
    }
    return _phoneNumberTF;
}
-(UITextField *)verificationCodeTF{
    if (!_verificationCodeTF) {
        _verificationCodeTF = [[UITextField alloc]initWithFrame:CGRectMake(_phoneNumberTF.frame.origin.x, _phoneNumberTF.frame.origin.y+80, 378, 54)];
        _verificationCodeTF.placeholder = @"验证码";
        _verificationCodeTF.borderStyle = UITextBorderStyleRoundedRect;
        _verificationCodeTF.clearButtonMode = UITextFieldViewModeAlways;
    }
    return _verificationCodeTF;
}

-(UITextField *)passwordTF{
    if (!_passwordTF) {
        _passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(_verificationCodeTF.frame.origin.x, _verificationCodeTF.frame.origin.y+80, 378, 54)];
        _passwordTF.placeholder = @"输入密码";
        _passwordTF.borderStyle = UITextBorderStyleRoundedRect;
        _passwordTF.clearButtonMode = UITextFieldViewModeAlways;
        //加图标
        UIImageView *key = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"key"]];
        _passwordTF.leftView = key;
        _passwordTF.leftViewMode = UITextFieldViewModeAlways;
        
    }
    return _passwordTF;
}

-(UITextField *)confirmPasswordTF{
    if (!_confirmPasswordTF) {
        _confirmPasswordTF = [[UITextField alloc]initWithFrame:CGRectMake(_passwordTF.frame.origin.x, _passwordTF.frame.origin.y+80, 378, 54)];
        _confirmPasswordTF.placeholder =@"确认密码";
        _confirmPasswordTF.borderStyle = UITextBorderStyleRoundedRect;
        _confirmPasswordTF.clearButtonMode = UITextFieldViewModeAlways;
        //加图标
        UIImageView *key = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"key"]];
        _confirmPasswordTF.leftView = key;
        _confirmPasswordTF.leftViewMode = UITextFieldViewModeAlways;
        
    }
    
    return _confirmPasswordTF;
}

#pragma  mark - loginBtn getter
-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(_confirmPasswordTF.frame.origin.x, _confirmPasswordTF.frame.origin.y+100, 378, 54)];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.backgroundColor = [UIColor redColor];
        [_loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return  _loginBtn;
}
#pragma mark - sendCodeBtn getter
-(UIButton *)sendCodeBtn{
    if (!_sendCodeBtn) {
        _sendCodeBtn = [[UIButton alloc]initWithFrame:CGRectMake(_phoneNumberTF.frame.origin.x+278, 120, 100, 54)];
        [_sendCodeBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        [_sendCodeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_sendCodeBtn addTarget:self action:@selector(sendCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendCodeBtn;
}
#pragma  mark - LoginBtn 响应事件
-(void)loginBtnClick{
    //跳转到主页，是老用户用户
    FTMainViewController *mainVC = [[FTMainViewController alloc]init];
    [self.navigationController pushViewController:mainVC animated:YES];
}
#pragma  mark - SendCodeBtn 响应事件
-(void)sendCodeBtnClick{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
