//
//  ETDataManager.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/9/25.
//  Copyright (c) Hello  All rights reserves.
//
        

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETDataManager : NSObject
///plist文件，即属性列表文件. 只能存储系统自带的类型NSArray NSDictionary NSString Boolean Date Data Number
+ (void)writeDataToPlistWithPlistName:(NSString *)plistName dataDic:(NSDictionary *)dataDic;
///获取plist内容 必须明确返回类型 如NSDictionary,NSArray
+ (NSDictionary *)getDataWithPlistName:(NSString *)plistName;

@end

NS_ASSUME_NONNULL_END
