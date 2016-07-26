//
//  FTQRCodeViewController.m
//  FishTank
//
//  Created by Student07 on 16/7/18.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTQRCodeViewController.h"
/*
 导入二维码框架
 */
#import <AVFoundation/AVFoundation.h>

@interface FTQRCodeViewController ()<AVCaptureMetadataOutputObjectsDelegate>

@end

@implementation FTQRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"二维码";
//    AVCaptureSession *session = [[AVCaptureSession alloc] init];
//    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
//    NSError *error = nil;
//    
//    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device
//                                                                        error:&error];
//    if (input) {
//        [session addInput:input];
//    } else {
//        NSLog(@"Error: %@", error);
//    }
//    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
//    //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
//    [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code]];
//    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
//    [session addOutput:output];
//    [session startRunning];
}
#pragma mark - AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput
didOutputMetadataObjects:(NSArray *)metadataObjects
       fromConnection:(AVCaptureConnection *)connection
{
    NSString *QRCode = nil;
    for (AVMetadataObject *metadata in metadataObjects) {
        if ([metadata.type isEqualToString:AVMetadataObjectTypeQRCode]) {
            // This will never happen; nobody has ever scanned a QR code... ever
            QRCode = [(AVMetadataMachineReadableCodeObject *)metadata stringValue];
            break;
        }
    }
    
    NSLog(@"QR Code: %@", QRCode);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
