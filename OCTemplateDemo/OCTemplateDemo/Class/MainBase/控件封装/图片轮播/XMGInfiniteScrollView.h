//
//  XMGInfiniteScrollView.h
//  06-03-分页
//
//  Created by MJ Lee on 15/5/24.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XMGInfiniteScrollViewDelegate <NSObject>

- (void)clickImageViewWithIndex:(NSInteger )index;

@end

typedef void(^XMGInfiniteScrollViewBlock)(NSInteger clickIndex);

@interface XMGInfiniteScrollView : UIView
@property (strong, nonatomic) NSArray *images;
@property (weak, nonatomic, readonly) UIPageControl *pageControl;
@property (assign, nonatomic, getter=isScrollDirectionPortrait) BOOL scrollDirectionPortrait;//yes表示竖直滚动 No表示水平滚动


//点击图片触发操作可以通过block或者代理回传

//用blcok传值
@property (nonatomic, copy) XMGInfiniteScrollViewBlock block;
//用代理传值
@property (nonatomic, weak) id<XMGInfiniteScrollViewDelegate> delegate;
@end
