//
//  ETInfiniteScrollView.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/9/21.
//  Copyright (c) Hello  All rights reserves.
//

#import <UIKit/UIKit.h>


typedef void(^ETInfiniteScrollViewBlock)(NSInteger clickIndex);

@interface ETInfiniteScrollView : UIView

/**图片数组*/
@property (strong, nonatomic) NSArray *images;

/**View数组*/
@property (strong, nonatomic) NSArray <UIView *>*viewLists;

@property (weak, nonatomic, readonly) UIPageControl *pageControl;
@property (assign, nonatomic, getter=isScrollDirectionPortrait) BOOL scrollDirectionPortrait;//yes表示竖直滚动 No表示水平滚动


//点击图片触发操作可以通过bloc回传

@property (nonatomic, copy) ETInfiniteScrollViewBlock block;



@end
