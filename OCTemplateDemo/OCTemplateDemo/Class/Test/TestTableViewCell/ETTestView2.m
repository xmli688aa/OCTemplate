
//
//  ETTestView2.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/7/18.
//  Copyright © 2019  . All rights reserved.
//

#import "ETTestView2.h"

@implementation ETTestView2


- (void)setUI{
    self.backgroundColor = [UIColor yellowColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    label.text = @"我是codeView";
    [self addSubview:label];
}
@end
