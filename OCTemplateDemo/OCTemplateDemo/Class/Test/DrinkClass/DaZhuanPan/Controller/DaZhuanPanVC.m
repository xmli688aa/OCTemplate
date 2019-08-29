//
//  DaZhuanPanVC.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/22.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "DaZhuanPanVC.h"
#import "ZhuanPanRulesPopView.h"
#import "ZhuanPanModel.h"
#import "ZhuanPanResultView.h"
#import "ETManager.h"

@interface DaZhuanPanVC ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *centerView;
//转盘正在转动
@property (assign, nonatomic) BOOL  isAnimation;
//转盘规则
@property (strong, nonatomic) NSMutableArray *rulesDataArray;
//自定义转盘规则
@property (strong, nonatomic) NSMutableArray *customRulesDataArray;
//生成的随机数0-11共12个
@property (assign, nonatomic) NSInteger randomNum;



@end

@implementation DaZhuanPanVC
- (NSMutableArray *)rulesDataArray{
    if (_rulesDataArray == nil) {
        _rulesDataArray = [NSMutableArray array];
    }
    return _rulesDataArray;
}
- (NSMutableArray *)customRulesDataArray{
    if (_customRulesDataArray == nil) {
        _customRulesDataArray = [NSMutableArray array];
    }
    return _customRulesDataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationRightItemImage:@"wode"];

    self.rulesDataArray = [ETManager getZhuanPanRulesModelsArray];
    self.customRulesDataArray =[ETManager getCustomZhuanPanRulesModelsArray];
}

#pragma mark - 开始转
- (IBAction)beginGo:(id)sender {
    //判断是否正在转
    if (_isAnimation) {
        return;
    }
    _isAnimation = YES;
    
    //一共12个等级(0 -11)
    NSInteger temp = arc4random_uniform(12);
    _randomNum = temp;
    NSLog(@"%ld",_randomNum);
    CGFloat circleAngle = _randomNum *(360/12) + (360/12)/2;
    //设置转圈的圈数
    NSInteger circleNum = 6;
    CGFloat perAngle = M_PI/180.0;
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:circleAngle * perAngle + 360 * perAngle * circleNum];
    rotationAnimation.duration = 3.0f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.delegate = self;
    //由快变慢
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    rotationAnimation.fillMode = kCAFillModeForwards;
    rotationAnimation.removedOnCompletion = NO;
    [self.centerView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}
#pragma mark 动画结束
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    _isAnimation = NO;
    
//    //选中的下标 = 随机数+1
//    NSInteger selectIndex = _randomNum + 1;
//    if (selectIndex == 12) {
//        selectIndex = 0;
//    }
//    ZhuanPanModel *model = self.customRulesDataArray[selectIndex];
//    NSLog(@"selectIndex:%ld %@",selectIndex,model.content)
//    [ZhuanPanResultView showResultViewWithContent:model.content];
}
#pragma mark - 显示转盘规则
- (IBAction)clickHelpBtn:(id)sender {
    [ZhuanPanRulesPopView showRulesViewWithDataArray:self.rulesDataArray  isSet:NO selectBlcok:^(NSMutableArray * _Nonnull dataArray) {
        
    }];
    
}
#pragma mark - 设置转盘规则
-(void)clickSet{
    [ZhuanPanRulesPopView showRulesViewWithDataArray:self.customRulesDataArray isSet:YES selectBlcok:^(NSMutableArray * _Nonnull dataArray) {
        self.customRulesDataArray = dataArray;
    }];
}

@end
