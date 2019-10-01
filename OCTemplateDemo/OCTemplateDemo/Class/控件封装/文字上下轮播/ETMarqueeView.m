//
//  ETMarqueeView.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/10/1.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETMarqueeView.h"
#import "ETCutsomToteView.h"

@interface ETMarqueeView ()
@property (nonatomic, strong) ETCutsomToteView *customView1;
@property (nonatomic, strong) ETCutsomToteView *customView2;


@end

@implementation ETMarqueeView
{
    // 记录位置
    NSInteger currentIndex;
}
#pragma mark - 懒加载
- (ETCutsomToteView *)customView1 {
    if (!_customView1) {
        _customView1 = [[ETCutsomToteView alloc]init];
        [self addSubview:_customView1];
        _customView1.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClick)];
        [_customView1 addGestureRecognizer:tap];
    }
    return _customView1;
}
- (ETCutsomToteView *)customView2 {
    if (!_customView2) {
        _customView2 = [[ETCutsomToteView alloc]init];
        [self addSubview:_customView2];
        _customView2.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClick)];
        [_customView2 addGestureRecognizer:tap];
    }
    return _customView2;
}


#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
        
        // 设置默认数据
        self.animationDuration = 1.f;
        self.pauseDuration = 2.5f;
    }
    return self;
}
- (void)setupView {
    
    // 设置Label的frame
    self.customView1.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.customView2.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height);

    self.clipsToBounds = YES;
}

#pragma mark - 设置动画
-(void)startMarqueeViewAnimation{
    
    // 1.设置滚动前的数据
    self.customView1.toteModel = self.marqueeContentArray[currentIndex];
    self.customView1.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    // 提前计算currentIndex
    currentIndex++;
    if(currentIndex >= [self.marqueeContentArray count]) {
        currentIndex = 0;
    }
    
    self.customView2.toteModel = self.marqueeContentArray[currentIndex];
    self.customView2.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height);
    
    
    // 2.开始动画
    [UIView animateWithDuration:self.animationDuration animations:^{
       
        self.customView1.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
        self.customView2.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        
    } completion:^(BOOL finished) {
        
        // 延迟一秒再次启动动画
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.pauseDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self startMarqueeViewAnimation];
        });
        
    }];
}

#pragma mark - 开始动画
- (void)start {
    
    // 设置动画默认第一条信息
    currentIndex = 0;
    
    // 开始动画
    [self startMarqueeViewAnimation];
}
#pragma mark - 点击事件
- (void)onClick {
    if (self.block) {
        self.block(currentIndex);
    }
}

@end
