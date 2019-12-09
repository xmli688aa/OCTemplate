//
//  ETDragViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/8/25.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETDragViewController.h"
#import "ETFlowView.h"

@interface ETDragViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *baseImageView;
@property (strong, nonatomic) ETFlowView *flowView ;

@end

@implementation ETDragViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [self addFlowView];

}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _flowView.frame = self.baseImageView.bounds;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //使用view的transform属性,实现红色View拖拽移动
    //    - (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
    
    [self addFlowView];

}
- (IBAction)viewBeginFlow:(id)sender {
    [self viewAnimatie];

}
- (void)addFlowView{
    ETFlowView *flowView = [[ETFlowView alloc] initWithFrame: self.baseImageView.bounds];
    [self.baseImageView addSubview:flowView];
    _flowView = flowView;
}


- (void)viewAnimatie{
    
    _flowView.frame = CGRectMake(0, -self.baseImageView.height, self.baseImageView.width, self.baseImageView.height);
   __weak __typeof(self)weakSelf = self;
    [UIView animateWithDuration:1 animations:^{
        self->_flowView.y = CGRectGetMaxY(self.baseImageView.frame);
    } completion:^(BOOL finished) {
        [weakSelf viewAnimatie];
    }];
}
- (IBAction)clickPingyiBtn:(id)sender {
    //平移
    /**
     CGAffineTransform带make与不带make区别?
     1.带make相对的最原始的位置做形变操作.(一般只用做一次形变.)
     不带make是相对于指定的形变开始进行.
     相对于上一次操作(一般用于做多次形变.)
     */
    //self.imageV.transform = CGAffineTransformMakeTranslation(0, 300);
    [UIView animateWithDuration:0.5 animations:^{
        self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, 0, 30);

    }];
}


- (IBAction)clickSuoFangBtn:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        self.imageView.transform = CGAffineTransformScale(self.imageView.transform, 1.1, 1.2);

    }];
}
- (IBAction)clickXuanZhuanBtn:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI_2);
    }];
}


@end
