
//
//  ETDataManager.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/9/25.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETDataManager.h"

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
@end
