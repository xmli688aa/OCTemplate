//
//  CNSubmitOrderView.m
//  Server
//
//  Created by cean.q on 2019/9/19.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "CNSubmitOrderView.h"
#import "CNSelectOrderTCell.h"
#define kCNSelectOrderTCell  @"CNSelectOrderTCell"
#import "CNOrderScoreView.h"

@interface CNSubmitOrderView () <UITableViewDelegate, UITableViewDataSource, CNOrderScoreViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSArray *titleArr;
@property (nonatomic, strong) CNOrderScoreView *scoreView;
@end

@implementation CNSubmitOrderView

+ (instancetype)orderView  {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CNSubmitOrderView *orderView = [[CNSubmitOrderView alloc] initWithFrame:window.bounds];
    [orderView.tableView registerNib:[UINib nibWithNibName:kCNSelectOrderTCell bundle:nil] forCellReuseIdentifier:kCNSelectOrderTCell];
    orderView.titleArr = @[@"早餐", @"午餐", @"晚餐",  @"宵夜"];
    return orderView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titleArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CNSelectOrderTCell *cell = [tableView dequeueReusableCellWithIdentifier:kCNSelectOrderTCell forIndexPath:indexPath];
    cell.isOrder = NO;
    [cell hidOrderBtn:YES];
    __weak typeof(self) weakSelf = self;
    cell.addBlock = ^(MealModel * _Nonnull model) {
        [weakSelf.scoreView addScore:3 bill:1];
    };
    cell.subtractBlock = ^(MealModel * _Nonnull model) {
        // 判断当然还有改模型, 在减
        [weakSelf.scoreView subtractScore:3 bill:1];
    };
//    MealModel *model = self.models[indexPath.section][indexPath.row];
//    [cell setMealModel:model];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.titleArr[section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)show {
    [self.scoreView show];
    [self.scoreView addScore:3 bill:1];
}

- (void)remove {
    [self.scoreView removeFromSuperview];
}

#pragma mark - CNOrderScoreViewDelegate

- (void)up:(CNOrderScoreView *)scoreView {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window insertSubview:self belowSubview:scoreView];
    [self.tableView reloadData];
}

- (void)down:(CNOrderScoreView *)scoreView {
    [self removeFromSuperview];
}

- (void)submit:(CNOrderScoreView *)scoreView {
    [self removeFromSuperview];
}

- (CNOrderScoreView *)scoreView {
    if (!_scoreView) {
        _scoreView = [CNOrderScoreView scoreView];
        _scoreView.delegate = self;
    }
    return _scoreView;
}
@end
