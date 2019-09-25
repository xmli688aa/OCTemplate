
//
//  ETAnimationImagesVC.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/9/24.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETAnimationImagesVC.h"
#import <AVFoundation/AVFoundation.h>

@interface ETAnimationImagesVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
// 播放器
@property (nonatomic ,strong) AVPlayer *player;
@end

@implementation ETAnimationImagesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self stand];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, kNavBarHeight+20, 300, 30)];
    [btn setTitle:@"大招" forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}
- (void)click{
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 1; i <= 87; i++) {
        NSString *imageName = [NSString stringWithFormat:@"dazhao_%d",i];
        UIImage *image = [UIImage imageNamed:imageName];
        [images addObject:image];
    }
    self.imageView.animationImages = images;
    self.imageView.animationRepeatCount = 1;
    self.imageView.animationDuration = 3;
    [self.imageView startAnimating];
}
- (IBAction)stand {
    [self play:@"stand" count:10];

}

- (IBAction)dazhao {
    [self play:@"dazhao" count:87];
   
//    NSMutableArray *images = [NSMutableArray array];
//    for (int i = 1; i <= 87; i++) {
//        NSString *imageName = [NSString stringWithFormat:@"dazhao_%d",i];
//        UIImage *image = [UIImage imageNamed:imageName];
//        [images addObject:image];
//    }
     //关键帧动画核心代码
//    self.imageView.animationImages = images;
//    self.imageView.animationRepeatCount = 1;
//    self.imageView.animationDuration = 3;
//    [self.imageView startAnimating];
}
// 缓存
#pragma mark - 播放帧动画
- (void)play:(NSString *)name count:(int)count
{
    // 创建图片
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 1; i <= count; i++) {
        // 获取图片名字
//        NSString *imageName = [NSString stringWithFormat:@"%@_%d",name,i];
//        UIImage *image = [UIImage imageNamed:imageName];
//        [images addObject:image];
        // 获取图片名字
        NSString *imageName = [NSString stringWithFormat:@"%@_%d",name,i];
        // 获取图片的全路径
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];

        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
//        NSLog(@"%@",image);
        [images addObject:image];
    }
    
    // 设置动画的图片
    self.imageView.animationImages = images;
    
    // 设置动画的次数
    self.imageView.animationRepeatCount = [name isEqualToString:@"stand"] ? 0 : 1;
    
    // 设置显示的图片
    //    self.imageView.image = [UIImage imageNamed:@"stand_1"];
    
    // 设置动画的时间
    self.imageView.animationDuration = count * 0.06;
//    self.imageView.animationDuration = 2;

    // 开启动画
    [self.imageView startAnimating];
    
    if ([name isEqualToString:@"stand"]) return;
    // 大招动画播放完毕后,播放站立的动画
    // self.imageView.animationDuration时间后会自动调用控制器的stand方法
    [self performSelector:@selector(stand) withObject:nil afterDelay:self.imageView.animationDuration];
    
    // 获取软件安装包对象
    NSBundle *bundle = [NSBundle mainBundle];
    // 获取安装包中某一个资源的路径
    NSURL *url =[bundle URLForResource:@"dazhao.mp3" withExtension:nil];
    
    //    [bundle pathForResource:@"dazhao" ofType:@"mp3"];
    
    // 创建播放器
    //    AVPlayer *player = [AVPlayer playerWithURL:url];
    self.player = [AVPlayer playerWithURL:url];
    
    // 播放音频
    [self.player play];
}





@end
