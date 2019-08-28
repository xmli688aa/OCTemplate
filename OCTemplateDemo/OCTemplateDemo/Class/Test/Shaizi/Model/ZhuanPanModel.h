//
//  ZhuanPanModel.h
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/22.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ETBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZhuanPanModel : ETBaseModel
///序号
@property (assign, nonatomic) NSInteger number;
///内容
@property (copy, nonatomic) NSString *content;

- (instancetype )initWithNumber:(NSInteger )number content:(NSString *)content;

@end

NS_ASSUME_NONNULL_END
