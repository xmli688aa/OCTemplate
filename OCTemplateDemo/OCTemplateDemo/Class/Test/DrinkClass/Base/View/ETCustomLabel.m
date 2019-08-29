//
//  ETCustomLabel.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/23.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ETCustomLabel.h"

@implementation ETCustomLabel

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}
- (void)commonInit{
    NSString *str = self.text;
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:str attributes:@{NSKernAttributeName:@(2)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 10.0; // 设置行间距
    paragraphStyle.alignment = NSTextAlignmentJustified; //设置两端对齐显示
    [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedStr.length)];
    self.numberOfLines = 0;
    self.attributedText = attributedStr;
    [self sizeToFit];

}
@end
