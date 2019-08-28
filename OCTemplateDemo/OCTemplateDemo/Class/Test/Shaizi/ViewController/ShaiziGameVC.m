//
//  ShaiziGameVC.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/21.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ShaiziGameVC.h"
#import "SHaiziBoxView.h"
#import "ShaiziModel.h"
#import "ShaiziSetPopView.h"
#import "ShaiziRulesPopView.h"
#import <AudioToolbox/AudioToolbox.h>
#import "ETManager.h"
@interface ShaiziGameVC ()
@property (weak, nonatomic) IBOutlet UIImageView *gaiziImageView;

///内容视图 用来设置里面的Frame
@property (weak, nonatomic) IBOutlet UIView *contentView;
///放筛子的view
@property (strong, nonatomic) SHaiziBoxView *shaiziBoxView;

///筛子个数(3 4 5 6)
@property (assign, nonatomic) NSInteger shaiziCount;

///总点数label
@property (weak, nonatomic) IBOutlet UILabel *totalCountLabel;
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation ShaiziGameVC
- (SHaiziBoxView *)shaiziBoxView{
    if (_shaiziBoxView == nil) {
        _shaiziBoxView = [[SHaiziBoxView alloc] init];
    }
    return _shaiziBoxView;
}

-(void)viewDidAppear:(BOOL) animated{
    [super viewDidAppear:animated];
    [self.view becomeFirstResponder];
}
-(void)viewDidDisappear:(BOOL) animated{
    [super viewDidDisappear:animated];
    [self.view resignFirstResponder];
    [self invalidateTimer];
}
- (IBAction)clickSetBtn:(id)sender {
    [ShaiziSetPopView showSetViewWithGameType:self.gameType originCount:self.shaiziCount selectBlcok:^(NSInteger shaiziCount) {
        NSLog(@"选择的个数:%ld",shaiziCount);
        self.shaiziCount = shaiziCount;
    }];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    _gaiziImageView.hidden = NO;
    [self initUIAndData];
    [self initShaiziModelArray];
}
///初始化筛子模型
- (void)initShaiziModelArray{
    NSMutableArray *modelArray = [ETManager createDataArrayWithShaiziCount:self.shaiziCount];
    if (self.shaiziBoxView.modelArray.count >0) {
        [self.shaiziBoxView.modelArray removeAllObjects];
    }
    self.shaiziBoxView.modelArray = modelArray;

}
- (void)calculateTotalCount{
    NSInteger totalCount = 0;
    for (ShaiziModel *model in self.shaiziBoxView.modelArray) {
        NSInteger dianshu = model.dianshu;
        totalCount += dianshu;
    }
    self.totalCountLabel.text = [NSString stringWithFormat:@"%ld",(long)totalCount];
    
}
- (void)initUIAndData{
    [self.contentView insertSubview:self.shaiziBoxView atIndex:1];
    [self.shaiziBoxView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(192));
        make.height.equalTo(@(156));
        make.center.equalTo(self.contentView);
    }];
    switch (_gameType) {
        case Game_789:
            self.shaiziCount = 3;
            break;
        case Game_BigOrSmall:
            self.shaiziCount = 6;
            break;
        case Game_Dahua:
            self.shaiziCount = 5;
            break;
        default:
            break;
    }
}
//帮助❓按钮
- (IBAction)clickBangzhuBtn:(id)sender {
    NSString *rules = [ETManager getRulesWithGameType:self.gameType];
    [ShaiziRulesPopView showRulesViewWithContent:rules];
}
#pragma mark - 摇晃时间开始
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (motion == UIEventSubtypeMotionShake) {
        //开始摇晃了
        NSLog(@"开始摇晃了");
        _gaiziImageView.hidden = NO;
        self.totalCountLabel.text = @"0";
        [self initShaiziModelArray];
        [ETManager playShaiziSoundAndShake];
        if (_timer == nil) {
            _timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(contentViewAnimate) userInfo:nil repeats:YES];
        }
    }
}
- (void)contentViewAnimate{
    CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    shake.fromValue = [NSNumber numberWithFloat:-15];
    shake.toValue = [NSNumber numberWithFloat:15];
    shake.duration = 0.1;
    shake.autoreverses = YES;
    [self.contentView.layer addAnimation:shake forKey:@"shakeAnimation"];

}
#pragma mark - 摇晃结束
//取消摇晃
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"摇晃取消了");
    [self dealMotionEvent];
}

//摇晃结束
-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (motion==UIEventSubtypeMotionShake) {
        NSLog(@"摇晃结束了");
        [self dealMotionEvent];
    }
}
//处理摇晃结束事件
- (void)dealMotionEvent{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self invalidateTimer];
        self.gaiziImageView.hidden = YES;
        [self.shaiziBoxView beginAnimate];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self calculateTotalCount];
            
        });
    });
   
}
- (void)invalidateTimer{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

@end
