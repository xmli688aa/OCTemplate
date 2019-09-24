//
//  NavigationView.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/21.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "NavigationView.h"

@implementation NavigationView

- (void)layoutSubviews{
    [super layoutSubviews];
}
//xib加载view
+ (instancetype )loadXibWithFrame:(CGRect )frame{
   
    NSString *xibName = NSStringFromClass([self class]);
    NavigationView *xibView =  [[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil].firstObject ;
    xibView.frame = frame;

    return xibView;
}


- (IBAction)clickBackBtn:(id)sender {
    if (self.clickBlock) {
        self.clickBlock(Click_Back);
    }
    
}
- (IBAction)clickSetBtn:(id)sender {
    if (self.clickBlock) {
        self.clickBlock(Click_Set);
    }
    
}

@end
