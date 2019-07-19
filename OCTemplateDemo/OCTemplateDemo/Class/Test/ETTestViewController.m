//
//  ETTestViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETTestViewController.h"
#import "ETWordRollView.h"
#import "ETTestView2.h"
#import "ETTestView.h"
#import "ETTestCell.h"

@interface ETTestViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ETTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.dataSource = self;
    _tableView.delegate = self;
//    [self addSrcollLabel];
//    [self addTestView];
}
- (void)addTestView{
    ETTestView2 *view =[ETTestView2 loadViewWithFrame:CGRectMake(30, 100, 300, 300)] ;
//    ETTestView *view =[ETTestView loadXibWithFrame:CGRectMake(30, 100, 300, 300)] ;
    [self.view addSubview:view];
}
/**添加滚动的文字*/
- (void)addSrcollLabel{
    NSString* text=@"时间知道越是平凡的陪伴 就越长久,哈哈哈哈哈哈哈时间知道越是平凡的陪伴 就越时间知道越是平凡的陪伴 就越哈";
    CGRect frame=CGRectMake(20, 110, self.view.bounds.size.width-40, 40);
    ETWordRollView *wordView=[[ETWordRollView alloc]initWithFrame:frame title:text TextColor:[UIColor redColor]];
    [self.view addSubview:wordView];
}
#pragma mark - UITableViewDataSource, UITableViewDelegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ETTestCell *cell = [ETTestCell xibCellWithTableView:tableView];
    cell.nameLabel.text = [NSString stringWithFormat:@"hahha:%ld",(long)indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
    
}
    
    
@end
