
//
//  ETTestXibView.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/8/7.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETTestXibView.h"

@implementation ETTestXibView

- (void)awakeFromNib{
    [super awakeFromNib];

}
- (void)addOtherSubviews{
    UIView *redV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    redV.backgroundColor = [UIColor redColor];
    [self addSubview:redV];
}


@end
