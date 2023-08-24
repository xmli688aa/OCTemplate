//
//  ETDelegateVC.m
//  OCTemplateDemo
//
//  Created by zwz on 2023/6/18.
//  Copyright © 2023 zhao. All rights reserved.
//

#import "ETDelegateVC.h"
#import "ETDelegateManager.h"
@interface ETDelegateVC ()<ETDelegateManagerDelegate>

@property (strong ,nonatomic) ETDelegateManager *manger;

@end

@implementation ETDelegateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _manger = [[ETDelegateManager alloc] init];
    _manger.delegate = self;
    
}
- (IBAction)clickBtn:(id)sender {
 
    [_manger test2];
}


#pragma mark - ETDelegateManagerDelegate
- (void)didClickBtn:(NSInteger)index{
    NSLog(@"%ld",index);
    
}

- (void)successBlock:(void (^)(void))successBlock{
    //执行manager的block 实现代理回调 告诉manager进行下一步的操作
    successBlock();
}


@end
