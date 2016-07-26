//
//  FTFindPasswordViewController.m
//  FishTank
//
//  Created by Student07 on 16/7/15.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTFindPasswordViewController.h"
#import "FTMainViewController.h"
#import "FTFirstViewController.h"
/*
 导入短信验证码接口
 */
#import <SMS_SDK/SMSSDK.h>
#import <SMS_SDK/Extend/SMSSDK+DeprecatedMethods.h>
#import <SMS_SDK/Extend/SMSSDK+ExtexdMethods.h>
//导入振动文件
#import "AFViewShaker.h"
//导入格式验证,这个textField的是重新定义的，直接用UITextField 创建实例调用相应方法即可
#import "UITextField+Validator.h"
//导入AFNetWorking框架
#import "AFNetWorking.h"

//常量定义
#define LEFT_LENGTH UIScreenWidth*0.14
#define LINE_WIDTH UIScreenWidth*0.77
#define LINE_HEIGHT UIScreenHeight*0.065
#define MOVEDOWN_LENGTH UIScreenHeight*0.08

#define TEXTFIELD_HEIGHT UIScreenHeight*0.05
#define TEXTFIELD_WIDTH UIScreenWidth*0.52
@interface FTFindPasswordViewController ()
@property(nonatomic,strong) UIImageView *backToLoginIV;
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
    //加载页面控件
    [self loadCotrol];
    
    
    
}
#pragma  mark - loadControl
-(void)loadCotrol{
    [self.view addSubview:self.backgroundIV];
    [self loadImageView];
    [self loadLine];
    [self.backgroundIV addSubview:self.backToLoginIV];
    
    
    
    [self.backgroundIV addSubview:self.phoneNumberTF];
    [self.backgroundIV addSubview:self.verificationCodeTF];
    [self.backgroundIV addSubview:self.passwordTF];
    [self.backgroundIV addSubview:self.confirmPasswordTF];
    
    [self.backgroundIV addSubview:self.sendCodeBtn];
    [self.backgroundIV addSubview:self.loginBtn];
}
#pragma mark - 加载图标 鱼缸－注册人
-(void)loadImageView{
    [self addImageView:UIScreenWidth*0.1855 Y:UIScreenHeight*0.165 width:TEXTFIELD_HEIGHT*0.85 heigth:TEXTFIELD_HEIGHT image:@"鱼缸－注册人"];
    [self addImageView:UIScreenWidth*0.1855 Y:UIScreenHeight*0.165+MOVEDOWN_LENGTH width:TEXTFIELD_HEIGHT*0.85 heigth:TEXTFIELD_HEIGHT image:@"鱼缸－注册验证码"];
    [self addImageView:UIScreenWidth*0.1855 Y:UIScreenHeight*0.165+2*MOVEDOWN_LENGTH width:TEXTFIELD_HEIGHT*0.85 heigth:TEXTFIELD_HEIGHT image:@"鱼缸－注册锁1"];
    [self addImageView:UIScreenWidth*0.1855 Y:UIScreenHeight*0.165+3*MOVEDOWN_LENGTH width:TEXTFIELD_HEIGHT*0.85 heigth:TEXTFIELD_HEIGHT image:@"鱼缸－注册锁2"];
    
}
-(void)addImageView:(CGFloat ) x Y:(CGFloat) y width:(CGFloat)width heigth:(CGFloat)height image:(NSString *)imageName{
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, width, height)];
    [image setImage:[UIImage imageNamed:imageName]];
    [self.backgroundIV addSubview:image];
}
#pragma mark - 画分割线
-(void)loadLine{
    [self drawLine:LEFT_LENGTH Y:UIScreenHeight*0.146 width:LINE_WIDTH height:1];
    [self drawLine:UIScreenWidth*0.28 Y:UIScreenHeight*0.153 width:1 height:LINE_HEIGHT];
    [self drawLine:LEFT_LENGTH Y:UIScreenHeight*0.218 width:LINE_WIDTH height:1];
    
    [self drawLine:UIScreenWidth*0.28 Y:UIScreenHeight*0.153+MOVEDOWN_LENGTH width:1 height:LINE_HEIGHT];
    [self drawLine:LEFT_LENGTH Y:UIScreenHeight*0.218+MOVEDOWN_LENGTH width:LINE_WIDTH height:1];
    
    [self drawLine:UIScreenWidth*0.28 Y:UIScreenHeight*0.153+2*MOVEDOWN_LENGTH width:1 height:LINE_HEIGHT];
    [self drawLine:LEFT_LENGTH Y:UIScreenHeight*0.218+2*MOVEDOWN_LENGTH width:LINE_WIDTH height:1];
    
    [self drawLine:UIScreenWidth*0.28 Y:UIScreenHeight*0.153+3*MOVEDOWN_LENGTH width:1 height:LINE_HEIGHT];
    [self drawLine:LEFT_LENGTH Y:UIScreenHeight*0.218+3*MOVEDOWN_LENGTH width:LINE_WIDTH height:1];
    
}
-(void)drawLine:(CGFloat ) X Y:(CGFloat )Y width:(CGFloat )width height:(CGFloat )height{
    //定义一个view，画线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(X, Y, width, height)];
    line.backgroundColor = [UIColor blackColor];
    [self.backgroundIV addSubview:line];
}
#pragma mark - backToLoginIV getter
-(UIImageView *)backToLoginIV{
    _backToLoginIV = [[UIImageView alloc]initWithFrame:CGRectMake(UIScreenWidth*0.185, UIScreenHeight*0.104, UIScreenWidth*0.065, UIScreenWidth*0.065)];
    [_backToLoginIV setImage:[UIImage imageNamed:@"鱼缸－返回2"]];
    _backToLoginIV.userInteractionEnabled = YES;
    UITapGestureRecognizer *clickTGP = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backToLoginIVClick)];
    [_backToLoginIV addGestureRecognizer:clickTGP];
    return _backToLoginIV;
}
-(void)backToLoginIVClick{
    //跳转到登录界面
    FTFirstViewController *firVC = [[FTFirstViewController alloc]init];
    [self.navigationController pushViewController:firVC animated:YES];
}
#pragma mark - BGImageView getter
//设置背景图
-(UIImageView *)backgroundIV{
    if (!_backgroundIV) {
        _backgroundIV = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _backgroundIV.userInteractionEnabled = YES;
        _backgroundIV.image = [UIImage imageNamed:@"鱼缸－背景"];
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
        _phoneNumberTF = [[UITextField alloc]initWithFrame:CGRectMake(UIScreenWidth*0.3, UIScreenHeight*0.17, TEXTFIELD_WIDTH*0.84, TEXTFIELD_HEIGHT)];
        _phoneNumberTF.placeholder = @"手机号";
        //把键盘设置为数字键盘
        _phoneNumberTF.keyboardType = UIKeyboardTypeNumberPad;
        [_phoneNumberTF setFont:FONT_18];
        _phoneNumberTF.clearButtonMode = UITextFieldViewModeAlways;
        //给手机号码输入框，设置验证方法
        [_phoneNumberTF addTarget:self action:@selector(numberTFChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _phoneNumberTF;
}
-(UITextField *)verificationCodeTF{
    if (!_verificationCodeTF) {
        _verificationCodeTF = [[UITextField alloc]initWithFrame:CGRectMake(_phoneNumberTF.frame.origin.x, _phoneNumberTF.frame.origin.y+MOVEDOWN_LENGTH, TEXTFIELD_WIDTH, TEXTFIELD_HEIGHT)];
        _verificationCodeTF.placeholder = @"验证码";
        //把输入键盘 设置为 数字键盘
        _verificationCodeTF.keyboardType = UIKeyboardTypeNumberPad;
        _verificationCodeTF.clearButtonMode = UITextFieldViewModeAlways;
        [_verificationCodeTF setFont:FONT_18];
        [_verificationCodeTF addTarget:self action:@selector(numberTFChanged:) forControlEvents:UIControlEventEditingDidEnd];
    }
    return _verificationCodeTF;
}

-(UITextField *)passwordTF{
    if (!_passwordTF) {
        _passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(_verificationCodeTF.frame.origin.x, _verificationCodeTF.frame.origin.y+MOVEDOWN_LENGTH, TEXTFIELD_WIDTH, TEXTFIELD_HEIGHT)];
        _passwordTF.placeholder = @"输入密码";
        _passwordTF.secureTextEntry = YES;
        _passwordTF.clearButtonMode = UITextFieldViewModeAlways;
        [_passwordTF setFont:FONT_18];
        //给密码框添加 长度限制方法
        [_passwordTF addTarget:self action:@selector(passwordTFChanged:) forControlEvents:UIControlEventEditingDidEnd];
    }
    return _passwordTF;
}

-(UITextField *)confirmPasswordTF{
    if (!_confirmPasswordTF) {
        _confirmPasswordTF = [[UITextField alloc]initWithFrame:CGRectMake(_passwordTF.frame.origin.x, _passwordTF.frame.origin.y+MOVEDOWN_LENGTH, TEXTFIELD_WIDTH, TEXTFIELD_HEIGHT)];
        _confirmPasswordTF.placeholder =@"确认密码";
        [_confirmPasswordTF setFont:FONT_18];
        _confirmPasswordTF.secureTextEntry = YES;
        _confirmPasswordTF.clearButtonMode = UITextFieldViewModeAlways;
        //给确认密码框添加，检验两次输入的密码是否一致的 方法
        [_confirmPasswordTF addTarget:self action:@selector(passwordTFChanged:) forControlEvents:UIControlEventEditingDidEnd];
    }
    
    return _confirmPasswordTF;
}
#pragma  mark - _phoneNumberTF & verificationCodeTF的响应方法
-(void)numberTFChanged:(UITextField *)textField{
    //创建振动实例对象
    AFViewShaker *afVC = [[AFViewShaker alloc]initWithView:textField];
    if (textField == self.phoneNumberTF) {
        //检验输入的手机是否符合格式，如果不符合，则不能发送验证码
        if (![textField validateUserName]) {
            self.sendCodeBtn.userInteractionEnabled = NO;
        }else{
            self.sendCodeBtn.userInteractionEnabled = YES;
        }
    } else {
        if([textField isNotEmpty]){
            [afVC shake];
        }
    }
}

#pragma  mark - PasswordTF&confirmPasswordTF 响应方法
-(void)passwordTFChanged:(UITextField *)textField{
    //创建振动实例对象
    AFViewShaker *afVC = [[AFViewShaker alloc]initWithView:textField];
    if ([textField isNotEmpty]) {
        [afVC shake];
    }else{
        //先判断输入密码的格式，不能少于6位
        if (![textField validatePassWord]) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码格式不正确！不能少于6位数!" preferredStyle:    UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *actin){
                //如果格式不正确，把确认密码框的光标移到密码框
                if (textField == self.confirmPasswordTF) {
                    [self.passwordTF becomeFirstResponder];
                }
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
                
            }]];
            [self presentViewController:alert animated:YES completion:nil];
            
        }else{
            if(self.confirmPasswordTF==textField){
                //判断两次输入的密码是否一致
                if (self.confirmPasswordTF.text!=self.passwordTF.text) {
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"两次输入的密码不 一致！" preferredStyle:    UIAlertControllerStyleAlert];
                    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *actin){
                        //如果两次输入的密码不一致，则不能登录
                        self.loginBtn.userInteractionEnabled = NO;
                    }]];
                    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
                        self.loginBtn.userInteractionEnabled = NO;
                    }]];
                    [self presentViewController:alert animated:YES completion:nil];
                }else{
                    //两次密码输入的一致，则可登录
                    self.loginBtn.userInteractionEnabled = YES;
                }
            }
        }
        
    }
}
#pragma  mark - registerBtn getter
-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(UIScreenWidth*0.22, _confirmPasswordTF.frame.origin.y+UIScreenHeight*0.142, UIScreenWidth*0.562, UIScreenHeight*0.0433)];
        [_loginBtn setTitle:@"登          录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = FONT_19;
        _loginBtn.userInteractionEnabled = NO;
        //设置圆角半径不会被遮挡
        _loginBtn.layer.masksToBounds = YES;
        [_loginBtn.layer setCornerRadius:10];
        [_loginBtn.layer setBorderWidth:2];
        //设置边界按钮的颜色
        CGColorSpaceRef colorRef = CGColorSpaceCreateDeviceRGB();
        CGColorRef color = CGColorCreate(colorRef, (CGFloat []){0.37,0.5,0.37,1});
        [_loginBtn.layer setBorderColor:color];
        
        [_loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return  _loginBtn;
}
#pragma mark - sendCodeBtn getter
-(UIButton *)sendCodeBtn{
    if (!_sendCodeBtn) {
        _sendCodeBtn =[[UIButton alloc]init];
        _sendCodeBtn.frame = CGRectMake(UIScreenWidth*0.75, UIScreenHeight*0.165, UIScreenWidth*0.25, TEXTFIELD_HEIGHT);
        _sendCodeBtn.userInteractionEnabled = NO;
        _sendCodeBtn.titleLabel.font = FONT_17;
        [_sendCodeBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        [_sendCodeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_sendCodeBtn addTarget:self action:@selector(sendCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendCodeBtn;
}
#pragma  mark - LoginBtn 响应事件
-(void)loginBtnClick{
    //验证手机验证码
    [SMSSDK commitVerificationCode:self.verificationCodeTF.text phoneNumber:self.phoneNumberTF.text zone:@"86" result:^(NSError *error){
        if (!error) {
            //验证码验证成功后，往数据库插入电话和密码，并跳转注册页
            [self insertUserTable];
        }else{
            //输出验证码的错误信息
            NSLog(@"%@",error);
        }
    }];
    
}
#pragma  mark - SendCodeBtn 响应事件
-(void)sendCodeBtnClick{
    
    [self sendCode];
    
    __block int timeout=60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self.sendCodeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                self.sendCodeBtn.userInteractionEnabled = YES;
                self.sendCodeBtn.backgroundColor = [UIColor redColor];
                
            });
        }else{
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //NSLog(@"____%@",strTime);
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [self.sendCodeBtn setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                [UIView commitAnimations];
                self.sendCodeBtn.userInteractionEnabled = NO;
                self.sendCodeBtn.backgroundColor = [UIColor grayColor];
            });
            timeout--;
            
        }
    });
    dispatch_resume(_timer);
    
}
-(void)sendCode{
    //发送验证码
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneNumberTF.text zone:@"86" customIdentifier:nil result:^(NSError *error){
        if (!error) {
            [self alertMsg:@"发送验证码成功！"];
        }else{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"发送失败，请稍后重试！\n详情：状态码:%ld,错误描述:%@",(long)error.code,error.localizedDescription] preferredStyle:    UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *actin){
                
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
                
            }]];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
    
}
#pragma  mark - 网络请求 验证手机和密码的方法
-(void)insertUserTable{
    //创建网络管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //初始化返回序列
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    //使用字典保存需要上传网络的数据
    NSDictionary *paramDict = @{@"user_phone":self.phoneNumberTF.text,@"user_psw":self.passwordTF.text};
    //调用Post方法上传数据
    [manager POST:@"http://127.0.0.1/FIshTank/Home/Index/update" parameters:paramDict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //先使用data 类型接收返回的数据
        NSData *data = [[NSData alloc]initWithData:responseObject];
        //再用原生态的json进行解析，并用字典保存
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dic);
        //如果数据库返回的状态不是Failure 表明注册成功
        if(![[dic objectForKey:@"state"] isEqualToString:@"Failure"]){
            //提示并 跳转到 主页
            [self alertAndDumpToMain];
        
        }else{
            [self alertMsg:@"更改密码失败！"];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self alertMsg:@"网络错误！"];
        NSLog(@"%@",error);
    }];
}
#pragma  mark - 提示方法
-(void)alertMsg:(NSString *)message{
    //提示信息
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:    UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *actin){
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)alertAndDumpToMain{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码更新成功！" preferredStyle:    UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *actin){
        //点击确定，跳转到主页，是老用户
        FTMainViewController *mainVC = [[FTMainViewController alloc]init];
        [self.navigationController pushViewController:mainVC animated:YES];

    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
