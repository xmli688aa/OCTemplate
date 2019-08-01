//
//  ETNewsVM.h
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/28.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ETNewsVM : ETBaseModel

- (void)loadNewsData:(void(^)(NSArray *))completion;

@end

NS_ASSUME_NONNULL_END
