
//
//  ETTestView2.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/7/18.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETTestView2.h"

@implementation ETTestView2


- (void)setUI{
    self.backgroundColor = [UIColor yellowColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    label.text = @"哈好厉害嘎哈拉黑拉黑啦改好啦";
    [self addSubview:label];
}
@end
