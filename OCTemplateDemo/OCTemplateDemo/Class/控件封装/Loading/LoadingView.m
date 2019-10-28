//
//  LoadingView.m
//  PublicDemo
//
//  Created by Ethon.Z on 2019/10/23.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "LoadingView.h"

@interface LoadingView ()
@property (weak, nonatomic) IBOutlet UIImageView *cycleBgView;

@end

@implementation LoadingView

- (void)awakeFromNib{
    [super awakeFromNib];
    CABasicAnimation *animation= [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.toValue = [NSNumber numberWithFloat:M_PI*2];
    animation.duration = 1.5;
    animation.repeatCount = MAXFLOAT;
    [_cycleBgView.layer addAnimation:animation forKey:nil];
}


+ (instancetype)showLoadingWithSuperView:(nullable UIView *)superView{
    LoadingView *loadingView = [[NSBundle mainBundle] loadNibNamed:@"LoadingView" owner:nil options:0].firstObject;
    if (superView == nil) {
        superView = [UIApplication sharedApplication].keyWindow;
    }
     for (UIView *subView in superView.subviews) {
         if ([subView isKindOfClass:[LoadingView class]]) {
             return loadingView;
         }
     }
    loadingView.frame = superView.bounds;
    [superView addSubview:loadingView];
    
    return loadingView;
}

+ (void)hideLoadingWithSuperView:(nullable UIView *)superView{
    if (superView == nil) {
        superView = [UIApplication sharedApplication].keyWindow;
    }
    for (UIView *subView in superView.subviews) {
        if ([subView isKindOfClass:[LoadingView class]]) {
            [subView removeFromSuperview];
        }
    }
}

- (void)hide{
    [self removeFromSuperview];
}

@end
