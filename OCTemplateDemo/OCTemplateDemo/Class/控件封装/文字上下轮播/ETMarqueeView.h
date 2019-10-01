//
//  ETMarqueeView.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/10/1.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETXibBaseView.h"
typedef void (^ETMarqueeViewBlock) (NSInteger);

NS_ASSUME_NONNULL_BEGIN

@interface ETMarqueeView : UIView

@property (nonatomic,copy )ETMarqueeViewBlock block;

@property (nonatomic,strong) NSArray *marqueeContentArray;
@property (nonatomic,assign) CGFloat animationDuration;//滚动时间
@property (nonatomic,assign) CGFloat pauseDuration;//停顿时间

- (void)start;


@end

NS_ASSUME_NONNULL_END
