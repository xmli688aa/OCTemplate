//
//  LoadingView.h
//  PublicDemo
//
//  Created by Ethon.Z on 2019/10/23.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoadingView : UIView

+ (instancetype)showLoadingWithSuperView:(nullable UIView *)superView;

+ (void)hideLoadingWithSuperView:(nullable UIView *)superView;

- (void)hide;

@end

NS_ASSUME_NONNULL_END
