//
//  NavigationView.h
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/21.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ETDrinkBaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    Click_Back,
    Click_Set,
    Click_Mine,
} ClickType;

typedef void(^NavigationViewBlock)(ClickType type);

@interface NavigationView : UIView

@property (weak, nonatomic) IBOutlet UIButton *rightItem;

@property (copy, nonatomic) NavigationViewBlock clickBlock;

+ (instancetype )loadXibWithFrame:(CGRect )frame;
@end

NS_ASSUME_NONNULL_END
