
//
//  ETDataManager.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/9/25.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETDataManager.h"
#import "ETTeacher.h"

#define kETUserInfo   @"kET_UserInfo"

@implementation ETDataManager

+ (void)writeDataToPlistWithPlistName:(NSString *)plistName dataDic:(NSDictionary *)dataDic{
    if (![dataDic isKindOfClass:[NSDictionary class]]) {
        //文件非字典
        NSLog(@"文件类型非字典");
        return;
    }
    //写入文件
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",plistName]];
    
    NSDictionary *dic = [self getDataWithPlistName:plistName];
    if (dic) {
        //已经保存过 就更新
        NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithDictionary:dic];
        for (NSString *key in dataDic) {
            mutableDic[key] = dataDic[key];
        }
        BOOL success = [mutableDic writeToFile:path atomically:YES];
        if (success) {
            NSLog(@"更新成功");
        }else{
            NSLog(@"更新失败");
        }
        return;
    }
   BOOL success = [dataDic writeToFile:path atomically:YES];
    
    if (success) {
        NSLog(@"保存成功");
    }else{
        NSLog(@"保存失败");
    }
}
+ (NSDictionary *)getDataWithPlistName:(NSString *)plistName{
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",plistName]];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    return dic;
}

+ (void)saveUserInfoDataWithDataDic:(NSDictionary *)dataDic{
    if (dataDic == nil) return;
    [[NSUserDefaults standardUserDefaults] setValue:dataDic forKey:kETUserInfo];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (NSDictionary *)getUserInfoData{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kETUserInfo];
}

///保存model对象
+ (void)savePersonModel:(ETPerson *)person{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *path = [docPath stringByAppendingPathComponent:@"ETPerson"];
    [NSKeyedArchiver archiveRootObject:person toFile:path];
}
+ (ETPerson *)getPersonModel{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *path = [docPath stringByAppendingPathComponent:@"ETPerson"];
    //读取对象
    ETPerson *person = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return person;
}

+ (void)saveOrUpdateTeacherModels:(NSArray *)models block:(void(^)(BOOL isSuccess))block{
    //不指定表明 默认表明与Model名称一致
    ETTeacher.bg_tableName = nil;
    //同步保存
    //    [ETTeacher bg_saveOrUpdateArray:array];
    //异步保存
    [ETTeacher bg_saveOrUpdateArrayAsync:models complete:^(BOOL isSuccess) {
        if (block) {
            block(isSuccess);
        }
    }];
}

+ (void)saveOrUpdateTeacherModel:(ETTeacher *)teacher block:(void(^)(BOOL isSuccess))block{
    //同步
//    [teacher bg_save];
    //异步
    [teacher bg_saveOrUpdateAsync:^(BOOL isSuccess) {
        block(isSuccess);
    }];
}
+ (NSArray *)getAllTeacherModels{
    NSString *bg_tablename = nil;
    return [ETTeacher bg_findAll:bg_tablename];
}
+ (void)getAllTeacherModelsAsync:(void (^)(NSArray * _Nonnull))block{
    NSString *bg_tablename = nil;
   [ETTeacher bg_findAllAsync:bg_tablename complete:^(NSArray * _Nullable array) {
       if (block) {
           block(array);
       }
   }];
}

+ (void)deleteTeacherModelWhere:(NSString *)where{
    ///@tablename 当此参数为nil时,查询以此类名为表名的数据，非nil时，删除以此参数为表名的数据.
    ///@where 条件参数,可以为nil，nil时删除所有以tablename为表名的数据.
    //where使用规则请看demo或如下事例:
    //1.删除People类中name等于"美国队长"的数据.
    //    where = [NSString stringWithFormat:@"where %@=%@",bg_sqlKey(@"name"),bg_sqlValue(@"美国队长")];
    //2.删除People类中user.student.human.body等于"小芳"的数据.
    //    where = [NSString stringWithFormat:@"where %@",bg_keyPathValues(@[@"user.student.human.body",bg_equal,@"小芳"])];
    //3.删除People类中name等于"美国队长" 和 user.student.human.body等于"小芳"的数据.
    //    where = [NSString stringWithFormat:@"where %@=%@ and %@",bg_sqlKey(@"name"),bg_sqlValue(@"美国队长"),bg_keyPathValues(@[@"user.student.human.body",bg_equal,@"小芳"])];
    NSString *bg_tablename = nil;
    [ETTeacher bg_delete:bg_tablename where:where];
}


@end
