//
//  ZhuanPanRulesPopView.h
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/22.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZhuanPanRulesPopView : UIView

+ (void)showRulesViewWithDataArray:(NSMutableArray *)dataArray isSet:(BOOL)isSet selectBlcok:(void(^)(NSMutableArray *dataArray))selectBlock;

@end

NS_ASSUME_NONNULL_END
