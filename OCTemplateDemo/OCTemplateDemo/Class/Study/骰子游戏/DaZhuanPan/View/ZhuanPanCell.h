//
//  ZhuanPanCell.h
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/22.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ZhuanPanModel;

@interface ZhuanPanCell : UITableViewCell

@property (strong, nonatomic) ZhuanPanModel *model;
@property (assign, nonatomic) BOOL isSet;

@end

NS_ASSUME_NONNULL_END
