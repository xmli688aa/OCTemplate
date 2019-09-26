//
//  ETFMDBManger.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/9/26.
//  Copyright (c) Hello  All rights reserves.
//
        

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETFMDBManger : NSObject

+ (instancetype)manager;

- (void)createDB;
- (void)insertInfo;
- (void)deleateInfo;
- (void)updateInfo;
- (void)queryInfo;
- (void)deleteTable;


@end

NS_ASSUME_NONNULL_END
