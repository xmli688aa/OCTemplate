
//
//  ETLoadingVC.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/11/25.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETLoadingVC.h"
#import "LoadingView.h"

@interface ETLoadingVC ()

@end

@implementation ETLoadingVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [LoadingView showLoadingWithSuperView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LoadingView hideLoadingWithSuperView:self.view];
    });
}


@end
