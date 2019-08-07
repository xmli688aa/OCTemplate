
//
//  ETTestView2.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/7/18.
//  Copyright © 2019  . All rights reserved.
//

#import "ETTestCodeView.h"

@implementation ETTestCodeView


- (void)addOtherSubviews{
    self.backgroundColor = [UIColor yellowColor];
    UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
    label.text = @"我是codeView";
    [self addSubview:label];
}
@end
