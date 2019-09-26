//
//  ETSaveDataVC.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/9/25.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETSaveDataVC.h"
#import "ETDataManager.h"
#import "ETPerson.h"

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

#pragma mark - NSUserDefault保存
- (IBAction)saveUserInfoWithNSUserDefault:(id)sender {
    NSDictionary *myInfoDic = @{
                                @"name":@"哈哈",
                                @"height":@"180",
                                @"weight":@"70",
                                @"interest":@"read book"
                                };
    [ETDataManager saveUserInfoDataWithDataDic:myInfoDic];
}
#pragma mark - NSUserDefault获取
- (IBAction)getUserInfoWithNSUserDefault:(id)sender {
    NSDictionary *myInfoDic = [ETDataManager getUserInfoData];
    NSLog(@"myInfoDic:%@",myInfoDic);

}
#pragma mark - 归档保存model
- (IBAction)saveModel:(id)sender {
    ETPerson *person = [[ETPerson alloc] init];
    person.name = @"Ethon";
    person.age = 20;
    [ETDataManager savePersonModel:person];
    
}

- (IBAction)getModel:(id)sender {
    ETPerson *person = [ETDataManager getPersonModel];
    NSLog(@"person name:%@ age:%ld",person.name,person.age);
}

@end
