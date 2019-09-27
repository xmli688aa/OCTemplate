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
//    teacher.bg_tableName = @"ETTeacher_Table";
//    [teacher bg_save];//同步存储
    //异步存储
    [teacher bg_saveAsync:^(BOOL isSuccess) {
        if (isSuccess) {
            NSLog(@"存储成功");
        }else{
            NSLog(@"存储失败");
        }
    }];
//    /**
//    覆盖掉原来People类的所有数据,只存储当前对象的数据.
//    */
//    [teacher bg_cover];
    /**
    同步存储或更新.
    当"唯一约束"或"主键"存在时，此接口会更新旧数据,没有则存储新数据.
    提示：“唯一约束”优先级高于"主键".
    */
//    [teacher bg_saveOrUpdate];
    
    /**
    同步 存储或更新 数组元素.
    当"唯一约束"或"主键"存在时，此接口会更新旧数据,没有则存储新数据.
    提示：“唯一约束”优先级高于"主键".
    */
    ETTeacher *teacher1 = [[ETTeacher alloc] initWithName:@"Jack" age:18 height:22];
    ETTeacher *teacher2 = [[ETTeacher alloc] initWithName:@"Tevin" age:10 height:59];
    ETTeacher *teacher3 = [[ETTeacher alloc] initWithName:@"Tevin" age:10 height:59];
    ETTeacher *teacher4 = [[ETTeacher alloc] initWithName:@"Tevin" age:12 height:59];
    [ETTeacher bg_saveOrUpdateArray:@[teacher,teacher1,teacher2,teacher3,teacher4]];
}

- (IBAction)BGQuery:(id)sender {
    NSString *bg_tablename = @"ETTeacher_Table";
    /**
    同步查询所有数据.
    */
    NSArray* finfAlls = [ETTeacher bg_findAll:bg_tablename];

    /**
    按条件查询.
    */
    NSString* where = [NSString stringWithFormat:@"where %@=%@",bg_sqlKey(@"name"),bg_sqlValue(@"Tevin")];
    NSArray* arr = [ETTeacher bg_find:bg_tablename where:where];

    /**
     直接写SQL语句操作.
     */
    NSArray* arr1 = bg_executeSql(@"select * from yy", bg_tablename, [ETTeacher class]);//查询时,后面两个参数必须要传入.

    /**
     根据范围查询.
    */
//    NSArray* arr2 = [ETTeacher bg_find:bg_tablename range:NSMakeRange(0,50) orderBy:nil desc:NO];
    
}

- (IBAction)BGUpdate:(id)sender {
    /**
     单个对象更新.
     支持keyPath.
     */
//    NSString* where = [NSString stringWithFormat:@"where %@ or %@=%@",bg_keyPathValues(@[@"user.student.human.body",bg_equal,@"小芳"]),bg_sqlKey(@"age"),bg_sqlValue(@(31))];

    ETTeacher *teacher2 = [[ETTeacher alloc] initWithName:@"Tevin" age:80 height:79];
    NSString* where = [NSString stringWithFormat:@"where %@ or %@=%@",bg_keyPathValues(@[@"teacher2.name",bg_equal,@"Tevin"]),bg_sqlKey(@"age"),bg_sqlValue(@(10))];
      [teacher2 bg_updateWhere:where];
      
    /**
     sql语句批量更新.
     */
    NSString *bg_tablename = @"ETTeacher_Table";
      NSString* where1 = [NSString stringWithFormat:@"set %@=%@ where %@=%@",bg_sqlKey(@"name"),bg_sqlValue(@"马化腾"),bg_sqlKey(@"name"),bg_sqlValue(@"天朝")];
      [ETTeacher bg_update:bg_tablename where:where1];
      
    /**
     直接写SQL语句操作
     */
    bg_executeSql(@"update yy set BG_name='标哥'", nil, nil);//更新或删除等操作时,后两个参数不必传入.
}
- (IBAction)BGDelete:(id)sender {
}

@end
