//
//  ETFMDBManger.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/9/26.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETFMDBManger.h"
#import "FMDatabase.h"

@implementation ETFMDBManger
static  FMDatabase * _fmdb;;
+ (instancetype)manager{
    static ETFMDBManger *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ETFMDBManger alloc] init];
        [manager createDB];
    });
    return manager;
}
- (void)createDB{
    NSString * docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];//获取沙河地址
     NSLog(@"docPath==%@",docPath);
    NSString * fileName=[docPath stringByAppendingPathComponent:@"student.sqlite"];//设置数据库名称
    _fmdb = [FMDatabase databaseWithPath:fileName];//创建并获取数据库信息
    if ([_fmdb open]) {
        NSLog(@"数据库打开成功！");
        [self createTable];
    }else{
        NSLog(@"数据库打开失败！");

    }
}

- (void)createTable{
    //    PRIMARY KEY AUTOINCREMENT 基键 并且自增
    BOOL executeUpdate = [_fmdb executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL, sex text NOT NULL);"];
    if (executeUpdate) {
        NSLog(@"创建表成功");
    } else {
        NSLog(@"创建表失败");
    }
}

- (void)insertInfo{
    for (int i = 1; i <=4; i++) {
        NSString *name = [NSString stringWithFormat:@"马冬梅%@",@(i)];
        int age = i + 20;
        NSString *sex = @"女";
        BOOL results = [_fmdb executeUpdate:@"INSERT INTO t_student (name, age, sex) VALUES (?,?,?)",name,@(age),sex];
        //    BOOL result = [fmdb executeUpdateWithFormat:@"insert into t_student (name,age, sex) values (%@,%i,%@)",name,age,sex];
        //3.参数是数组的使用方式
        //    BOOL result = [fmdb executeUpdate:@"INSERT INTO t_student(name,age,sex) VALUES  (?,?,?);" withArgumentsInArray:@[name,@(age),sex]];
        if (results) {
            NSLog(@"插入成功");
        } else {
            NSLog(@"插入失败");
        }
    }
    
}

- (void)deleateInfo{
    int idNum=2;
        BOOL deleate=[_fmdb executeUpdate:@"delete from t_student where id = ?",@(idNum)];//按照id进行删除
    //    BOOL deleate=[fmdb executeUpdateWithFormat:@"delete from t_student where name = %@",@"王子涵1"];//按照名字进行删除
        if (deleate) {
            NSLog(@"删除成功");
        }else{
            NSLog(@"删除失败");
        }
}

- (void)updateInfo{
    //修改学生的名字
    NSString *newName = @"王小毛";
    NSString *oldName = @"马冬梅3";
    BOOL update=[_fmdb executeUpdate:@"update t_student set name = ? where name =?",newName,oldName];
    if (update) {
        NSLog(@"修改成功");
    } else {
        NSLog(@"修改失败");
    }
}

- (void)queryInfo{
    //查询整个表
    FMResultSet * resultSet = [_fmdb executeQuery:@"select * from t_student"];
    //根据条件查询
    //FMResultSet * resultSet = [fmdb executeQuery:@"select * from t_student where id < ?", @(4)];
    //遍历结果集合
    while ([resultSet next]) {
        int idNum = [resultSet intForColumn:@"id"];
        NSString *name = [resultSet objectForColumn:@"name"];
        int age = [resultSet intForColumn:@"age"];
        NSString *sex = [resultSet objectForColumn:@"sex"];
        NSLog(@"学号：%@ 姓名：%@ 年龄：%@ 性别：%@",@(idNum),name,@(age),sex);
    }
}

- (void)deleteTable{
    BOOL deleate = [_fmdb executeUpdate:@"delete from t_student "];
    if (deleate) {
            NSLog(@"删除表成功");
        }else{
            NSLog(@"删除表失败");
        }
}
@end
