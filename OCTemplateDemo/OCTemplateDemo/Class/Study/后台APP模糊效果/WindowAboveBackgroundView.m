//
//  WindowAboveBackgroundView.m
//  ProjectDemo
//
//  Created by 税鸽飞腾 on 2018/11/12.
//  Copyright © 2018 LWJ. All rights reserved.
//

#import "WindowAboveBackgroundView.h"

@interface WindowAboveBackgroundView ()
@property (strong, nonatomic) UIImageView *shotImageView;

@end


@implementation WindowAboveBackgroundView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor clearColor];
    }    
    return self;
}
- (UIImageView *)shotImageView{
    if (_shotImageView == nil) {
        _shotImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_shotImageView];
    }
    return _shotImageView;
}

- (void)show{
    UIWindow *window =[[[UIApplication sharedApplication]delegate]window];
//    [self changeShotImage];
    [window addSubview:self];
}
- (void)hidden{
    [self removeFromSuperview];
}

- (void)updateShotImage{
    //屏幕截图
    UIImage *screenShotsJPG = [ETToolManager screenShot];
    UIImage *gaussianBlurImage = [ETToolManager coreGaussianBlurImage:screenShotsJPG blurNumber:5];
    self.shotImageView.image = gaussianBlurImage;
}
#pragma mark - 设置磨砂效果
- (void)BlurEffect{
    //屏幕截图
    UIImage *screenShotsJPG = [ETToolManager screenShot];
    UIImage *GaussianBlurImage = [ETToolManager coreGaussianBlurImage:screenShotsJPG blurNumber:5];
    UIImageView *imageView = [[UIImageView alloc]init];
    [self addSubview:imageView];
    imageView.frame = self.frame;
    imageView.image = GaussianBlurImage;
}

@end
