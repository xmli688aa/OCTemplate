//
//  LockViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019    All rights reserved.
//

#import "ETHomeVC.h"

@interface ETHomeVC ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//@property (nonatomic, strong) ETWordRollView *wordView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@end

@implementation ETHomeVC
- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        [_dataArray addObject:@"ETTestBaseViewVC"];
        //通过tag找View
        [_dataArray addObject:@"ETViewTagVC"];
        ///gcd
        [_dataArray addObject:@"ETGCDViewController"];
        [_dataArray addObject:@"ETSetBtnImagePositionVC"];
        
        [_dataArray addObject:@"ETDragViewController"];
        [_dataArray addObject:@"ETNewsViewController"];
        [_dataArray addObject:@"ETLandscapeVC"];
        [_dataArray addObject:@"ETRunTimeVC"];
        //筛子游戏
        [_dataArray addObject:@"ShaiziHomeViewController"];
        //popView自定义(优品食堂)
        [_dataArray addObject:@"ETShiTangHomeViewController"];
        //帧动画拳皇
        [_dataArray addObject:@"ETAnimationImagesVC"];
        //数据存储
        [_dataArray addObject:@"ETSaveDataVC"];
        //文字滚动
        [_dataArray addObject:@"ETMarqueeVC"];
        //按钮自定义Badge
        [_dataArray addObject:@"ETBadgeBtnVC"];
        [_dataArray addObject:@"ETPersonDetailVCViewController"];
        //iOS常用的选择器组件
        [_dataArray addObject:@"ETBRPickTestVC"];
        //抽屉使用
        [_dataArray addObject:@"ETDragerViewController"];
        //RAC使用方法 简单介绍
        [_dataArray addObject:@"RACViewController"];
        //缓存框架 YYCache
        [_dataArray addObject:@"ETYYCacheVC"];
        //H5与原生交互
        [_dataArray addObject:@"ETWebViewController"];

        
        
        

    }
    return _dataArray;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UITableViewDataSource UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *vcName = self.dataArray[indexPath.row];
    Class class = NSClassFromString(vcName);
    UIViewController *vc = [[class alloc] init];
    if ([vc isKindOfClass:[UIViewController class]]) {
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        NSLog(@"控制器不存在");
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

@end
