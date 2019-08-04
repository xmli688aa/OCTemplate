//
//  LockViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "LockViewController.h"
#import "ETTestViewController.h"
#import "ETHTTPManager.h"
#import "ETNewsViewController.h"
#import "UIImage+ResszingImage.h"
@interface LockViewController ()

//@property (nonatomic, strong) ETWordRollView *wordView;

@end

@implementation LockViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"phone"] = @"13211111111";
    params[@"callback"] = @"phone";
    params[@"cmd"] = @"1059";
    NSString *url = @"user";
//    NSString *url = @"callback";
    ETHTTPManager *manager = [ETHTTPManager manager] ;
    manager.method = KYHTTPMethodGET;
//    [manager sendRequestWithUrl:url parameters:params callBack:^(id  _Nullable response, NSError * _Nullable error) {
//        NSLog(@"%@",response);
//    }];
//
//    for (int i = 0; i<10; i++) {
//        [manager sendRequestWithUrl:url parameters:params denyRepeated:YES callBack:^(id  _Nullable response, NSError * _Nullable error) {
//
//        }];
//    }
    [manager sendRequestWithUrl:url parameters:params cache:YES  callBack:^(BOOL isCache, id  _Nullable response, NSError * _Nullable error) {
        if (isCache) {
            NSLog(@"缓存数据:%@",response);
        }else{
            NSLog(@"请求原始数据:%@",response);
        }
    } originCallBack:^(id  _Nullable response, NSError * _Nullable error) {
        NSLog(@"请求原始数据:%@",response);

    }];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 400, 100)];
//    imageView.image = [UIImage imageNamed:@"popover_background_right"];
    imageView.image = [UIImage resizableImageWithName:@"popover_background_right"];

    
  
    [self.view addSubview:imageView];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
 

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.navigationController pushViewController:[ETTestViewController new] animated:YES];
    [self.navigationController pushViewController:[ETNewsViewController new] animated:YES];
    
}
@end
