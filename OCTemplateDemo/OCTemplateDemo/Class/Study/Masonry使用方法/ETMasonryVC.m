//
//  ETMasonryVC.m
//  OCTemplateDemo
//
//  Created by zhaowz on 2020/8/10.
//  Copyright © 2020 zhao. All rights reserved.
//

#import "ETMasonryVC.h"

//在引入Masonry文件时，建议加上#define MAS_SHORTHAND，这样可以简化代码，即去掉了mas_前缀。同时，也建议加上#define MAS_SHORTHAND。这样就可以将@10简化成10。
#define MAS_SHORTHAND_GLOBALS
#define MAS_SHORTHAND
#import "Masonry.h"

@interface ETMasonryVC ()
@property (nonatomic, strong) UIView *supView1;
@property (nonatomic, strong) UIView *supView2;
@property (nonatomic, strong) UIView *greenView;
@end

@implementation ETMasonryVC

CGFloat padding = 10;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTwoEqualWidthView];
    [self addThreeEqualHeightView];
    [self setChildViewInSuperViewCenter];
    [self updateMasonry];
}
//两个等宽的View
- (void)addTwoEqualWidthView{
    UIView *supView1 = [[UIView alloc] init];
    supView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:supView1];
    _supView1 = supView1;
    [supView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(kNavBarHeight));
        make.left.right.equalTo(@0);
        make.height.equalTo(@150);
    }];
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [supView1 addSubview:blueView];
    
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [supView1 addSubview:greenView];
    
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(supView1).insets(UIEdgeInsetsMake(padding, 60, padding, 0));
        make.right.equalTo(greenView.mas_left).offset(-padding);
    }];
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(supView1).insets(UIEdgeInsetsMake(padding, 0, padding, padding));
        make.width.equalTo(@[blueView]);
    }];
    
}
//三个等高的View
- (void)addThreeEqualHeightView{
    UIView *supView2 = [[UIView alloc] init];
    supView2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:supView2];
    _supView2 = supView2;
    [supView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_supView1.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@150);
    }];
    
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [_supView2 addSubview:redView];
    
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [_supView2 addSubview:blueView];
    
    UIView *yellowView = [[UIView alloc]init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [_supView2 addSubview:yellowView];
    /**********  等高   ***********/
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(_supView2).insets(UIEdgeInsetsMake(padding, padding, 0, padding));
        make.bottom.equalTo(blueView.mas_top).offset(-padding);
    }];
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_supView2).insets(UIEdgeInsetsMake(0, padding, 0, padding));
        make.bottom.equalTo(yellowView.mas_top).offset(-padding);
    }];
    
    /**
     下面设置make.height的数组是关键，通过这个数组可以设置这三个视图高度相等。其他例如宽度之类的，也是类似的方式。
     */
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(_supView2).insets(UIEdgeInsetsMake(0, padding, padding, padding));
        make.height.equalTo(@[blueView, redView]);
    }];
    
}
//子视图居中
- (void)setChildViewInSuperViewCenter{
    UIView *supView3 = [[UIView alloc] init];
    supView3.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:supView3];
    [supView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_supView2.mas_bottom).offset(30);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@300);
    }];
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [supView3 addSubview:redView];
    
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [supView3 addSubview:blueView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(supView3);
        make.left.equalTo(supView3).mas_offset(padding);
        make.right.equalTo(blueView.mas_left).mas_offset(-padding);
        //make.width.equalTo(blueView);
        make.height.mas_equalTo(150);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(supView3);
        make.right.equalTo(supView3).mas_offset(-padding);
        make.width.equalTo(redView);
        make.height.mas_equalTo(150);
    }];
}
- (void)updateMasonry{
    _greenView = [[UIView alloc] init];
    _greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_greenView];
    
    // 设置greenView的center和size，这样就可以达到简单进行约束的目的
    [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        // 这里通过mas_equalTo给size设置了基础数据类型的参数，参数为CGSize的结构体
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];

    // 为了更清楚的看出约束变化的效果，在显示两秒后更新约束。
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 指定更新size，其他约束不变。
        [self.greenView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
    });
}


@end
