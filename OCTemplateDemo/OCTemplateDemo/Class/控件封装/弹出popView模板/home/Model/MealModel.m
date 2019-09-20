//
//  MealModel.m
//  youpinshitang_menu
//
//  Created by Ethon.Z on 2019/9/17.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "MealModel.h"

@implementation MealModel

- (instancetype)initWithType:(NSString *)type name:(NSString *)name iconName:(NSString *)iconName jifen:(NSInteger )jifen{
    if(self = [super init]){
        _type = type;
        _name = name;
        _iconName = iconName;
        _jifen = jifen;
        _orderCount = 1;
    }
    return self;
}


@end
