//
//  ShaiziRulesPopView.h
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/22.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
///骰子规则
@interface ShaiziRulesPopView : UIView

@property (copy, nonatomic) NSString *contentStr;

+ (void)showRulesViewWithContent:(NSString *)content;


@end

NS_ASSUME_NONNULL_END
