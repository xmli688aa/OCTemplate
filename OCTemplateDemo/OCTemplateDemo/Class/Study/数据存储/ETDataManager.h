//
//  ETDataManager.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/9/25.
//  Copyright (c) Hello  All rights reserves.
//
        

#import <Foundation/Foundation.h>
#import "ETPerson.h"
#import "ETTeacher.h"

NS_ASSUME_NONNULL_BEGIN

@interface ETDataManager : NSObject
///plist文件，即属性列表文件. 只能存储系统自带的类型NSArray NSDictionary NSString Boolean Date Data Number
+ (void)writeDataToPlistWithPlistName:(NSString *)plistName dataDic:(NSDictionary *)dataDic;
///获取plist内容 必须明确返回类型 如NSDictionary,NSArray
+ (NSDictionary *)getDataWithPlistName:(NSString *)plistName;

///NSUserDeafult保存数据 只能存储系统自带的类型NSArray NSDictionary NSString Boolean Date Data Number
+ (void)saveUserInfoDataWithDataDic:(NSDictionary *)dataDic;
+ (NSDictionary *)getUserInfoData;

///保存model对象
+ (void)savePersonModel:(ETPerson *)person;
+ (ETPerson *)getPersonModel;

///使用BGFMDB保存或更新模型数组
+ (void)saveOrUpdateTeacherModels:(NSArray *)models block:(void(^)(BOOL isSuccess))block;
///使用BGFMDB保存或更新模型
+ (void)saveOrUpdateTeacherModel:(ETTeacher *)teacher block:(void(^)(BOOL isSuccess))block;
///同步获取模型数组
+ (NSArray *)getAllTeacherModels;
///异步获取模型数组
+ (void)getAllTeacherModelsAsync:(void(^)(NSArray *array))block;

///删除模型 where为空 删除TeacherMode表格
+ (void)deleteTeacherModelWhere:(NSString *)where;

@end

NS_ASSUME_NONNULL_END
