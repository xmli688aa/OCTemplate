//
//  LockViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019    All rights reserved.
//

#import "ETHomeVC.h"
#import "ETHomeModel.h"

@interface ETHomeVC ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation ETHomeVC
- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        
        [_dataArray addObject:[ETHomeModel controllerName:@"ETGuidePagesViewController" title:@"新版本引导页"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETLoadingVC" title:@"自定义loading框"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETTestBaseViewVC" title:@"测试控制器"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETViewTagVC" title:@"通过tag找View"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETGCDViewController" title:@"gcd的使用"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETSetBtnImagePositionVC" title:@"按钮内部文字和图片位置调整"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETDragViewController" title:@"view拖拽/drawRect绘制view/设置光波效果"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETNewsViewController" title:@"MVVM简单使用"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETLandscapeVC" title:@"指定控制器横屏"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETRunTimeVC" title:@"runtime简单使用"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ShaiziHomeViewController" title:@"筛子游戏"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETShiTangHomeViewController" title:@"优品食堂-popview自定义"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETAnimationImagesVC" title:@"帧动画-拳皇"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETSaveDataVC" title:@"本地数据存储"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETMarqueeVC" title:@"文字上下滚动"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETBadgeBtnVC" title:@"自定义按钮上标badge"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETPersonDetailVCViewController" title:@"上下滑导航栏显示/隐藏"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETBRPickTestVC" title:@"选择器组件(日期/地点/自定义)"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETDragerViewController" title:@"抽屉模式"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"RACViewController" title:@"RAC使用方法 简单介绍"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETYYCacheVC" title:@"缓存框架 YYCache"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETWebViewController" title:@"H5与原生交互-webView"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETWKWebVC" title:@"H5与原生交互-WKWebView"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETQRCodeViewController" title:@"二维码生成和识别"]];
        [_dataArray addObject:[ETHomeModel controllerName:@"ETGesturePwdVC" title:@"手势密码 设置/登录/修改"]];


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
    ETHomeModel *model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.title;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ETHomeModel *model = self.dataArray[indexPath.row];

    NSString *vcName = model.name;
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
