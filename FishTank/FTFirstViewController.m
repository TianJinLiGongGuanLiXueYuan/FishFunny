//
//  FTFirstViewController.m
//  FishTank
//
//  Created by 天津财经大学信科二 on 16/7/14.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTFirstViewController.h"
#import "FTRegisterViewController.h"
#import "FTMainViewController.h"
#import "FTFindPasswordViewController.h"
@interface FTFirstViewController ()
@property(nonatomic,strong) UILabel *titleLabel;
@property(nonatomic,strong) UIImageView *backgroundIV;

@property(nonatomic,strong) UITextField *userNameTF;
@property(nonatomic,strong) UITextField *passwordTF;

@property(nonatomic,strong) UIButton *forgetPasswordBtn;
@property(nonatomic,strong) UIButton *registerBtn;
@property(nonatomic,strong) UIButton *loginBtn;

@end

@implementation FTFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面控件
    [self loadControl];
    
    
    }
#pragma mark - loadControl
-(void)loadControl{
    [self.view addSubview:self.backgroundIV];
    [self.backgroundIV addSubview:self.titleLabel];
    
    [self.backgroundIV addSubview:self.userNameTF];
    [self.backgroundIV addSubview:self.passwordTF];
    
    [self.backgroundIV addSubview:self.forgetPasswordBtn];
    
    [self.backgroundIV addSubview:self.registerBtn];
    [self.backgroundIV addSubview:self.loginBtn];
}

#pragma mark - Label getter
-(UILabel *)titleLabel{
    if (!_titleLabel) {
       _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(_backgroundIV.center.x-80, _backgroundIV.center.y-260, 150, 100)];
        _titleLabel.text = @"登录";
        _titleLabel.font = [UIFont systemFontOfSize:40];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.alpha = 50;
        
        
    }
    return  _titleLabel;
}
#pragma mark - Image getter
//设置背景图
-(UIImageView *)backgroundIV{
    if (!_backgroundIV) {
        _backgroundIV = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _backgroundIV.userInteractionEnabled = YES;
        _backgroundIV.image = [UIImage imageNamed:@"backgroundIV"];
        //点击背景图，收起键盘
        UITapGestureRecognizer *clickTGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backgroundClick)];
        [_backgroundIV addGestureRecognizer:clickTGR];
    }
    return _backgroundIV;
}

-(void)backgroundClick{
    [self.userNameTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
}
#pragma  mark - TextFile getter
-(UITextField *)userNameTF{
    if(!_userNameTF){
        
        _userNameTF = [[UITextField alloc]initWithFrame:CGRectMake(40, 250,320, 50)];
        _userNameTF.borderStyle = UITextBorderStyleRoundedRect;
        _userNameTF.clearButtonMode = UITextFieldViewModeAlways;
        _userNameTF.placeholder = @"账户名";
        //设置键盘上的返回键
        _userNameTF.returnKeyType = UIReturnKeyNext;
        _userNameTF.delegate = self;
        //加上小人物图标
        UIImageView *user = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"user"]];
        _userNameTF.leftView = user;
        _userNameTF.leftViewMode = UITextFieldViewModeAlways;
    }
    return _userNameTF;
}
-(UITextField *)passwordTF{
    if(!_passwordTF){
        _passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(40, 350, 320, 50)];
        //设置边框
        _passwordTF.borderStyle = UITextBorderStyleRoundedRect;
        //水印
        _passwordTF.placeholder = @"密码";
        //输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
        _passwordTF.clearButtonMode = UITextFieldViewModeAlways;
        //输入的内容是密文
        _passwordTF.secureTextEntry = YES;
        //加上钥匙图标图标
        UIImageView *key = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"key"]];
        _passwordTF.leftView = key;
        _passwordTF.leftViewMode = UITextFieldViewModeAlways;
        
    }
    return  _passwordTF;
}

#pragma mark - 实现 UITextFile 的协议方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.userNameTF resignFirstResponder];
    [self.passwordTF becomeFirstResponder];
    return YES;
}
#pragma  mark - Button getter
-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(40, 440, 320, 50)];
        _loginBtn.backgroundColor = [UIColor redColor];
        [_loginBtn setTitle:@"登          录" forState:UIControlStateNormal];
        [_loginBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [_loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}
-(UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(180, 510, 80 ,10)];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return  _registerBtn;
}

-(UIButton *)forgetPasswordBtn{
    if (!_forgetPasswordBtn) {
        _forgetPasswordBtn = [[UIButton alloc]initWithFrame:CGRectMake(280, 510, 80, 10)];
        [_forgetPasswordBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
        _forgetPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_forgetPasswordBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_forgetPasswordBtn addTarget:self action:@selector(forgetPasswordBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _forgetPasswordBtn;
}
#pragma mark - loginBtn 响应方法
-(void)loginBtnClick{
    //跳转到主页面，是老用户
    FTMainViewController *mainVC = [[FTMainViewController alloc]init];
    [self.navigationController pushViewController:mainVC animated:YES];
}
#pragma mark － registerBtn 响应方法
-(void)registerBtnClick{
    //跳转到注册页面
    FTRegisterViewController *registerVC = [[FTRegisterViewController alloc]init];
    [self.navigationController pushViewController:registerVC animated:YES];
}
#pragma mark - forgetPasswordBtn 响应方法
-(void)forgetPasswordBtnClick{
    //跳转到找回密码页
    FTFindPasswordViewController *findPasswordVC = [[FTFindPasswordViewController alloc]init];
    [self.navigationController pushViewController:findPasswordVC animated:YES];
}
@end
