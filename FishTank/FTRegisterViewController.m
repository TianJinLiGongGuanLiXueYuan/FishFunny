//
//  FTRegisterViewController.m
//  FishTank
//
//  Created by Student07 on 16/7/14.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTRegisterViewController.h"
#import "FTFirstViewController.h"
#import "FTMainViewController.h"
/*
 导入短信接口
 */
#import <SMS_SDK/SMSSDK.h>
#import <SMS_SDK/Extend/SMSSDK+AddressBookMethods.h>
#import <SMS_SDK/Extend/SMSSDK+DeprecatedMethods.h>
#import <SMS_SDK/Extend/SMSSDK+ExtexdMethods.h>

@interface FTRegisterViewController ()
@property(nonatomic,strong) UIImageView *backgroundIV;
@property(nonatomic,strong) UIButton *sendCodeBtn;

@property(nonatomic,strong) UITextField *phoneNumberTF;
@property(nonatomic,strong) UITextField *verificationCodeTF;
@property(nonatomic,strong) UITextField *passwordTF;
@property(nonatomic,strong) UITextField *confirmPasswordTF;

@property(nonatomic,strong) UIButton *loginBtn;
@end

@implementation FTRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面控件
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
    
    self.title = @"注册";
}

#pragma mark - BGImageView getter
//设置背景图
-(UIImageView *)backgroundIV{
    if (!_backgroundIV) {
        _backgroundIV = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _backgroundIV.userInteractionEnabled = YES;
        _backgroundIV.image = [UIImage imageNamed:@"backgroundIV"];
        UITapGestureRecognizer *clickTGP = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backgroundIVClick)];
        [_backgroundIV addGestureRecognizer:clickTGP];
    }
    return _backgroundIV;
}
-(void)backgroundIVClick{
    //点击背景图，隐藏输入框的键盘
    [self.phoneNumberTF resignFirstResponder];
    [self.verificationCodeTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
    [self.confirmPasswordTF resignFirstResponder];
}
#pragma  mark - TextFile getter
-(UITextField *)phoneNumberTF{
    if (!_phoneNumberTF) {
        _phoneNumberTF = [[UITextField alloc]initWithFrame:CGRectMake(18, 120, 378, 54)];
        _phoneNumberTF.borderStyle = UITextBorderStyleRoundedRect;
//        _phoneNumberTF.clearButtonMode = UITextFieldViewModeAlways;
        _phoneNumberTF.placeholder = @"手机号";
        //把键盘设置为数字键盘
        _phoneNumberTF.keyboardType = UIKeyboardTypeNumberPad;
        //加左图标
        UIImageView *user = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"phone"]];
        _phoneNumberTF.leftView = user;
        _phoneNumberTF.leftViewMode = UITextFieldViewModeAlways;
        //给手机号码输入框，设置验证方法
        [_phoneNumberTF addTarget:self action:@selector(numberTFChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _phoneNumberTF;
}
-(UITextField *)verificationCodeTF{
    if (!_verificationCodeTF) {
        _verificationCodeTF = [[UITextField alloc]initWithFrame:CGRectMake(_phoneNumberTF.frame.origin.x, _phoneNumberTF.frame.origin.y+80, 378, 54)];
        _verificationCodeTF.placeholder = @"验证码";
        //把输入键盘 设置为 数字键盘
        _verificationCodeTF.keyboardType = UIKeyboardTypeNumberPad;
        _verificationCodeTF.borderStyle = UITextBorderStyleRoundedRect;
        _verificationCodeTF.clearButtonMode = UITextFieldViewModeAlways;
        [_verificationCodeTF addTarget:self action:@selector(numberTFChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _verificationCodeTF;
}

-(UITextField *)passwordTF{
    if (!_passwordTF) {
        _passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(_verificationCodeTF.frame.origin.x, _verificationCodeTF.frame.origin.y+80, 378, 54)];
        _passwordTF.placeholder = @"输入密码";
        _passwordTF.secureTextEntry = YES;
        _passwordTF.borderStyle = UITextBorderStyleRoundedRect;
        _passwordTF.clearButtonMode = UITextFieldViewModeAlways;
        //加图标
        UIImageView *key = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"key"]];
        _passwordTF.leftView = key;
        _passwordTF.leftViewMode = UITextFieldViewModeAlways;
        //给密码框添加 长度限制方法
        [_passwordTF addTarget:self action:@selector(passwordTFChanged:) forControlEvents:UIControlEventEditingDidEnd];
    }
    return _passwordTF;
}

-(UITextField *)confirmPasswordTF{
    if (!_confirmPasswordTF) {
        _confirmPasswordTF = [[UITextField alloc]initWithFrame:CGRectMake(_passwordTF.frame.origin.x, _passwordTF.frame.origin.y+80, 378, 54)];
        _confirmPasswordTF.placeholder =@"确认密码";
        _confirmPasswordTF.secureTextEntry = YES;
        _confirmPasswordTF.borderStyle = UITextBorderStyleRoundedRect;
        _confirmPasswordTF.clearButtonMode = UITextFieldViewModeAlways;
        //加图标
        UIImageView *key = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"key"]];
        _confirmPasswordTF.leftView = key;
        _confirmPasswordTF.leftViewMode = UITextFieldViewModeAlways;
        //给确认密码框添加，检验两次输入的密码是否一致的 方法
        [_confirmPasswordTF addTarget:self action:@selector(passwordTFChanged:) forControlEvents:UIControlEventEditingDidEnd];
    }

    return _confirmPasswordTF;
}
#pragma  mark - _phoneNumberTF & verificationCodeTF的响应方法
-(void)numberTFChanged:(UITextField *)textField{
    if (textField == self.phoneNumberTF) {
        if (textField.text.length>11) {
            textField.text = [textField.text substringFromIndex:11];
        }
    } else {
            if (textField.text.length>4) {
                textField.text = [textField.text substringFromIndex:4];
            }
        }

}

#pragma  mark - confirmPasswordTF 响应方法
-(void)passwordTFChanged:(UITextField *)textField{
    //先判断输入密码的长度，不能少于6位
    if (textField.text.length<6) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"密码的长度不能少于6位！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];

    }else{
        //判断两次输入的密码是否一致
        if (self.confirmPasswordTF.text!=self.passwordTF.text) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"两次输入的密码不一致,请重新输入！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert show];
        }
    }
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
        _sendCodeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _sendCodeBtn.frame = CGRectMake(_phoneNumberTF.frame.origin.x+278, 120, 100, 54);
        _sendCodeBtn.backgroundColor = [UIColor whiteColor];
        [_sendCodeBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        [_sendCodeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_sendCodeBtn addTarget:self action:@selector(sendCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendCodeBtn;
}
#pragma  mark - LoginBtn 响应事件
-(void)loginBtnClick{
    [SMSSDK commitVerificationCode:self.verificationCodeTF.text phoneNumber:self.phoneNumberTF.text zone:@"86" result:^(NSError *error){
        if (!error) {
            //第一次跳转到主页，是新用户
            FTMainViewController *mainVC = [[FTMainViewController alloc]init];
            [self.navigationController pushViewController:mainVC animated:YES];
        }
    
    
    }];
    
}
#pragma  mark - SendCodeBtn 响应事件
-(void)sendCodeBtnClick{
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneNumberTF.text zone:@"86" customIdentifier:nil result:^(NSError *error){
        if (!error) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"11" message:@"11" delegate:self cancelButtonTitle:@"11" otherButtonTitles:@"11", nil];
        }else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"输入的手机号有误" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];

        }
    }];
//    [SMSSDK getVerificationCodeBySMSWithPhone:self.phoneNumberTF.text zone:@"86" result:^(NSError *error){
//        if (!error) {
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"成功" message:@"恭喜，注册成功" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//            [alert show];
//        }else{
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"codesendertitel", nil) message:[NSString stringWithFormat:@"状态码:%zi,错误描述：%@",error.errorCode,error.errorDescription]delegate:self cancelButtonTitle:NSLocalizedString(@"确定", nil) otherButtonTitles:nil, nil];
//            [alert show];
//        }
//    
//    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
