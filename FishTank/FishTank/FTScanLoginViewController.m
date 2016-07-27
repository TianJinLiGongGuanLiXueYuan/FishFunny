//
//  FTScanLoginViewController.m
//  FishTank
//
//  Created by Student03 on 16/7/23.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTScanLoginViewController.h"
#import <AVFoundation/AVFoundation.h>

static const char *kScanQRCodeQueueName = "ScanQRCodeQueue";

@interface FTScanLoginViewController ()<AVCaptureMetadataOutputObjectsDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong) UIView *scanFrameView;
@property(nonatomic,strong) UIButton *button;
@property(nonatomic,strong) UIButton *lightButton;

@property (nonatomic) AVCaptureSession *captureSession;
@property (nonatomic) AVCaptureVideoPreviewLayer *videoPreviewLayer;
@property (nonatomic) BOOL lastResut;
@end

@implementation FTScanLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载控件
    [self loadControl];
    
    self.title=@"扫码添加鱼类";
    //调色
    self.view.backgroundColor=UIColorFromRGB(0xede9e9);
    
    self.lastResut = YES;
}
-(void)loadControl{
    [self.view addSubview:self.button];
    [self.view addSubview:self.lightButton];
    [self.view addSubview:self.scanFrameView];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(openPics)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}
#pragma mark - 添加照片的响应方法
// 打开相册
- (void)openPics {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    [self  presentViewController:imagePicker animated:YES completion:^{
    }];
    
    
}


// 选中照片

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSLog(@"%@", info);
    UIImageView  *imageView = (UIImageView *)[self.view viewWithTag:101];
    // UIImagePickerControllerOriginalImage 原始图片
    // UIImagePickerControllerEditedImage 编辑后图片
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    imageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}



// 取消相册
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

-(UIButton *)button{
    if (!_button) {
        _button = [[UIButton alloc]initWithFrame:CGRectMake(UIScreenWidth*0.35, UIScreenHeight*0.75, UIScreenWidth*0.3,UIScreenHeight*0.08 )];
        [_button setTitle:@"开始" forState:UIControlStateNormal];
        _button.backgroundColor = [UIColor grayColor];
        [_button addTarget:self action:@selector(startScanner:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}
-(void)startScanner:(UIButton *)button{
    if ([button.titleLabel.text isEqualToString:@"开始"]) {
        [self startReading];
    } else {
        [self stopReading];
    }
}
-(UIButton *)lightButton{
    if (!_lightButton) {
        _lightButton = [[UIButton alloc]initWithFrame:CGRectMake(UIScreenWidth*0.35, UIScreenHeight*0.16, UIScreenWidth*0.3, UIScreenHeight*0.08)];
        [_lightButton setTitle:@"打开照明" forState:UIControlStateNormal];
        _lightButton.backgroundColor = [UIColor grayColor];
        [_lightButton addTarget:self action:@selector(openSystemLight:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _lightButton;
}
-(void)openSystemLight:(UIButton *)button{
    if ([button.titleLabel.text isEqualToString:@"打开照明"]) {
        [self systemLightSwitch:YES];
    } else {
        [self systemLightSwitch:NO];
    }
}
-(UIView *)scanFrameView{
    if (!_scanFrameView) {
        _scanFrameView = [[UIView alloc]initWithFrame:CGRectMake(UIScreenWidth*0.15, UIScreenHeight*0.28, UIScreenWidth*0.7, UIScreenHeight*0.4)];
        _scanFrameView.backgroundColor = [UIColor greenColor];
    }
    return _scanFrameView;
}

- (void)dealloc
{
    [self stopReading];
}


- (BOOL)startReading
{
    [self.button setTitle:@"停止" forState:UIControlStateNormal];
    // 获取 AVCaptureDevice 实例
    NSError * error;
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    // 初始化输入流
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    if (!input) {
        NSLog(@"%@", [error localizedDescription]);
        return NO;
    }
    // 创建会话
    _captureSession = [[AVCaptureSession alloc] init];
    // 添加输入流
    [_captureSession addInput:input];
    // 初始化输出流
    AVCaptureMetadataOutput *captureMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
    // 添加输出流
    [_captureSession addOutput:captureMetadataOutput];
    
    // 创建dispatch queue.
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create(kScanQRCodeQueueName, NULL);
    [captureMetadataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
    // 设置元数据类型 AVMetadataObjectTypeQRCode
    [captureMetadataOutput setMetadataObjectTypes:[NSArray arrayWithObject:AVMetadataObjectTypeQRCode]];
    
    // 创建输出对象
    _videoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession];
    [_videoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [_videoPreviewLayer setFrame:_scanFrameView.layer.bounds];
    [_scanFrameView.layer addSublayer:_videoPreviewLayer];
    // 开始会话
    [_captureSession startRunning];
    
    return YES;
}

- (void)stopReading
{
    [_button setTitle:@"开始" forState:UIControlStateNormal];
    // 停止会话
    [_captureSession stopRunning];
    _captureSession = nil;
}

- (void)reportScanResult:(NSString *)result
{
    [self stopReading];
    if (!_lastResut) {
        return;
    }
    _lastResut = NO;
    UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"提示" message:@"二维码扫描" preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self.navigationController pushViewController:alert animated:YES];
    // 以及处理了结果，下次扫描
    _lastResut = YES;
}

- (void)systemLightSwitch:(BOOL)open
{
    if (open) {
        [_lightButton setTitle:@"关闭照明" forState:UIControlStateNormal];
    } else {
        [_lightButton setTitle:@"打开照明" forState:UIControlStateNormal];
    }
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]) {
        [device lockForConfiguration:nil];
        if (open) {
            [device setTorchMode:AVCaptureTorchModeOn];
        } else {
            [device setTorchMode:AVCaptureTorchModeOff];
        }
        [device unlockForConfiguration];
    }
}

#pragma AVCaptureMetadataOutputObjectsDelegate

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects
      fromConnection:(AVCaptureConnection *)connection
{
    if (metadataObjects != nil && [metadataObjects count] > 0) {
        AVMetadataMachineReadableCodeObject *metadataObj = [metadataObjects objectAtIndex:0];
        NSString *result;
        if ([[metadataObj type] isEqualToString:AVMetadataObjectTypeQRCode]) {
            result = metadataObj.stringValue;
        } else {
            NSLog(@"不是二维码");
        }
        [self performSelectorOnMainThread:@selector(reportScanResult:) withObject:result waitUntilDone:NO];
    }
}

@end
