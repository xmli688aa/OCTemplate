//
//  ETiCarouselVC.m
//  OCTemplateDemo
//
//  Created by 赵伟志(EX-ZHAOWEIZHI002) on 2021/2/5.
//  Copyright © 2021 zhao. All rights reserved.
//

#import "ETiCarouselVC.h"
#import "iCarousel.h"

@interface ETiCarouselVC ()<iCarouselDataSource, iCarouselDelegate>

@property (nonatomic, strong) iCarousel *myCarousel;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ETiCarouselVC

- (NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
        for (int i = 0; i<7; i++) {
            NSString *imageName = [NSString stringWithFormat:@"style_%d.jpeg",i];
            UIImage *image = [UIImage imageNamed:imageName];
            [_dataSource addObject:image];
        }
    }
    return _dataSource;
}
- (iCarousel *)myCarousel{
    if (_myCarousel == nil) {
        _myCarousel = [[iCarousel alloc] initWithFrame:CGRectZero];
        _myCarousel.dataSource = self;
        _myCarousel.delegate = self;
        _myCarousel.bounces = NO;
        _myCarousel.pagingEnabled = YES;
        _myCarousel.type = iCarouselTypeCoverFlow;
    }
    return _myCarousel;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.myCarousel];
    [self.myCarousel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100 + kNavBarHeight);
        make.left.right.equalTo(@0);
        make.height.mas_equalTo(200);
    }];
    NSLog(@"%f-----%f",kScreenWidth,kScreenHeight);
    self.myCarousel.currentItemIndex = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(scrollCarousel) userInfo:nil repeats:YES];

}

- (void)scrollCarousel {
    [self.myCarousel scrollToItemAtIndex:self.myCarousel.currentItemIndex+1 duration:2];
}

#pragma mark - iCarouselDataSource, iCarouselDelegate
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    if (view == nil) {
        CGFloat viewWidth = 300;
        //下面view的x，y不起作用 view只会在iCarousel的中心
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, viewWidth)];
    }
    view.backgroundColor = [UIColor blueColor];
    ((UIImageView *)view).image = [self.dataSource objectAtIndex:index];
    ((UIImageView *)view).contentMode = UIViewContentModeScaleToFill;
    return view;
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return self.dataSource.count;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"点击了第%ld个图片",index);
}

//下面的方法实现iCarousel循环
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value {
    switch (option) {
        case iCarouselOptionWrap:
            return YES;
        default:
            return value;
    }
    return value;
}

@end
