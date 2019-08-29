
//
//  RenSongVC.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/23.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "RenSongVC.h"
#import "RenSongAlertView.h"
#import "ETCustomTextField.h"
#import "ETCustomLabel.h"
#import "MBProgressHUD+Add.h"

@interface RenSongVC ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet ETCustomTextField *rensongNameTextField;
@property (weak, nonatomic) IBOutlet ETCustomTextField *parterTextField;
@property (weak, nonatomic) IBOutlet UITextField *countTextField;
@property (weak, nonatomic) IBOutlet ETCustomLabel *rensongNameLabel;
@property (weak, nonatomic) IBOutlet ETCustomLabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIButton *savePictureBtn;

@end

@implementation RenSongVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self hideNaVigationViewRightItem];
    self.rensongNameTextField.attributedText =  [self getAttributedStr:_rensongNameTextField.text];
    self.parterTextField.attributedText = [self getAttributedStr:_parterTextField.text];
    //输入长度限制
    self.rensongNameTextField.textFieldType = UserName;
    self.parterTextField.textFieldType = UserName;

}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    textField.attributedText = [self getAttributedStr:textField.text];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    textField.attributedText = [self getAttributedStr:textField.text];
    if ([textField isEqual:self.rensongNameTextField]) {
        self.rensongNameLabel.text = [NSString stringWithFormat:@"怂人:%@", textField.text];
    }
}
//设置输入框文字间隔
- (NSMutableAttributedString *)getAttributedStr:(NSString *)originStr{
   return [[NSMutableAttributedString alloc] initWithString:originStr attributes:@{NSKernAttributeName:@(2)}];
}
#pragma mark - 保存截图
- (IBAction)savePicture:(id)sender {
    __weak __typeof(self)weakSelf = self;
    [RenSongAlertView showAndConformBlcok:^{
        NSLog(@"保存图片");
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf hideNavigationView];
        strongSelf.savePictureBtn.hidden = YES;
        [strongSelf loadImageFinished:[strongSelf captureImageFromView:strongSelf.view]];
        [strongSelf showNaVigationView];
        strongSelf.savePictureBtn.hidden = NO;
    }];
   
}
- (void)loadImageFinished:(UIImage *)image{
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        NSLog(@"保存图片失败");
        [MBProgressHUD showError:@"保存失败" toView:nil];

    }else{
        NSLog(@"截图已经保存到相册")
        [MBProgressHUD showSuccess:@"截图已经保存到相册" toView:nil];
    }
}
//截图功能
- (UIImage *)captureImageFromView:(UIView *)view{
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    CGRect rect = [keyWindow bounds];
    UIGraphicsBeginImageContextWithOptions(rect.size,YES, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapshotImage;
}


@end
