
//
//  RenSongAlertView.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/23.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "RenSongAlertView.h"

@interface RenSongAlertView ()
@property (copy, nonatomic) void (^conformBlock)(void);
@end
@implementation RenSongAlertView

+ (void)showAndConformBlcok:(void(^)(void))conformBlock{
    
    RenSongAlertView *popView = [[NSBundle mainBundle] loadNibNamed:@"RenSongAlertView" owner:nil options:nil].firstObject;
    popView.conformBlock = conformBlock;
    popView.frame = [UIScreen mainScreen].bounds;
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:popView];
}

- (IBAction)clickConformBtn:(id)sender {
    if (self.conformBlock) {
        self.conformBlock();
    }
    [self closeView];
}
- (IBAction)clickCanncelBtn:(id)sender {
    [self closeView];

}
- (IBAction)clickCloseBtn:(id)sender {
    [self closeView];
}

- (void)closeView{
    [self removeFromSuperview];
}
@end
