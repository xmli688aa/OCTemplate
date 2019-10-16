//
//  ETInfiniteScrollView.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/9/21.
//  Copyright (c) Hello  All rights reserves.
//

#import "ETInfiniteScrollView.h"

static int const ScrollViewSubViewCounts = 3;

@interface ETInfiniteScrollView() <UIScrollViewDelegate,UIGestureRecognizerDelegate>
@property (weak, nonatomic) UIScrollView *scrollView;
@property (weak, nonatomic) NSTimer *timer;
@property (nonatomic, assign) NSInteger clickIndex;
@end

@implementation ETInfiniteScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        [self setUI];
    }
    return self;
}
- (void)setUI{
    // 滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.delegate = self;
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    //添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickImageView:)];
    tap.delegate = self;
    [self.scrollView addGestureRecognizer:tap];
    
    // 图片控件
    for (int i = 0; i<ScrollViewSubViewCounts; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [scrollView addSubview:imageView];
    }
    
    // 页码视图
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    [self addSubview:pageControl];
    _pageControl = pageControl;
    //        self.scrollDirectionPortrait = YES;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.scrollView.frame = self.bounds;
    if (self.isScrollDirectionPortrait) {
        self.scrollView.contentSize = CGSizeMake(0, ScrollViewSubViewCounts * self.bounds.size.height);
    } else {
        self.scrollView.contentSize = CGSizeMake(ScrollViewSubViewCounts * self.bounds.size.width, 0);
    }
    
    for (int i = 0; i<ScrollViewSubViewCounts; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        
        if (self.isScrollDirectionPortrait) {
            imageView.frame = CGRectMake(0, i * self.scrollView.frame.size.height, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        } else {
            imageView.frame = CGRectMake(i * self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        }
    }
    
    CGFloat pageW = 80;
    CGFloat pageH = 20;
    CGFloat pageX = self.scrollView.frame.size.width - pageW;
    CGFloat pageY = self.scrollView.frame.size.height - pageH;
    self.pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
}

- (void)setImages:(NSArray *)images
{
    _images = images;
    [self setPageCount:images.count];
}
- (void)setViewLists:(NSArray<UIView *> *)viewLists{
    _viewLists = viewLists;
    [self setPageCount:viewLists.count];
    
}
- (void)setPageCount:(NSInteger )subViewCount{
    // 设置页码
    self.pageControl.numberOfPages = subViewCount;
    self.pageControl.currentPage = 0;
    // 设置内容
    [self updateContent];
    // 开始定时器
    [self startTimer];
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 找出最中间的那个图片控件
    NSInteger page = 0;
    CGFloat minDistance = MAXFLOAT;
    for (int i = 0; i<self.scrollView.subviews.count; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        CGFloat distance = 0;
        if (self.isScrollDirectionPortrait) {
            distance = ABS(imageView.frame.origin.y - scrollView.contentOffset.y);
        } else {
            distance = ABS(imageView.frame.origin.x - scrollView.contentOffset.x);
        }
        if (distance < minDistance) {
            minDistance = distance;
            page = imageView.tag;
        }
    }
    self.pageControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self updateContent];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self updateContent];
}

#pragma mark - 内容更新
- (void)updateContent
{
    // 设置图片
    for (int i = 0; i<self.scrollView.subviews.count; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        for (UIView *subView in imageView.subviews) {
            [subView removeFromSuperview];
        }
        NSInteger index = self.pageControl.currentPage;
        if (i == 0) {
            index--;
        } else if (i == 2) {
            index++;
        }
        if (index < 0) {
            index = self.pageControl.numberOfPages - 1;
        } else if (index >= self.pageControl.numberOfPages) {
            index = 0;
        }
        imageView.tag = index;
        if (self.viewLists.count >0) {
            UIView *subView = self.viewLists[index];
//            subView.frame = imageView.bounds;
            [imageView addSubview:subView];
        }else{
            imageView.image = self.images[index];
            
        }
        _clickIndex = index-1;
        if (_clickIndex<0) {
            if (self.images.count) {
                _clickIndex = self.images.count -1;
            }else{
                _clickIndex = self.viewLists.count -1;
            }
        }
        
    }
    
    // 设置偏移量在中间
    if (self.isScrollDirectionPortrait) {
        self.scrollView.contentOffset = CGPointMake(0, self.scrollView.frame.size.height);
    } else {
        self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
    }
}

#pragma mark - 点击图片处理
- (void)didClickImageView:(UITapGestureRecognizer *)sender{
    NSLog(@"%ld",(long)_clickIndex);
    if (_block) {
        _block(self.clickIndex);
    }
    
}


#pragma mark - 定时器处理
- (void)startTimer
{
    if (self.timer == nil) {
        NSTimer *timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(next) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        self.timer = timer;
    }
    
}

- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)next
{
    if (self.isScrollDirectionPortrait) {
        [self.scrollView setContentOffset:CGPointMake(0, 2 * self.scrollView.frame.size.height) animated:YES];
    } else {
        [self.scrollView setContentOffset:CGPointMake(2 * self.scrollView.frame.size.width, 0) animated:YES];
    }
}
@end
