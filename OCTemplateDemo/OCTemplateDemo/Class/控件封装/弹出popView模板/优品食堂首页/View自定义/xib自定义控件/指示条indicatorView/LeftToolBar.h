//
//  LeftToolBar.h
//  youpinshitang_menu
//
//  Created by Ethon.Z on 2019/9/17.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ETXibBaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    TeGong = 0,
    Dinner,
    LingShi,
    Drink
} LeftToolBarType;

typedef void(^LeftToolBarBlock)(LeftToolBarType type);

@interface LeftToolBar : ETXibBaseView

@property (copy, nonatomic) NSString *selectTitle;
    
@property (copy, nonatomic) LeftToolBarBlock clickLeftBarBlock;
    

    
///更新正餐的标题
- (void)updateDinnerbtnWithIndex:(NSInteger )index;

@end

NS_ASSUME_NONNULL_END
