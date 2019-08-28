//
//  ShaiziGameVC.h
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/21.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ETBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    Game_789,
    Game_BigOrSmall,
    Game_Dahua,
} ShaiziGameType;


@interface ShaiziGameVC : ETBaseViewController

///游戏类型 三种
@property (assign, nonatomic) ShaiziGameType gameType;

@end

NS_ASSUME_NONNULL_END
