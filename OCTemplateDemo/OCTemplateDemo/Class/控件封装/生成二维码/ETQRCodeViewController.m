
//
//  ETQRCodeViewController.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/11/25.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETQRCodeViewController.h"
#import "SGQRCode.h"
@interface ETQRCodeViewController (){
    SGQRCodeObtain *obtain;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ETQRCodeViewController

//SGQRCode 集成
//1、CocoaPods 导入 pod 'SGQRCode', '~> 3.0.1'
//2、下载、拖拽 “SGQRCode” 文件夹到工程中

- (void)viewDidLoad {
    [super viewDidLoad];
    obtain = [SGQRCodeObtain QRCodeObtain];

}


- (IBAction)normalQRCode:(id)sender {
    /// 常规二维码
      _imageView.image = [SGQRCodeObtain generateQRCodeWithData:@"https://github.com/kingsic" size:_imageView.width];
}
    

- (IBAction)logoQRCode:(id)sender {
    /// 带 logo 的二维码
    _imageView.image = [SGQRCodeObtain generateQRCodeWithData:@"https://github.com/kingsic" size:_imageView.width logoImage:[UIImage imageNamed:@"loading_logo"] ratio:0.3];

    
}
- (IBAction)scanQRCode:(id)sender {
    
    __weak typeof(self) weakSelf = self;

      /// 创建二维码扫描
      SGQRCodeObtainConfigure *configure = [SGQRCodeObtainConfigure QRCodeObtainConfigure];
      [obtain establishQRCodeObtainScanWithController:self configure:configure];
      // 二维码扫描回调方法
      [obtain setBlockWithQRCodeObtainScanResult:^(SGQRCodeObtain *obtain, NSString *result) {
          NSLog(@"二维码扫描回调%@",result);

      }];
      // 二维码扫描开启方法: 需手动开启
      [obtain startRunningWithBefore:^{
          // 在此可添加 HUD
      } completion:^{
          // 在此可移除 HUD
      }];
      // 根据外界光线强弱值判断是否自动开启手电筒
      [obtain setBlockWithQRCodeObtainScanBrightness:^(SGQRCodeObtain *obtain, CGFloat brightness) {
          
      }];
      
}

- (IBAction)readFromFhotoLibrary:(id)sender {
  __weak typeof(self) weakSelf = self;
    
    [obtain establishAuthorizationQRCodeObtainAlbumWithController:self];
    if (obtain.isPHAuthorization == YES) {
    }
    [obtain setBlockWithQRCodeObtainAlbumDidCancelImagePickerController:^(SGQRCodeObtain *obtain) {
    }];
    [obtain setBlockWithQRCodeObtainAlbumResult:^(SGQRCodeObtain *obtain, NSString *result) {
        NSLog(@"********%@",result);
        NSLog(@"二维码相册识别回调%@",result);

    }];
}


@end
