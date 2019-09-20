
//
//  ZhuanPanRulesPopView.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/22.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ZhuanPanRulesPopView.h"
#import "ZhuanPanCell.h"
#import "ZhuanPanModel.h"
#import "ETManager.h"
typedef void(^SlectBlock)(NSMutableArray *dataArray);

@interface ZhuanPanRulesPopView ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *dataArray;
@property (assign, nonatomic) BOOL isSet;
@property (copy, nonatomic) SlectBlock selectBlock;

@end

@implementation ZhuanPanRulesPopView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.dataArray = [NSMutableArray array];
}
+ (void)showRulesViewWithDataArray:(NSMutableArray *)dataArray isSet:(BOOL)isSet selectBlcok:(void(^)(NSMutableArray *dataArray))selectBlock{
    
    ZhuanPanRulesPopView *popView = [[NSBundle mainBundle] loadNibNamed:@"ZhuanPanRulesPopView" owner:nil options:nil].firstObject;
    popView.frame = [UIScreen mainScreen].bounds;
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:popView];
    popView.dataArray = dataArray;
    popView.isSet = isSet;
    popView.selectBlock = selectBlock;
    popView.tableView.delegate = popView;
    popView.tableView.dataSource = popView;
    [popView.tableView registerNib:[UINib nibWithNibName:@"ZhuanPanCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ZhuanPanCell"];
    [popView.tableView reloadData];
}

- (IBAction)close:(id)sender {
    [self removeFromSuperview];
    //保存dataArray
    if (self.isSet) {
        self.selectBlock(self.dataArray);
        [ETManager saveCustomZhuanPanModelArray:self.dataArray];
    }

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}
#pragma mark - UITableViewDataSource, UITableViewDelegate

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ZhuanPanCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZhuanPanCell" forIndexPath:indexPath];
    ZhuanPanModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    cell.isSet = self.isSet;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 36;
}


@end
