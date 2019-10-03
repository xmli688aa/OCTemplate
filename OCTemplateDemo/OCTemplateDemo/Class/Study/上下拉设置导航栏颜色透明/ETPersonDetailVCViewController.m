//
//  ETPersonDetailVCViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/10/3.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETPersonDetailVCViewController.h"
#import "UIImage+ETColor.h"

@interface ETPersonDetailVCViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstr;

@property (nonatomic, weak) UILabel *titleV;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageV;

@end

@implementation ETPersonDetailVCViewController

#define oriOffsetY -244
#define oriH 200

- (void)viewDidLoad {
    [super viewDidLoad];

    self.iconImageV.layer.cornerRadius = 50;
    self.iconImageV.layer.masksToBounds = YES;

    self.tableView.dataSource  = self;
    self.tableView.delegate = self;

    //1.凡是在导航控制器下的scrollView,会自动设置一个上面的内边距64
    //self.tableView.contentInset =  {64, 0, 0, 0};

    //如果不让它自动设置内边距,可以通过以下方法取消
    self.automaticallyAdjustsScrollViewInsets = NO;

    //2.隐藏导航控制器的导航条
    //self.navigationController.navigationBar.hidden = YES;

    //3.设置导航条的透明度
    //导航条以及它里面的子控件设置透明度是没有效果的.
    self.navigationController.navigationBar.alpha = 0;

    //4.设置导航条的背景图片
    //设置设置导航条的背景图片必须得要使用UIBarMetricsDefault
    //[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBg"] forBarMetrics:UIBarMetricsDefault];

    //如果说导航条的背景图片设置的是nil的话,会自动帮你创建一个白色的半透明图片,设置导航条的背景图片
    //[self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];

    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];

    //设置导航条下部的阴影图片.
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];


    //当设置内边距时会自动调用scrollViewDidScroll:
    self.tableView.contentInset = UIEdgeInsetsMake(244, 0, 0, 0);

    UILabel *titleV = [[UILabel alloc] init];
    titleV.text = @"个人详情页";
    [titleV sizeToFit];
    titleV.textColor = [UIColor colorWithWhite:0 alpha:0];

    self.navigationItem.titleView = titleV;

    self.titleV = titleV;
        
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //偏移量
    CGFloat offset = scrollView.contentOffset.y - oriOffsetY;
    NSLog(@" offset = %f",offset);
    
    //原始的高度-偏移量
    CGFloat h = oriH - offset;
    if (h <= 64) {
        h = 64;
    }
    //更新高度
    self.heightConstr.constant = h;
    
    
    //动态求出alpha
    //求变化的值.
    //最大值的方法
    //1.最大值为多少 (最大为1)
    //2.什么情况下最大. (当offset 等于 136.0 最大)
    //  当offset 等于 136.0的时候 alpha = 1
    //  当变化的值 等于 固定值 的时候 为最大
    CGFloat alpha = offset * 1 / 136.0;
    
    if (alpha >= 1) {
        alpha = 0.99;
    }
    //根据一个颜色,生成一张图片
    UIColor *color = [UIColor colorWithWhite:1.0 alpha:alpha];
    UIImage *image = [UIImage imageWithColor:color];
    
    //设置背景图片
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    //设置头部标题的透明度
    //self.titleV.textColor = [UIColor colorWithWhite:0 alpha:alpha];
    
    UILabel *titleV = (UILabel *)self.navigationItem.titleView;
    titleV.textColor = [UIColor colorWithWhite:0 alpha:alpha];
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"CELLID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.textLabel.text = @"xmg";
    
    
    return cell;
}





@end
