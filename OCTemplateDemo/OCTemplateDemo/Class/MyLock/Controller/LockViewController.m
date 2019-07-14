//
//  LockViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "LockViewController.h"
#import "ETWordRollView.h"
@interface LockViewController ()

//@property (nonatomic, strong) ETWordRollView *wordView;

@end

@implementation LockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的门锁AA";
    self.view.backgroundColor = [UIColor greenColor];
    [self addSrcollLabel];
}
    /**添加滚动的文字*/
- (void)addSrcollLabel{
    NSString* text=@"时间知道越是平凡的陪伴 就越长久,哈哈哈哈哈哈哈时间知道越是平凡的陪伴 就越时间知道越是平凡的陪伴 就越哈";
    CGRect frame=CGRectMake(20, 110, self.view.bounds.size.width-40, 40);
    ETWordRollView *wordView=[[ETWordRollView alloc]initWithFrame:frame title:text TextColor:[UIColor redColor]];
    [self.view addSubview:wordView];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
