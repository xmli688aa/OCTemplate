
//
//  ETBadgeBtnVC.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/9/30.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETBadgeBtnVC.h"
#import "ETBadgeBtn.h"
@interface ETBadgeBtnVC ()
@property (nonatomic, strong) ETBadgeBtn *badgeBtn;
@property (weak, nonatomic) IBOutlet ETBadgeBtn *xibBadgeBtn;
@end

@implementation ETBadgeBtnVC

- (void)viewDidLoad {
    [super viewDidLoad];

    ETBadgeBtn *btn = [[ETBadgeBtn alloc] initWithFrame:CGRectMake(10, 100, 80, 40)];
    [btn setTitle:@"哈哈" forState:UIControlStateNormal];
    [btn setBackgroundColor:UIColor.blueColor];
    [self.view addSubview:btn];
    [btn setItemBadgeNumber:2];
    _badgeBtn = btn;
    
    [_xibBadgeBtn showBadge];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_badgeBtn hideBadge];
}




@end
