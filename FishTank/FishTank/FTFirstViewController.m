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
//导入AFNetWorking框架
#import "AFNetworking.h"
//导入本文框振动
#import "AFViewShaker.h"
//导入格式验证,这个textField的是重新定义的，直接用UITextField 创建实例调用相应方法即可
#import "UITextField+Validator.h"

#define LINE_WIDTH UIScreenWidth*0.724
#define LINE_HEIGHT UIScreenHeight*0.065
//偏移量
#define MOVEDOWN_LENGTH UIScreenHeight*0.08
//textField的宽 和 高
#define TEXTFIELD_WIDTH UIScreenWidth*0.5
#define TEXTFIELD_HEIGHT UIScreenHeight*0.05
//图标距左边界的距离
#define IMAGE_LEFT UIScreenWidth*0.158
@interface FTFirstViewController ()

@property(nonatomic,strong) UIImageView *backgroundIV;

@property(nonatomic,strong) UIImageView *userIV;
@property(nonatomic,strong) UIImageView *keyIV;

@property(nonatomic,strong) UITextField *userNameTF;
@property(nonatomic,strong) UITextField *passwordTF;

@property(nonatomic,strong) UIButton *forgetPasswordBtn;
@property(nonatomic,strong) UIButton *registerBtn;
@property(nonatomic,strong) UIButton *loginBtn;
//设置属性，判断用户登录状态
@property(nonatomic,assign) BOOL firstLogin;
//创建字符串 接收来自数据库的数据
@property(nonatomic,strong) NSString *userStr;
@property(nonatomic,strong) NSString *passwordStr;
@end

@implementation FTFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面控件
    [self loadControl];
    //隐藏导航栏 增加界面美观
    [self.navigationController setNavigationBarHidden:YES];
    
    
   }
#pragma mark - loadControl
-(void)loadControl{
    [self.view addSubview:self.backgroundIV];
    
    
    [self.backgroundIV addSubview:self.userNameTF];
    [self.backgroundIV addSubview:self.passwordTF];
    
    [self.backgroundIV addSubview:self.userIV];
    [self.backgroundIV addSubview:self.keyIV];
    
    [self.backgroundIV addSubview:self.forgetPasswordBtn];
    
    [self.backgroundIV addSubview:self.registerBtn];
    [self.backgroundIV addSubview:self.loginBtn];
    
    [self addLine];
    
}
-(void)updateFirstLogin:(BOOL)firstLogin{
    self.firstLogin = firstLogin;
}
#pragma  mark - 画分割线
-(void)addLine{
    //画分割线1
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(UIScreenWidth*0.11, UIScreenHeight*0.278, LINE_WIDTH, 1)];
    line1.backgroundColor = [UIColor blackColor];
    [self.backgroundIV addSubview:line1];
    //画分割线2
    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(UIScreenWidth*0.278, UIScreenHeight*0.215, 1, LINE_HEIGHT)];
    line2.backgroundColor = [UIColor blackColor];
    [self.backgroundIV addSubview:line2];
    //画分割线3
    UIView *line3 = [[UIView alloc]initWithFrame:CGRectMake(UIScreenWidth*0.11, UIScreenHeight*0.358, LINE_WIDTH, 1)];
    line3.backgroundColor = [UIColor blackColor];
    [self.backgroundIV addSubview:line3];
    //画分割线4
    UIView *line4 = [[UIView alloc]initWithFrame:CGRectMake(UIScreenWidth*0.278, UIScreenHeight*0.295, 1, LINE_HEIGHT)];
    line4.backgroundColor = [UIColor blackColor];
    [self.backgroundIV addSubview:line4];



}
#pragma mark - Image getter
//设置背景图
-(UIImageView *)backgroundIV{
    if (!_backgroundIV) {
        _backgroundIV = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _backgroundIV.userInteractionEnabled = YES;
        _backgroundIV.image = [UIImage imageNamed:@"鱼缸－背景"];
        //点击背景图，收起键盘
        UITapGestureRecognizer *clickTGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backgroundClick)];
        [_backgroundIV addGestureRecognizer:clickTGR];
    }
    return _backgroundIV;
}
//背景事件，目的为了隐藏键盘
-(void)backgroundClick{
    [self.userNameTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
}
#pragma  mark - 图标 getter
-(UIImageView *)userIV{
    //加上用户图标
    _userIV = [[UIImageView alloc]initWithFrame:CGRectMake(IMAGE_LEFT, UIScreenHeight*0.14+MOVEDOWN_LENGTH, _userNameTF.frame.size.height*0.8, _userNameTF.frame.size.height)];
    _userIV.image = [UIImage imageNamed:@"鱼缸－注册人"];
    return _userIV;
}
-(UIImageView *)keyIV{
    //加上钥匙图标图标
    _keyIV = [[UIImageView alloc]initWithFrame:CGRectMake(IMAGE_LEFT, self.userIV.frame.origin.y+MOVEDOWN_LENGTH, _passwordTF.frame.size.height*0.8, _passwordTF.frame.size.height)];
    _keyIV.image = [UIImage imageNamed:@"鱼缸－登录锁"];
    return _keyIV;
}
#pragma  mark - TextFile getter
-(UITextField *)userNameTF{
    if(!_userNameTF){
        
        _userNameTF = [[UITextField alloc]initWithFrame:CGRectMake(UIScreenWidth*0.32, UIScreenHeight*0.14+MOVEDOWN_LENGTH,TEXTFIELD_WIDTH, TEXTFIELD_HEIGHT)];
        
        [_userNameTF setFont:FONT_19];
        _userNameTF.clearButtonMode = UITextFieldViewModeAlways;
        _userNameTF.placeholder = @"请输入电话号";
        _userNameTF.keyboardType = UIKeyboardTypeNumberPad;
        //设置键盘上的返回键
        _userNameTF.returnKeyType = UIReturnKeyNext;
        //添加编辑结束时的响应方法
        [_userNameTF addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingDidEnd];
    }
    return _userNameTF;
}
-(UITextField *)passwordTF{
    if(!_passwordTF){
        _passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(UIScreenWidth*0.32, self.userNameTF.frame.origin.y+MOVEDOWN_LENGTH, TEXTFIELD_WIDTH, TEXTFIELD_HEIGHT)];
        [_passwordTF setFont:FONT_19];
        //水印
        _passwordTF.placeholder = @"请输入密码";
        //输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
        _passwordTF.clearButtonMode = UITextFieldViewModeAlways;
        //输入的内容是密文
        _passwordTF.secureTextEntry = YES;
        //添加编辑结束时的响应方法
        [_passwordTF addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingDidEnd];
        
    }
    return  _passwordTF;
}

#pragma mark -  UITextFile 的响应方法
-(void)textFieldChange:(UITextField *)textField{
    //创建振动实例对象
    AFViewShaker *afVC = [[AFViewShaker alloc]initWithView:textField];
    if ([textField isNotEmpty]) {
        [afVC shake];
    }else{
        if (textField == self.userNameTF) {
            //判断用户框输入的格式是否正确
            if (![textField validateUserName]) {
                [afVC shake];
            }
        }else{
            //判断密码框输入的格式 是否正确
            if (![textField validatePassWord]) {
                [afVC shake];
            }
        }
    }
}
#pragma  mark - loginBtn & registerBtn & forgetPassword getter方法
-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(UIScreenWidth*0.2, UIScreenHeight*0.443, UIScreenWidth*0.567, UIScreenHeight*0.043)];
        //设置圆角半径不会被遮挡
        _loginBtn.layer.masksToBounds = YES;
        [_loginBtn.layer setCornerRadius:10];
        [_loginBtn.layer setBorderWidth:2];
        //设置边界按钮的颜色
        CGColorSpaceRef colorRef = CGColorSpaceCreateDeviceRGB();
        CGColorRef color = CGColorCreate(colorRef, (CGFloat []){0.37,0.5,0.37,1});
        [_loginBtn.layer setBorderColor:color];
        
        [_loginBtn setTitle:@"登          录" forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = FONT_19;
        [_loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}
-(UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(UIScreenWidth*0.11, UIScreenHeight*0.38, UIScreenWidth*0.13,UIScreenHeight*0.025)];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        //文本左对齐
        _registerBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        _registerBtn.titleLabel.font = FONT_17;
        [_registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return  _registerBtn;
}

-(UIButton *)forgetPasswordBtn{
    if (!_forgetPasswordBtn) {
        _forgetPasswordBtn = [[UIButton alloc]initWithFrame:CGRectMake(UIScreenWidth*0.61, UIScreenHeight*0.38, UIScreenWidth*0.25, UIScreenHeight*0.025)];
        [_forgetPasswordBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
        _forgetPasswordBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        _forgetPasswordBtn.titleLabel.font = FONT_17;
        [_forgetPasswordBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_forgetPasswordBtn addTarget:self action:@selector(forgetPasswordBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _forgetPasswordBtn;
}
#pragma mark - loginBtn 响应方法
-(void)loginBtnClick{
    //调用验证方法
    [self checkUser];
    //用户名和手机验证成功后，跳转主页
    //FTMainViewController *mainVC = [[FTMainViewController alloc]init];
    //[self.navigationController pushViewController:mainVC animated:YES];
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
#pragma  mark - 网络请求 验证手机和密码的方法
-(void)checkUser{
    //创建网络管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //初始化返回序列
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    //使用字典保存需要上传网络的数据
    NSDictionary *paramDict = @{@"user_phone":self.userNameTF.text,@"user_psw":self.passwordTF.text};
    //调用Post方法上传数据
    [manager POST:@"http://127.0.0.1/FIshTank/Home/Index/login" parameters:paramDict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //先使用data 类型接收返回的数据
        NSData *data = [[NSData alloc]initWithData:responseObject];
        //再用原生态的json进行解析，并用字典保存
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSString *str = [dic objectForKey:@"state"];
        NSLog(@"%@",dic);
        //验证
        if(![str isEqualToString:@"Failure"]){
            //用户名和手机验证成功后，跳转主页
            FTMainViewController *mainVC = [[FTMainViewController alloc]init];
            //属性传值，确定登录状态
            mainVC.firstLoad = self.firstLogin;
            [self.navigationController pushViewController:mainVC animated:YES];
        }else{
            [self alertMsg:@"手机号或密码错误"];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self alertMsg:@"网络错误"];
        NSLog(@"%@",error);
    }];
}
#pragma  mark - 提示方法
-(void)alertMsg:(NSString *)message{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:    UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *actin){
        [self.userNameTF becomeFirstResponder];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
