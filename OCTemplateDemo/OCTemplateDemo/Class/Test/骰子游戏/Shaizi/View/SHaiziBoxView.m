//
//  SHaiziCountView.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/21.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "SHaiziBoxView.h"
#import "ShaiziModel.h"
#import "Masonry.h"

@interface SHaiziBoxView ()<CAAnimationDelegate>

@property (strong, nonatomic) UIImageView *shaiziImageView1;
@property (strong, nonatomic) UIImageView *shaiziImageView2;
@property (strong, nonatomic) UIImageView *shaiziImageView3;
@property (strong, nonatomic) UIImageView *shaiziImageView4;
@property (strong, nonatomic) UIImageView *shaiziImageView5;
@property (strong, nonatomic) UIImageView *shaiziImageView6;
//7-10只是为了占位的
@property (strong, nonatomic) UIImageView *shaiziImageView7;
@property (strong, nonatomic) UIImageView *shaiziImageView8;
@property (strong, nonatomic) UIImageView *shaiziImageView9;
@property (strong, nonatomic) UIImageView *shaiziImageView10;

@property (strong, nonatomic) NSMutableArray *imageViews;
@property (strong, nonatomic) NSArray *myImages;
//骰子可以移动的位置
@property (strong, nonatomic) NSMutableArray *shaiziPoints;
@end

@implementation SHaiziBoxView
- (NSMutableArray *)shaiziPoints{
    if (_shaiziPoints == nil) {
        _shaiziPoints = [NSMutableArray array];
        CGPoint p1 = _shaiziImageView1.center;
        CGPoint p2 = _shaiziImageView2.center;
        CGPoint p3 = _shaiziImageView3.center;
        CGPoint p4 = _shaiziImageView4.center;
        CGPoint p5 = _shaiziImageView5.center;
        CGPoint p6 = _shaiziImageView6.center;
        CGPoint p7 = _shaiziImageView7.center;
        CGPoint p8 = _shaiziImageView8.center;
        CGPoint p9 = _shaiziImageView9.center;
        CGPoint p10 = _shaiziImageView10.center;
        [_shaiziPoints addObject:@(p1)];
        [_shaiziPoints addObject:@(p2)];
        [_shaiziPoints addObject:@(p3)];
        [_shaiziPoints addObject:@(p4)];
        [_shaiziPoints addObject:@(p5)];
        [_shaiziPoints addObject:@(p6)];
        [_shaiziPoints addObject:@(p7)];
        [_shaiziPoints addObject:@(p8)];
        [_shaiziPoints addObject:@(p9)];
        [_shaiziPoints addObject:@(p10)];
    }
    return _shaiziPoints;
}
- (NSMutableArray *)imageViews{
    if (_imageViews == nil) {
        _imageViews = [NSMutableArray array];
        [_imageViews addObject:_shaiziImageView1];
        [_imageViews addObject:_shaiziImageView2];
        [_imageViews addObject:_shaiziImageView3];
        [_imageViews addObject:_shaiziImageView4];
        [_imageViews addObject:_shaiziImageView5];
        [_imageViews addObject:_shaiziImageView6];
    }
    return _imageViews;
}
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
    _shaiziImageView7 = [[UIImageView alloc] init];
    [self addSubview:_shaiziImageView7];
    _shaiziImageView8 = [[UIImageView alloc] init];
    [self addSubview:_shaiziImageView8];
    _shaiziImageView9 = [[UIImageView alloc] init];
    [self addSubview:_shaiziImageView9];
    _shaiziImageView10 = [[UIImageView alloc] init];
    [self addSubview:_shaiziImageView10];
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
    [_shaiziImageView7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(shaiziW*2));
        make.top.equalTo(@(0));
        make.width.equalTo(@(shaiziW));
        make.height.equalTo(@(shaiziH));
    }];
    [_shaiziImageView8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(shaiziW));
        make.top.equalTo(@(shaiziH));
        make.width.equalTo(@(shaiziW));
        make.height.equalTo(@(shaiziH));
    }];
    [_shaiziImageView9 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(shaiziW*3));
        make.top.equalTo(@(shaiziH));
        make.width.equalTo(@(shaiziW));
        make.height.equalTo(@(shaiziH));
    }];
    [_shaiziImageView10 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(shaiziW*2));
        make.top.equalTo(@(shaiziH*2));
        make.width.equalTo(@(shaiziW));
        make.height.equalTo(@(shaiziH));
    }];
}

- (void)beginAnimate{
    
    //从10个位置中随机6个不重复的位置 是骰子最后的位置
    NSMutableSet *randomSet = [[NSMutableSet alloc] init];
    while ([randomSet count] < 6) {
        int r = arc4random() % [self.shaiziPoints count];
        [randomSet addObject:[self.shaiziPoints objectAtIndex:r]];
    }
    NSArray *randomArray = [randomSet allObjects];
    
    for (int i = 0; i < 6; i++) {
        //取出位置添加到最后一个随机的轨迹
        NSValue *value = randomArray[i];
        NSMutableSet *guiJiSet = [[NSMutableSet alloc] init];
        while ([guiJiSet count] < 5) {
            int r = arc4random() % [self.shaiziPoints count];
            [guiJiSet addObject:[self.shaiziPoints objectAtIndex:r]];
        }
        UIImageView *imageView = self.imageViews[i];
        NSArray *tempArray = [guiJiSet allObjects];
        NSMutableArray *guiArray = [NSMutableArray array];
        [guiArray addObjectsFromArray:tempArray];
        [guiArray addObject:value];
        [self addAnimation:imageView keyPoints:guiArray];
        
    }

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
    [animation setDuration:1];
    [animation setDelegate:self];

    //骰子的动画组合
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects: animation, spin,nil];
    animGroup.duration = 1;
    animGroup.fillMode = kCAFillModeForwards;
    animGroup.removedOnCompletion = NO;
    [animGroup setDelegate:self];
    [[shaiziImageView layer] addAnimation:animGroup forKey:nil];
    
}
- (void)setModelArray:(NSMutableArray *)modelArray{
    [_modelArray removeAllObjects];
    _modelArray = modelArray;
    if (modelArray.count>7 || modelArray.count <3) {
//        骰子个数不对
        NSLog(@"骰子个数不对");
        return;
    }
    //设置骰子个数的时候 view仍然使用上次创建的 所以隐藏和显示都设置一下
    if (_modelArray.count == 3) {
        _shaiziImageView4.hidden = YES;
        _shaiziImageView5.hidden = YES;
        _shaiziImageView6.hidden = YES;
        _shaiziImageView1.hidden = NO;
        _shaiziImageView2.hidden = NO;
        _shaiziImageView3.hidden = NO;
    }else if (_modelArray.count == 4){
        _shaiziImageView2.hidden = YES;
        _shaiziImageView4.hidden = NO;
        _shaiziImageView5.hidden = NO;
        _shaiziImageView1.hidden = NO;
        _shaiziImageView3.hidden = NO;
    }else if (_modelArray.count == 5){
        _shaiziImageView6.hidden = YES;
        _shaiziImageView1.hidden = NO;
        _shaiziImageView2.hidden = NO;
        _shaiziImageView3.hidden = NO;
        _shaiziImageView4.hidden = NO;
        _shaiziImageView5.hidden = NO;
    }else if (_modelArray.count == 6){
        _shaiziImageView1.hidden = NO;
        _shaiziImageView2.hidden = NO;
        _shaiziImageView3.hidden = NO;
        _shaiziImageView4.hidden = NO;
        _shaiziImageView5.hidden = NO;
        _shaiziImageView6.hidden = NO;
    }
    
    for (int i = 0; i < _modelArray.count; i++) {
        UIImageView *imageView = self.imageViews[i];
        ShaiziModel *model = self.modelArray[i];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",(long)model.dianshu]];
        
    }
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    for (UIImageView *imageView in self.imageViews) {
        if (!imageView.hidden) {
            [imageView stopAnimating];
        }
    }

}
@end
