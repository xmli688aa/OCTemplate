//
//  ETWordRollVC.m
//  OCTemplateDemo
//
//  Created by 赵伟志(EX-ZHAOWEIZHI002) on 2021/3/26.
//  Copyright © 2021 zhao. All rights reserved.
//

#import "ETWordRollVC.h"
#import "ETWordRollView.h"

@interface ETWordRollVC ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic, strong) ETWordRollView *wordView;
@property (nonatomic, strong) UIColor *textColor;
@end

@implementation ETWordRollVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.wordView];
    self.wordView.hidden = YES;

}
- (ETWordRollView *)wordView{
    if (_wordView == nil) {
        NSString* text=@"时间知道越是平凡的陪伴 就越长久,哈哈哈哈哈哈哈。时间知道越是平凡的陪伴 就越时间知道越是平凡的陪伴 就越哈";
        _wordView = [[ETWordRollView alloc]initWithFrame:self.view.frame contentText:text textFont:[UIFont boldSystemFontOfSize:40] textColor:[UIColor redColor] ];
        _wordView.backgroundColor = UIColor.whiteColor;
    }
    return _wordView;
}
- (IBAction)redTextBtnClick:(id)sender {
    _textColor = [UIColor redColor];
}

- (IBAction)yellowBtnClick:(id)sender {
    _textColor = [UIColor yellowColor];

}

- (IBAction)blueBtnClick:(id)sender {
    _textColor = [UIColor blueColor];

    
}
- (IBAction)showLedText:(id)sender {
    self.wordView.hidden = NO;
    self.wordView.textColor = _textColor;
    if (self.textField.text.length) {
//        self.wordView.title = self.textField.text;
    }else{
//        self.wordView.title = @"请输入要展示的文字";
    }
  
//    self.wordView.transform = CGAffineTransformMakeRotation((90.0f * M_PI) / 180.0f);
//    self.wordView.width = kScreenHeight;
//    self.wordView.height = kScreenWidth;
//    self.wordView.center = self.view.center;
    [self.wordView startRollAnimation];

//    [self show];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    self.wordView.transform = CGAffineTransformIdentity;

    self.wordView.hidden = YES;
}
- (void)show{
    self.wordView.center = self.view.center;
    /* Begin the animation */
    [UIView beginAnimations:@"clockwiseAnimation" context:NULL];
    /* Make the animation 5 seconds long */
    [UIView setAnimationDuration:5.0f];
    [UIView setAnimationDelegate:self];
    //停止动画时候调用clockwiseRotationStopped方法
    [UIView setAnimationDidStopSelector:@selector(clockwiseRotationStopped:finished:context:)];
    //顺时针旋转90度
    self.wordView.transform = CGAffineTransformMakeRotation((90.0f * M_PI) / 180.0f);
    /* Commit the animation */
    [UIView commitAnimations];
}

- (void)clockwiseRotationStopped:(NSString *)paramAnimationID finished:(NSNumber *)paramFinished context:(void *)paramContext{
    [UIView beginAnimations:@"counterclockwiseAnimation"context:NULL];
    /* 5 seconds long */
    [UIView setAnimationDuration:5.0f];
    /* 回到原始旋转 */
    self.wordView.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
}
@end
