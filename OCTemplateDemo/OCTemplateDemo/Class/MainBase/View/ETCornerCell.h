//
//  ETCornerCell.h
//  OCTemplateDemo
//
//  Created by Ethon on 2019/8/4.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    
    Solo,   //单独一行
    First,  //第一个
    Middle, //中间
    Last,   //最后一个
} CellPositon;

@interface ETCornerCell : ETBaseTableViewCell

@property (nonatomic, assign) CellPositon postion;

@end

NS_ASSUME_NONNULL_END
