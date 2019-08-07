
//
//  ETTestCodeCell.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/8/7.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETTestCodeCell.h"

@implementation ETTestCodeCell



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (void)addOtherSubviews{
    UIView *greenV = [[UIView alloc] initWithFrame:CGRectMake(200, 0, 20, 20)];
    greenV.backgroundColor = UIColor.greenColor;
    [self.contentView addSubview:greenV];
}
@end
