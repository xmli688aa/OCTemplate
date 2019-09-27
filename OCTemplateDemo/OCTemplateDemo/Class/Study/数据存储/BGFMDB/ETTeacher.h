//
//  ETTeacher.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/9/27.
//  Copyright (c) Hello  All rights reserves.
//
        

#import <Foundation/Foundation.h>
/**
只要在自己的类中导入了BGFMDB.h这个头文件,本类就具有了存储功能.
*/
#import "BGFMDB.h"

NS_ASSUME_NONNULL_BEGIN

@interface ETTeacher : NSObject

@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger age;
@property (assign, nonatomic) NSInteger height;

- (instancetype)initWithName:(NSString *)name age:(NSInteger )age height:(NSInteger )height;

@end

NS_ASSUME_NONNULL_END
