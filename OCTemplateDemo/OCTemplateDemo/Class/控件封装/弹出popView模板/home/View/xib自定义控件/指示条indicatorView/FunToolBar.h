//
//  FunToolBar.h
//  youpinshitang_menu
//
//  Created by Ethon.Z on 2019/9/17.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ETXibBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface FunToolBar : ETXibBaseView

@property (copy, nonatomic) void (^clickToolBarBlcok)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
