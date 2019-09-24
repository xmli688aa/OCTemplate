//
//  ETHomeViewController.m
//  youpinshitang_menu
//
//  Created by Ethon.Z on 2019/9/16.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ETHomeViewController.h"
#import "FunToolBar.h"
#import "HomeTableViewCell.h"
#import "MealModel.h"
#import "LeftToolBar.h"
#import "ETAddMenuVC.h"
#import "CNSubmitOrderView.h"
#import "DineModel.h"


#define SERVER 1

@interface ETShiTangHomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *logoIV;
@property (weak, nonatomic) IBOutlet UIView *addFoodView;
@property (weak, nonatomic) IBOutlet UILabel *monthLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLb;
@property (weak, nonatomic) IBOutlet UILabel *descLb;
@property (weak, nonatomic) IBOutlet FunToolBar *toolBar;
@property (weak, nonatomic) IBOutlet LeftToolBar *leftToolBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//tableView 真正需要使用到的数据源
@property (strong, nonatomic) NSArray *dataArray;

@property (weak, nonatomic) IBOutlet UILabel *alertLabel;

@property (nonatomic, strong) CNSubmitOrderView *orderView;

///当前的用餐模型
@property (strong, nonatomic) NSArray <DineModel *> *dineModelsArray;

@property (strong, nonatomic) DineModel *currentDineModel;

@end

@implementation ETShiTangHomeViewController

#pragma mark - lifiCycle
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    //网络获取数据 赋值给_dineModelsArray
    [DineModel getMenuDataFromNetwork:^(NSArray * _Nonnull array) {
        self.dineModelsArray = array;
        self.currentDineModel = self.dineModelsArray[0];
        [self.tableView reloadData];
    }];
  

    self.toolBar.clickToolBarBlcok = ^(NSInteger index) {
        self.currentDineModel = self.dineModelsArray[index];
        //更新侧边栏
        [self.leftToolBar updateDinnerbtnWithIndex:index];

    };
    self.leftToolBar.clickLeftBarBlock = ^(LeftToolBarType type) {
        //更新数据源 刷新表格
        [self leftBarupdateDataSourceAndReloadTabelViewWithType:type];
    };

    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

#ifdef SERVER
#else
//    [_orderView remove];
#endif
}

- (void)initUI{
    self.tableView.estimatedRowHeight = 105;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"HomeTableViewCell"];
    //明天
    NSInteger month = [[NSCalendar currentCalendar] component:NSCalendarUnitMonth fromDate:[NSDate dateWithTimeIntervalSinceNow:60*60*24]];
    NSInteger day = [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[NSDate dateWithTimeIntervalSinceNow:60*60*24]];
    self.monthLabel.text = [NSString stringWithFormat:@"%ld",month];
    self.dayLabel.text = [NSString stringWithFormat:@"%ld",day];
    
#ifdef SERVER
#else
    [self.addFoodView removeFromSuperview];
    self.logoIV.image = [UIImage imageNamed:@"icon biaoti"];
    self.tipLb.text = @"明日特供：午餐盐焗鸡，前300份，先到先得。";
    self.descLb.text = @"为了更好的订餐服务，订单截止09-14日20：00前有效。";
#endif
}
#pragma mark - 更新数据源 刷新表格

- (void)leftBarupdateDataSourceAndReloadTabelViewWithType:(LeftToolBarType )type{
    switch (type) {
        case TeGong:
        self.dataArray = self.currentDineModel.tegongArray;
        break;
        case Dinner:
        self.dataArray = self.currentDineModel.dinerArray;;
        break;
        case LingShi:
        self.dataArray = self.currentDineModel.lingshiArray;
        break;
        case Drink:
        self.dataArray = self.currentDineModel.drinkArray;
        break;
        default:
        break;
    }
    [self.tableView reloadData];
}
#pragma mark - 点击消息
- (IBAction)clickNoticeBtn:(id)sender {
    
}
#pragma mark - 添加菜品
- (IBAction)addCaiPin:(id)sender {
    ETAddMenuVC *addMenuVC = [ETAddMenuVC new];
    [self.navigationController pushViewController:addMenuVC animated:YES];
}
#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCell"];
    if (self.dataArray.count >0) {
        MealModel *model = self.dataArray[indexPath.row];
        cell.mealModel = model;
    }
    __weak typeof(self) weakSelf = self;
#ifdef SERVER
    
#else
    cell.addBlock = ^{
        [weakSelf.orderView show];
    };
#endif
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 45)];
    UILabel *sectionTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 240, view.height)];
    //显示的标题 跟leftToolBar.selectTitle一致
    sectionTitleLabel.text = self.leftToolBar.selectTitle;
    sectionTitleLabel.textColor = [UIColor lightGrayColor];
    sectionTitleLabel.backgroundColor = [UIColor whiteColor];
    [view addSubview:sectionTitleLabel];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 48;
}

- (CNSubmitOrderView *)orderView {
    if (!_orderView) {
        _orderView = [CNSubmitOrderView orderView];
    }
    return _orderView;
}
@end
