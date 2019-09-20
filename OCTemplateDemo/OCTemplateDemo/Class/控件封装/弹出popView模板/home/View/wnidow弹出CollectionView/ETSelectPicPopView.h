//
//  ETSelectPicPopView.h
//  Server
//
//  Created by Ethon.Z on 2019/9/18.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ETXibBaseView.h"
#import "MealModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ETSelectPicPopView : ETXibBaseView

+ (void)showSelectPicPopViewWithMealModelsArray:(NSArray *)mealModelsArray selectBlock:(void (^)(MealModel *selectMealModel))selectBlock;
    
@end

NS_ASSUME_NONNULL_END
