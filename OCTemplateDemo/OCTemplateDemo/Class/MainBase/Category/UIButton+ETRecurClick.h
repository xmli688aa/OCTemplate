//
//  UIButton+ETRecurClick.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/8/5.
//  Copyright © 2019 zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 按钮重复点击问题 (利用runtime延时按钮响应时间)
 */
@interface UIButton (ETRecurClick)

/**
 恢复点击事件的时间
 */
@property (nonatomic, assign) NSTimeInterval resumeEventInterval;

@end

NS_ASSUME_NONNULL_END
