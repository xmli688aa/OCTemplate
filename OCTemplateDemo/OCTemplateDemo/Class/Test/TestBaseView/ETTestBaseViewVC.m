//
//  ETTestViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019  . All rights reserved.
//

#import "ETTestBaseViewVC.h"
#import "ETWordRollView.h"
#import "ETTestCodeView.h"
#import "ETTestXibView.h"
#import "ETTestXibCell.h"
#import "ETTestCodeCell.h"

@interface ETTestBaseViewVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ETTestBaseViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加滚动文字
    [self addSrcollLabel];
    //测试纯代码创建的view
    [self addCodeView];
    //特殊xib创建的view
    [self addXibView];

}
- (void)addCodeView{
    ETTestCodeView *xibview =[ETTestCodeView loadViewWithFrame:CGRectMake(30, 100, 300, 100)] ;
    
    [self.view addSubview:xibview];
}
- (void)addXibView{
    ETTestXibView *codeView =[ETTestXibView loadXibWithFrame:CGRectMake(30, 300, 300, 100)] ;

    [self.view addSubview:codeView];

}
/**添加滚动的文字*/
- (void)addSrcollLabel{
    NSString* text=@"时间知道越是平凡的陪伴 就越长久,哈哈哈哈哈哈哈时间知道越是平凡的陪伴 就越时间知道越是平凡的陪伴 就越哈";
    CGRect frame=CGRectMake(20, 60, kScreenWidth - 40, 40);
    ETWordRollView *wordView=[[ETWordRollView alloc]initWithFrame:frame title:text TextColor:[UIColor redColor]];
    wordView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:wordView];
}
#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 8;
    }
    return 8;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        //xibcell
        ETTestXibCell *cell = [ETTestXibCell xibCellWithTableView:tableView];
        cell.nameLabel.text = [NSString stringWithFormat:@"xibcell:%ld",(long)indexPath.row];
        return cell;
    }
    //codecell
    ETTestCodeCell *cell = [ETTestCodeCell cellWithTableView:tableView cellStyle:UITableViewCellStyleDefault];
    cell.textLabel.text = [NSString stringWithFormat:@"code cell:%ld",(long)indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
    
}
    
    
@end
