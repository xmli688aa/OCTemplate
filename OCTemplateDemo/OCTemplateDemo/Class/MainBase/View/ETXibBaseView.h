//
//  ETXibBaseView.h
//  OCTemplateDemo
//
//  Created by Ethon on 2019/8/30.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ETXibBaseView : ETBaseView

/**
 xib视图添加后 其他一些初始化操作(如背景色设置 添加其他控件)
 */
- (void)initOthers;

@end

NS_ASSUME_NONNULL_END
