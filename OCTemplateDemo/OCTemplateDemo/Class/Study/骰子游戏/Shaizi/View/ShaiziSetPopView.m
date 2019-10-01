//
//  ShaiziSetPopView.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/22.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ShaiziSetPopView.h"
#import <AudioToolbox/AudioToolbox.h>
#import "ETShaiziTool.h"

typedef void(^SlectBlock)(NSInteger count);

@interface ShaiziSetPopView ()

@property (weak, nonatomic) IBOutlet UILabel *shaiziCountLabe;

@property (weak, nonatomic) IBOutlet UIButton *shakeBtn;

@property (weak, nonatomic) IBOutlet UIButton *soundBtn;

@property (assign, nonatomic) NSInteger shaiziCount;

@property (copy, nonatomic) SlectBlock selectBlock;

@property (weak, nonatomic) IBOutlet UIView *shaiziView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *shaiziViewH;

@property (assign, nonatomic) BOOL shakeStatus;
@property (assign, nonatomic) BOOL soundStatus;

@end

@implementation ShaiziSetPopView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.shakeStatus = [ETShaiziTool getSystemShakeStatus];
    self.soundStatus = [ETShaiziTool getSystemSoundStatus];
    
}
- (void)setShakeStatus:(BOOL)shakeStatus{
    _shakeStatus = shakeStatus;
    if (_shakeStatus) {
        [_shakeBtn setBackgroundImage:[UIImage imageNamed:@"on"] forState:UIControlStateNormal];
        [ETShaiziTool openSystemShake];
    }else{
        [_shakeBtn setBackgroundImage:[UIImage imageNamed:@"off"] forState:UIControlStateNormal];
        [ETShaiziTool closeSystemShake];
    }
}
- (void)setSoundStatus:(BOOL)soundStatus{
    _soundStatus = soundStatus;
    if (_soundStatus) {
        [_soundBtn setBackgroundImage:[UIImage imageNamed:@"on"] forState:UIControlStateNormal];
        [ETShaiziTool openSystemSound];
    }else{
        [_soundBtn setBackgroundImage:[UIImage imageNamed:@"off"] forState:UIControlStateNormal];
        [ETShaiziTool closeSystemSound];
    }
}
+ (void)showSetViewWithGameType:(ShaiziGameType )gameType originCount:(NSInteger )count selectBlcok:(void(^)(NSInteger shaiziCount))selectBlock{
    
    ShaiziSetPopView *popView = [[NSBundle mainBundle] loadNibNamed:@"ShaiziSetPopView" owner:nil options:nil].firstObject;
    popView.shaiziCount = count;
    popView.selectBlock = selectBlock;
    [popView updateUIWithGameType:gameType];
    popView.frame = [UIScreen mainScreen].bounds;
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:popView];
    
}
- (void)setShaiziCount:(NSInteger)shaiziCount{
    _shaiziCount = shaiziCount;
    _shaiziCountLabe.text = [NSString stringWithFormat:@"%ld",(long)self.shaiziCount];

}
- (void)updateUIWithGameType:(ShaiziGameType )gameType{
    switch (gameType) {
        case Game_789:
            _shaiziView.hidden = YES;
            _shaiziViewH.constant = 0;
            break;
        case Game_BigOrSmall:
            
            break;
        case Game_Dahua:
            
            break;
            
        default:
            break;
    }
}
///关闭设置弹窗
- (IBAction)closeSetView:(id)sender {
    [self removeFromSuperview];
    self.selectBlock(self.shaiziCount);
}
///减号
- (IBAction)clickSubBtn:(id)sender {
    self.shaiziCount --;
    if (self.shaiziCount <= 3 ) {
        self.shaiziCount = 3;
    }
}

- (IBAction)clickAddBtn:(id)sender {
    self.shaiziCount ++;
    if (self.shaiziCount >= 6 ) {
        self.shaiziCount = 6;
    }
}

- (IBAction)clickShakeBtn:(id)sender {
    self.shakeStatus = !self.shakeStatus;
    if (_shakeStatus) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
}
    
- (IBAction)clickSoundBtn:(id)sender {
    self.soundStatus = !self.soundStatus;
    if (self.soundStatus) {
        AudioServicesPlaySystemSound(1108);
    }
}

@end
