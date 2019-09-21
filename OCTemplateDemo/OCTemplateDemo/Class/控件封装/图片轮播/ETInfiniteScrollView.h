//
//  ETInfiniteScrollView.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/9/21.
//  Copyright (c) Hello  All rights reserves.
//

#import <UIKit/UIKit.h>

@protocol ETInfiniteScrollViewDelegate <NSObject>

- (void)clickImageViewWithIndex:(NSInteger )index;

@end

typedef void(^ETInfiniteScrollViewBlock)(NSInteger clickIndex);

@interface ETInfiniteScrollView : UIView
@property (strong, nonatomic) NSArray *images;
@property (weak, nonatomic, readonly) UIPageControl *pageControl;
@property (assign, nonatomic, getter=isScrollDirectionPortrait) BOOL scrollDirectionPortrait;//yes表示竖直滚动 No表示水平滚动


//点击图片触发操作可以通过block或者代理回传

//用blcok传值
@property (nonatomic, copy) ETInfiniteScrollViewBlock block;
//用代理传值
@property (nonatomic, weak) id<ETInfiniteScrollViewDelegate> delegate;
@end
