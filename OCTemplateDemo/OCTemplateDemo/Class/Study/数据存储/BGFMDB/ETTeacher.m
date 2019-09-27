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
 自定义“联合主键” ,这里指定 name和age 为“联合主键”.
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
@end
