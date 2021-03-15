//
//  ETEditTableViewCell.h
//  DarkMode
//
//  Created by ET on 2020/12/5.
//  Copyright © 2020 https://github.com/wsl2ls   ----- . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETBaseTableViewCell.h"
@class ETEditModel;
NS_ASSUME_NONNULL_BEGIN

@interface ETEditTableViewCell : ETBaseTableViewCell

@property (nonatomic, strong) ETEditModel *model;

@end

NS_ASSUME_NONNULL_END
