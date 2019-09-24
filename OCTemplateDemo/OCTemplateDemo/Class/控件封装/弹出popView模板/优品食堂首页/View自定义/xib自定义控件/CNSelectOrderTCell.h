//
//  CNSelectOrderTCell.h
//  youpinshitang_menu
//
//  Created by cean.q on 2019/9/19.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MealModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CNSelectOrderTCell : UITableViewCell

@property (strong, nonatomic) MealModel *mealModel;
@property (nonatomic, copy) dispatch_block_t orderBlock;
@property (nonatomic, assign) BOOL isOrder;
- (void)hidOrderBtn:(BOOL)hidden;
@property (nonatomic, copy) void (^addBlock)(MealModel *model);
@property (nonatomic, copy) void (^subtractBlock)(MealModel *model);
@end

NS_ASSUME_NONNULL_END
