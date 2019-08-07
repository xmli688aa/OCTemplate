//
//  ETTestViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019  . All rights reserved.
//

#import "ETTestTableViewCellVC.h"
#import "ETWordRollView.h"
#import "ETTestView2.h"
#import "ETTestView.h"
#import "ETTestXibCell.h"
#import "ETTestCodeCell.h"

@interface ETTestTableViewCellVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ETTestTableViewCellVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self addSrcollLabel];

    [self addCodeView];
    [self addXibView];

}
- (void)addCodeView{
    ETTestView2 *xibview =[ETTestView2 loadViewWithFrame:CGRectMake(30, 100, 300, 100)] ;
    
    [self.view addSubview:xibview];
}
- (void)addXibView{
    ETTestView *codeView =[ETTestView loadXibWithFrame:CGRectMake(30, 300, 300, 200)] ;
    [self.view addSubview:codeView];

}
/**添加滚动的文字*/
- (void)addSrcollLabel{
    NSString* text=@"时间知道越是平凡的陪伴 就越长久,哈哈哈哈哈哈哈时间知道越是平凡的陪伴 就越时间知道越是平凡的陪伴 就越哈";
    CGRect frame=CGRectMake(20, 60, self.view.bounds.size.width-40, 40);
    ETWordRollView *wordView=[[ETWordRollView alloc]initWithFrame:frame title:text TextColor:[UIColor redColor]];
    [self.view addSubview:wordView];
}
#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }
    return 10;
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
