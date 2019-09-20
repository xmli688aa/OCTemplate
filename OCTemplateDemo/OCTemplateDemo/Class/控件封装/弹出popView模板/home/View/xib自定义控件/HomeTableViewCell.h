//
//  HomeTableViewCell.h
//  youpinshitang_menu
//
//  Created by Ethon.Z on 2019/9/17.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MealModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeTableViewCell : UITableViewCell

@property (strong, nonatomic) MealModel *mealModel;
@property (nonatomic, copy) dispatch_block_t addBlock;
@end

NS_ASSUME_NONNULL_END
