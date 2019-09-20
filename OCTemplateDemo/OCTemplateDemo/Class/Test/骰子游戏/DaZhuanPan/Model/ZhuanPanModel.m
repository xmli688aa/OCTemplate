
//
//  ZhuanPanModel.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/22.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ZhuanPanModel.h"

@implementation ZhuanPanModel
- (instancetype)initWithNumber:(NSInteger)number content:(NSString *)content{
    if (self = [super init]) {
        self.number = number;
        self.content = content;
    }
    return self;
}

@end
