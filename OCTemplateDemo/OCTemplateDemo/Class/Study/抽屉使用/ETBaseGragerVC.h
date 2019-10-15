//
//  ETBaseGragerVC.h
//  OCTemplateDemo
//
//  Created by Ethon on 2019/10/15.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ETBaseGragerVC : ETBaseViewController
@property (nonatomic, weak, readonly)  UIView *mainV;
@property (nonatomic, weak, readonly)  UIView *leftV;

//打开抽屉
- (void)open;
//关闭抽屉
- (void)close;

@end

NS_ASSUME_NONNULL_END
