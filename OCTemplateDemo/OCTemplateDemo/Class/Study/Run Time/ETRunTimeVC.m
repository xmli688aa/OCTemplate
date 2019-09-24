//
//  ETRunTimeVC.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/8/7.
//  Copyright (c) Hello  All rights reserves.
//

        

#import "ETRunTimeVC.h"
#import "ETCar+myCar.h"

@interface ETRunTimeVC ()

@end

@implementation ETRunTimeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    给cart动态的添加方法 这样car在执行drive函数的时候 不会崩溃
    ETCar *car = [[ETCar alloc] init];
    [car performSelector:@selector(drive) withObject:@"bmw"];

}
@end
