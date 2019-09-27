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
#import "ETFMDBManger.h"
#import "ETTeacher.h"

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
    person.name = @"robert";
    [ETDataManager savePersonModel:person];//会修改上面的名称

}

- (IBAction)getModel:(id)sender {
    ETPerson *person = [ETDataManager getPersonModel];
    NSLog(@"person name:%@ age:%ld",person.name,person.age);
}
#pragma mark - FMDB

- (IBAction)insertInfo:(id)sender {
    [[ETFMDBManger manager] insertInfo];
}

- (IBAction)deleteInfo:(id)sender {
    [[ETFMDBManger manager] deleateInfo];
}

- (IBAction)updateInfo:(id)sender {
    [[ETFMDBManger manager] updateInfo];

}
- (IBAction)queryInfo:(id)sender {
    [[ETFMDBManger manager] queryInfo];

}
- (IBAction)deleteTable:(id)sender {
    [[ETFMDBManger manager] deleteTable];
}

#pragma mark - BGFMDB(对FMDB的封装)

- (IBAction)BGSave:(id)sender {
    ETTeacher *teacher = [[ETTeacher alloc] initWithName:@"Tom" age:18 height:66];
    ETTeacher *teacher1 = [[ETTeacher alloc] initWithName:@"Jack" age:18 height:22];
    ETTeacher *teacher2 = [[ETTeacher alloc] initWithName:@"Tevin" age:10 height:59];
    ETTeacher *teacher3 = [[ETTeacher alloc] initWithName:@"Tevin" age:10 height:69];
    ETTeacher *teacher4 = [[ETTeacher alloc] initWithName:@"Tevin" age:12 height:59];
    NSArray *array = @[teacher,teacher1,teacher2,teacher3,teacher4];
    
    [ETDataManager saveOrUpdateTeacherModels:array block:^(BOOL isSuccess) {
        if (isSuccess) {
            NSLog(@"存储成功");
        }
        else{
            NSLog(@"存储失败");
        }
    }];
 
}

- (IBAction)BGQuery:(id)sender {
    //同步查询所有数据.
    NSArray* finfAlls = [ETDataManager getAllTeacherModels];
    NSLog(@"同步finfAlls:%@",finfAlls);
    //异步查询所有数据
    [ETDataManager getAllTeacherModelsAsync:^(NSArray * _Nonnull array) {
        NSLog(@"异步array:%@",array);

    }];
    
}

- (IBAction)BGUpdate:(id)sender {
  
    ETTeacher *teacher2 = [[ETTeacher alloc] initWithName:@"Tevin" age:12 height:111];
    [ETDataManager saveOrUpdateTeacherModel:teacher2 block:^(BOOL isSuccess) {
        if (isSuccess) {
            NSLog(@"更新成功")
        }else{
            NSLog(@"更新失败");
        }
        
    }];
}
- (IBAction)BGDelete:(id)sender {
//    1.删除People类中name等于"美国队长"的数据.
      NSString *where = [NSString stringWithFormat:@"where %@=%@",bg_sqlKey(@"name"),bg_sqlValue(@"Tevin")];
    [ETDataManager deleteTeacherModelWhere:where];
}

@end
