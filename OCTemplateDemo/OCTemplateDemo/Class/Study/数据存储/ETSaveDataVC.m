//
//  ETSaveDataVC.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/9/25.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETSaveDataVC.h"
#import "ETDataManager.h"

@interface ETSaveDataVC ()

@end

@implementation ETSaveDataVC

- (void)viewDidLoad {
    [super viewDidLoad];


}
#pragma mark - plist存储
- (IBAction)saveToPlist:(id)sender {
    NSDictionary *myInfoDic = @{
                          @"name":@"Robert",
                          @"height":@"175"
                          };
    [ETDataManager writeDataToPlistWithPlistName:@"myInfo" dataDic:myInfoDic];
}
#pragma mark - plist获取
- (IBAction)getPlistData:(id)sender {
    NSDictionary *myInfoDic = [ETDataManager getDataWithPlistName:@"myInfo"];
    NSLog(@"myInfoDic:%@",myInfoDic);
}
#pragma mark - plist更新
- (IBAction)updatePlistData:(id)sender {
    NSDictionary *myInfoDic = @{
                                @"name":@"Tom",
                                @"height":@"155",
                                @"weight":@"60"
                                };
    [ETDataManager writeDataToPlistWithPlistName:@"myInfo" dataDic:myInfoDic];
}


@end
