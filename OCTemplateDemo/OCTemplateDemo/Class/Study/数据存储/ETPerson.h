//
//  ETPerson.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/9/26.
//  Copyright (c) Hello  All rights reserves.
//
        

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

///自定义对象保存 要遵守NSCoding协议
@interface ETPerson : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;


@end

NS_ASSUME_NONNULL_END
