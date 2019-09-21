
//
//  ETSetBtnImagePositionVC.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/9/21.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETSetBtnImagePositionVC.h"
#import "SPButton.h"
@interface ETSetBtnImagePositionVC ()

@end

@implementation ETSetBtnImagePositionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //自己设置
    [self addBtn];
    //使用自定义SPButton设置
    [self addSPButton];
    //也可以使用xib设置按钮的位置 按钮的class设置为SPButton即可
    
}
- (void)addBtn{
    
    UIButton *testBtn = [[UIButton alloc] initWithFrame:CGRectMake((kScreenWidth - 200)/2.0, kNavBarHeight + 20, 200, 100)];
    [testBtn setBackgroundColor:UIColor.lightGrayColor];
    [testBtn setTitle:@"我是测试按钮1" forState:UIControlStateNormal];
    [testBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    [testBtn setContentMode:UIViewContentModeCenter];
    [testBtn setImage:[UIImage imageNamed:@"Expression_smile"] forState:UIControlStateNormal];
    [self.view addSubview:testBtn];
   //图片和文字都居中
    [testBtn setImageEdgeInsets:UIEdgeInsetsMake(0,0, 0, -testBtn.titleLabel.intrinsicContentSize.width)];;
    [testBtn setTitleEdgeInsets:UIEdgeInsetsMake( 0, -testBtn.currentImage.size.width, 0, 0)];;
    
    UIButton *testBtn2 = [[UIButton alloc] initWithFrame:CGRectMake((kScreenWidth - 200)/2.0, kNavBarHeight + 130, 200, 100)];
    [testBtn2 setBackgroundColor:UIColor.lightGrayColor];
    [testBtn2 setTitle:@"我是测试按钮2" forState:UIControlStateNormal];
    [testBtn2 setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    [testBtn2 setContentMode:UIViewContentModeCenter];
    [testBtn2 setImage:[UIImage imageNamed:@"Expression_smile"] forState:UIControlStateNormal];
    [self.view addSubview:testBtn2];
    //图片在上 文字在下
    [testBtn2 setImageEdgeInsets:UIEdgeInsetsMake(-testBtn2.titleLabel.intrinsicContentSize.height,0, 0, -testBtn2.titleLabel.intrinsicContentSize.width)];;
    [testBtn2 setTitleEdgeInsets:UIEdgeInsetsMake( testBtn2.currentImage.size.height, -testBtn2.currentImage.size.width, 0, 0)];;
    
}
- (void)addSPButton{
    //图片在左 文字在右
    SPButton *button = [[SPButton alloc] initWithImagePosition:SPButtonImagePositionRight];
    button.frame = CGRectMake((kScreenWidth - 200)/2.0, kNavBarHeight + 320, 200, 100);
    [button setTitle:@"送你一个微笑" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"Expression_smile"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor yellowColor];
    button.titleLabel.backgroundColor = [UIColor greenColor];
    button.imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
}


@end
