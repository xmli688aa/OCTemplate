//
//  ShaiziSetPopView.h
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/22.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShaiziGameVC.h"
NS_ASSUME_NONNULL_BEGIN

@interface ShaiziSetPopView : UIView

+ (void)showSetViewWithGameType:(ShaiziGameType )gameType originCount:(NSInteger )count selectBlcok:(void(^)(NSInteger shaiziCount))selectBlock;

@end

NS_ASSUME_NONNULL_END
