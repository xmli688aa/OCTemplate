//
//  ETMenuTypePopView.h
//  Server
//
//  Created by Ethon.Z on 2019/9/18.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ETXibBaseView.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    MenuType_None = 0,
    MenuType_Zaocan,
    MenuType_Wucan,
    MenuType_Wancan,
    MenuType_xiaoye,
} MenuType;
@interface ETMenuTypePopView : ETXibBaseView

+ (void)showMenuTypePopViewWithBlock:(void (^)(MenuType selectMenuType))conformBlcok;
    
@end

NS_ASSUME_NONNULL_END
