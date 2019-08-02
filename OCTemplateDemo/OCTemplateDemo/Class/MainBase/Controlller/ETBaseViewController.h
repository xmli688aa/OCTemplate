//
//  ETBaseViewController.h
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019 zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETBaseViewController : UIViewController


/**
 设置控制器是否需要横屏

 @param landscape YES:横屏  NO:竖屏
 */
- (void)setNewOrientation:(BOOL)landscape;


@end

NS_ASSUME_NONNULL_END
