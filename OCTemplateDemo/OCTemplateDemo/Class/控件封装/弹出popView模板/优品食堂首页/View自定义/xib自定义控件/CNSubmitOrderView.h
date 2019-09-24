//
//  CNSubmitOrderView.h
//  Server
//
//  Created by cean.q on 2019/9/19.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ETXibBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CNSubmitOrderView : ETXibBaseView

+ (instancetype)orderView;
- (void)show;
- (void)remove;
@end

NS_ASSUME_NONNULL_END
