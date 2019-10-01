

//
//  ETMarqueeVC.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/10/1.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETMarqueeVC.h"
#import "ETMarqueeView.h"
#import "ETToteModel.h"

@interface ETMarqueeVC ()

@end

@implementation ETMarqueeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    ETMarqueeView *marqueeView = [[ETMarqueeView alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    [self.view addSubview:marqueeView];
    
    marqueeView.backgroundColor = [UIColor yellowColor];
    marqueeView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2.f, [UIScreen mainScreen].bounds.size.height/2.f);
//    marqueeView.marqueeTitleArray = @[@"新闻",
//                                      @"游戏",
//                                      @"娱乐"];
    ETToteModel *model = [[ETToteModel alloc] init];
    model.gameType = @"AG";
    model.money = 79427972979687792;

    ETToteModel *model1 = [[ETToteModel alloc] init];
    model1.gameType = @"BB";
    model1.money = 79427972979687792;

    ETToteModel *model2 = [[ETToteModel alloc] init];
    model2.gameType = @"PP";
    model2.money = 79427972979687792;

    ETToteModel *model3 = [[ETToteModel alloc] init];
    model3.gameType = @"PT";
    model3.money = 79427972979687792;

    
    
    
    marqueeView.marqueeContentArray = @[model,model1,model3];
    [marqueeView start];
    marqueeView.block = ^(NSInteger index) {
        NSLog(@"点击了第%ld组数据",index);
    };


}




@end
