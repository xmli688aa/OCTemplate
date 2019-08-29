//
//  ZhuanPanResultView.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/27.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ZhuanPanResultView.h"


@interface ZhuanPanResultView ()


@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ZhuanPanResultView
+ (void)showResultViewWithContent:(NSString *)content{
    
    ZhuanPanResultView *popView = [[NSBundle mainBundle] loadNibNamed:@"ZhuanPanResultView" owner:nil options:nil].firstObject;
    popView.frame = [UIScreen mainScreen].bounds;
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:popView];
    popView.resultLabel.text = content;

}
- (IBAction)close:(id)sender {
    [self removeFromSuperview];
}


@end
