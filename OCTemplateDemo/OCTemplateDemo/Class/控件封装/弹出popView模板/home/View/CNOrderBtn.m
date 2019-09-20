//
//  CNOrderBtn.m
//  Server
//
//  Created by cean.q on 2019/9/19.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "CNOrderBtn.h"

@implementation CNOrderBtn

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadXibView];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self loadXibView];
    }
    return self;
}

- (void)loadXibView {
    [self setTitle:@"确认已送达" forState:UIControlStateNormal];
    [self setTitleColor:UIColorFromHex(0xFE6C02) forState:UIControlStateNormal];
    
    [self setTitle:@"已完成" forState:UIControlStateDisabled];
    [self setTitleColor:UIColorFromHex(0x666666) forState:UIControlStateDisabled];
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 18;
    self.layer.masksToBounds = YES;
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    if (enabled) {
        self.layer.borderColor = UIColorFromHex(0xFE6C02).CGColor;
    } else {
        self.layer.borderColor = UIColorFromHex(0xF5F5F5).CGColor;
    }
}
@end
