//
//  ETCustomTextField.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/24.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ETCustomTextField.h"

@implementation ETCustomTextField

- (instancetype)init{
    if (self = [super init]) {
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}
- (void)textFieldDidChange:(UITextField *)textField{

    switch (self.textFieldType) {
        case UserName:
            if (textField.text.length >= 5) {
                textField.text = [textField.text substringToIndex:5];
            }
            break;
        case ZhuanPanRules:
            if (textField.text.length > 17) {
                textField.text = [textField.text substringToIndex:17];
            }
            break;
        default:
            break;
    }
}


@end
