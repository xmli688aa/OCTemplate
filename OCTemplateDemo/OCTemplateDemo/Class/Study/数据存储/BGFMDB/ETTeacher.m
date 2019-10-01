//
//  ETTeacher.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/9/27.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETTeacher.h"

@implementation ETTeacher
/**
 自定义“联合主键” ,这里指定 name和age 为“联合主键”.  姓名和年龄相同为同一个模型
 */
+(NSArray *)bg_unionPrimaryKeys{
    return @[@"name",@"age"];
}
- (instancetype)initWithName:(NSString *)name age:(NSInteger )age height:(NSInteger )height{
    if (self = [super init]) {
        self.name = name;
        self.age = age;
        self.height = height;
    }
    return self;
}


// 服务器返回不同的字段 对应的是一个值处理方法1
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"name" : @[@"teacherName",@"personName",@"name"],
             };
}
// 服务器返回不同的字段 对应的是一个值处理方法2 重写set方法
//- (void)setTeacherName:(NSString *)teacherName{
//    _name = teacherName;
//}
//-  (void)setPersonName:(NSString *)personName{
//    _name = personName;
//}

@end
