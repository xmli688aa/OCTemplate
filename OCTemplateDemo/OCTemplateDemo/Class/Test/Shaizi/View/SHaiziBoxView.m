//
//  SHaiziCountView.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/21.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "SHaiziBoxView.h"
#import "ShaiziModel.h"

@interface SHaiziBoxView ()<CAAnimationDelegate>

@property (strong, nonatomic) UIImageView *shaiziImageView1;
@property (strong, nonatomic) UIImageView *shaiziImageView2;
@property (strong, nonatomic) UIImageView *shaiziImageView3;
@property (strong, nonatomic) UIImageView *shaiziImageView4;
@property (strong, nonatomic) UIImageView *shaiziImageView5;
@property (strong, nonatomic) UIImageView *shaiziImageView6;


@property (strong, nonatomic) NSArray *myImages;
@end

@implementation SHaiziBoxView

- (instancetype)init{
    if (self = [super init]) {
        [super awakeFromNib];

    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _modelArray = [NSMutableArray array];
        //添加子视图
        [self setUI];
    }
    return self;
    
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        _modelArray = [NSMutableArray array];
    }
    return self;
}
- (NSArray *)myImages{
    if (_myImages == nil) {
        _myImages = [NSArray arrayWithObjects:
                     [UIImage imageNamed:@"1"],
                     [UIImage imageNamed:@"2"],
                     [UIImage imageNamed:@"3"],
                     [UIImage imageNamed:@"4"],
                     [UIImage imageNamed:@"5"],
                     [UIImage imageNamed:@"6"],nil];
    }
    return _myImages;
}

- (void)setUI{
 
    _shaiziImageView1 = [[UIImageView alloc] init];
    [self addSubview:_shaiziImageView1];
    _shaiziImageView2 = [[UIImageView alloc] init];
    [self addSubview:_shaiziImageView2];
    _shaiziImageView3 = [[UIImageView alloc] init];
    [self addSubview:_shaiziImageView3];
    _shaiziImageView4 = [[UIImageView alloc] init];
    [self addSubview:_shaiziImageView4];
    _shaiziImageView5 = [[UIImageView alloc] init];
    [self addSubview:_shaiziImageView5];
    _shaiziImageView6 = [[UIImageView alloc] init];
    [self addSubview:_shaiziImageView6];


}
- (void)layoutSubviews {
    [super layoutSubviews];
    //骰子宽高
    CGFloat shaiziW = self.width / 4;
    CGFloat shaiziH = self.height / 3;
    [_shaiziImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(shaiziW));
        make.top.equalTo(self);
        make.width.equalTo(@(shaiziW));
        make.height.equalTo(@(shaiziH));
    }];
    [_shaiziImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(shaiziW*2));
        make.top.equalTo(@(shaiziH));
        make.width.equalTo(@(shaiziW));
        make.height.equalTo(@(shaiziH));
    }];
    [_shaiziImageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(shaiziW*3));
        make.top.equalTo(@(shaiziH*2));
        make.width.equalTo(@(shaiziW));
        make.height.equalTo(@(shaiziH));
    }];
    [_shaiziImageView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(shaiziW*3));
        make.top.equalTo(@(0));
        make.width.equalTo(@(shaiziW));
        make.height.equalTo(@(shaiziH));
    }];
    [_shaiziImageView5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(shaiziW));
        make.top.equalTo(@(shaiziH*2));
        make.width.equalTo(@(shaiziW));
        make.height.equalTo(@(shaiziH));
    }];
    [_shaiziImageView6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.top.equalTo(@(shaiziH));
        make.width.equalTo(@(shaiziW));
        make.height.equalTo(@(shaiziH));
    }];
}

- (void)beginAnimate{
    //6个骰子的位置轨迹
    CGPoint p1 = _shaiziImageView1.center;
    CGPoint p2 = _shaiziImageView2.center;
    CGPoint p3 = _shaiziImageView3.center;
    CGPoint p4 = _shaiziImageView4.center;
    CGPoint p5 = _shaiziImageView5.center;
    CGPoint p6 = _shaiziImageView6.center;
    NSArray *keypoints1 = [[NSArray alloc] initWithObjects:
                         [NSValue valueWithCGPoint:p1],
                         [NSValue valueWithCGPoint:p5],
                         [NSValue valueWithCGPoint:p4],
                         [NSValue valueWithCGPoint:p2],
                         [NSValue valueWithCGPoint:p3],
                         [NSValue valueWithCGPoint:p4],
                         [NSValue valueWithCGPoint:p5],
                         [NSValue valueWithCGPoint:p6],
                         [NSValue valueWithCGPoint:p1],
                         nil];
    NSArray *keypoints2 = [[NSArray alloc] initWithObjects:
                           [NSValue valueWithCGPoint:p2],
                           [NSValue valueWithCGPoint:p5],
                           [NSValue valueWithCGPoint:p2],
                           [NSValue valueWithCGPoint:p1],
                           [NSValue valueWithCGPoint:p4],
                           [NSValue valueWithCGPoint:p6],
                           [NSValue valueWithCGPoint:p2],
                           nil];
    NSArray *keypoints3 = [[NSArray alloc] initWithObjects:
                           [NSValue valueWithCGPoint:p3],
                           [NSValue valueWithCGPoint:p5],
                           [NSValue valueWithCGPoint:p3],
                           [NSValue valueWithCGPoint:p1],
                           [NSValue valueWithCGPoint:p2],
                           [NSValue valueWithCGPoint:p5],
                           [NSValue valueWithCGPoint:p4],

                           [NSValue valueWithCGPoint:p6],
                           [NSValue valueWithCGPoint:p3],

                           nil];
    NSArray *keypoints4 = [[NSArray alloc] initWithObjects:
                           [NSValue valueWithCGPoint:p4],
                           [NSValue valueWithCGPoint:p4],
                           [NSValue valueWithCGPoint:p5],
                           [NSValue valueWithCGPoint:p3],
                           [NSValue valueWithCGPoint:p1],
                           [NSValue valueWithCGPoint:p2],
                           [NSValue valueWithCGPoint:p6],
                           [NSValue valueWithCGPoint:p5],
                           [NSValue valueWithCGPoint:p3],
                           [NSValue valueWithCGPoint:p4],
                           nil];
    NSArray *keypoints5 = [[NSArray alloc] initWithObjects:
                           [NSValue valueWithCGPoint:p5],
                           [NSValue valueWithCGPoint:p3],
                           [NSValue valueWithCGPoint:p4],
                           [NSValue valueWithCGPoint:p5],
                           [NSValue valueWithCGPoint:p1],
                           [NSValue valueWithCGPoint:p4],
                           [NSValue valueWithCGPoint:p6],
                           [NSValue valueWithCGPoint:p1],
                           [NSValue valueWithCGPoint:p2],
                           [NSValue valueWithCGPoint:p6],
                           [NSValue valueWithCGPoint:p5],

                           nil];
    NSArray *keypoints6 = [[NSArray alloc] initWithObjects:
                           [NSValue valueWithCGPoint:p6],
                           [NSValue valueWithCGPoint:p4],
                           [NSValue valueWithCGPoint:p5],
                           [NSValue valueWithCGPoint:p1],
                           [NSValue valueWithCGPoint:p6],
                           [NSValue valueWithCGPoint:p3],
                           [NSValue valueWithCGPoint:p4],
                           [NSValue valueWithCGPoint:p2],
                           [NSValue valueWithCGPoint:p3],
                           [NSValue valueWithCGPoint:p6],

                           nil];
    
    [self addAnimation:_shaiziImageView1 keyPoints:keypoints1];
    [self addAnimation:_shaiziImageView2 keyPoints:keypoints2];
    [self addAnimation:_shaiziImageView3 keyPoints:keypoints3];
    [self addAnimation:_shaiziImageView4 keyPoints:keypoints4];
    [self addAnimation:_shaiziImageView5 keyPoints:keypoints5];
    [self addAnimation:_shaiziImageView6 keyPoints:keypoints6];

}
- (void)addAnimation:(UIImageView *)shaiziImageView keyPoints:(NSArray *)keyPoints{
    //骰子图片来回更换
    shaiziImageView.animationImages = self.myImages;
    shaiziImageView.animationDuration = 1;
    [shaiziImageView startAnimating];
    //设置动画
    CABasicAnimation *spin = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [spin setToValue:[NSNumber numberWithFloat:M_PI * 10.0 * 0]];
    [spin setDuration:1.0];

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [animation setValues:keyPoints];
    [animation setDuration:2.0];
    [animation setDelegate:self];
    [shaiziImageView.layer setPosition:shaiziImageView.center];

    //骰子的动画组合
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects: animation, spin,nil];
    animGroup.duration = 2.0;
    animGroup.fillMode = kCAFillModeForwards;
    animGroup.removedOnCompletion = NO;
    [animGroup setDelegate:self];
    [[shaiziImageView layer] addAnimation:animGroup forKey:@"1positionfir"];
    
}
- (void)setModelArray:(NSMutableArray *)modelArray{
    _modelArray = modelArray;
    if (modelArray.count>7 || modelArray.count <3) {
//        骰子个数不对
        NSLog(@"骰子个数不对");
        return;
    }
    if (_modelArray.count == 3) {
        _shaiziImageView4.hidden = YES;
        _shaiziImageView5.hidden = YES;
        _shaiziImageView6.hidden = YES;
    }else if (_modelArray.count == 4){
        _shaiziImageView2.hidden = YES;
        _shaiziImageView6.hidden = YES;
    }else if (_modelArray.count == 5){
        _shaiziImageView6.hidden = YES;
    }
    
    NSMutableArray *imageArray = [NSMutableArray array];
    for (UIView  * view1 in self.subviews) {
            if ([view1 isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView = (UIImageView *)view1;
                if (!imageView.hidden) {
                    [imageArray addObject:imageView];
                }
            }
    }
    for (int i = 0; i < _modelArray.count; i++) {
        UIImageView *imageView = imageArray[i];
        ShaiziModel *model = self.modelArray[i];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",(long)model.dianshu]];
        
    }
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    for (UIView  * view1 in self.subviews) {
        if ([view1 isKindOfClass:[UIImageView class]]) {
            UIImageView *imageView = (UIImageView *)view1;
            if (!imageView.hidden) {
                [imageView stopAnimating];
            }
        }
        
        
    }
}
@end
