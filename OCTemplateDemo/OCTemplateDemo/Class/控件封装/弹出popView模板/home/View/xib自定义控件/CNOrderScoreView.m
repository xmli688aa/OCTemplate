//
//  CNOrderScoreView.m
//  Server
//
//  Created by cean.q on 2019/9/20.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "CNOrderScoreView.h"

@interface CNOrderScoreView ()
@property (weak, nonatomic) IBOutlet UIButton *upBtn;
@property (weak, nonatomic) IBOutlet UIButton *downBtn;
@property (weak, nonatomic) IBOutlet UILabel *orderLb;
@property (nonatomic, assign) NSInteger totalScore;
@property (nonatomic, assign) NSInteger totalBill;
@end

@implementation CNOrderScoreView

+ (instancetype)scoreView {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    CGFloat top = window.bounds.size.height - kTabBarHeight - 70;
    CGFloat width = window.bounds.size.width - 30;
    CNOrderScoreView *view = [[CNOrderScoreView alloc] initWithFrame:CGRectMake(15, top, width, 60)];
    return view;
}

- (void)show {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
}

- (void)remove {
    [self removeFromSuperview];
    self.upBtn.hidden = NO;
    self.downBtn.hidden = YES;
}

- (IBAction)goToPay:(id)sender {
    [self removeFromSuperview];
    if (_delegate && [_delegate respondsToSelector:@selector(submit:)]) {
        [_delegate submit:self];
    }
}


- (IBAction)showBill:(UIButton *)sender {
    sender.hidden = YES;
    self.downBtn.hidden = NO;
    if (_delegate && [_delegate respondsToSelector:@selector(up:)]) {
        [_delegate up:self];
    }
}

- (IBAction)hideBill:(UIButton *)sender {
    sender.hidden = YES;
    self.upBtn.hidden = NO;
    if (_delegate && [_delegate respondsToSelector:@selector(down:)]) {
        [_delegate down:self];
    }
}

- (void)addScore:(NSInteger)score bill:(NSInteger)count {
    _totalScore += score;
    _totalBill += count;
    self.orderLb.text = [NSString stringWithFormat:@"总%ld个订单，%ld积分", _totalBill, _totalScore];
}

- (void)subtractScore:(NSInteger)score bill:(NSInteger)count {
    _totalScore -= score;
    _totalBill -= count;
    self.orderLb.text = [NSString stringWithFormat:@"总%ld个订单，%ld积分", _totalBill, _totalScore];
}
@end
