//
//  KYHttpResponseModel.h
//  KYNetworking
//
//  Created by Key on 23/04/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BGFMDB/NSObject+BGModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface KYHttpResponseModel : NSObject

/**
 主键 唯一约束
 */
@property (nonatomic, copy) NSString *cacheKey;
@property (nonatomic, assign) NSTimeInterval time;
@property (nonatomic, strong) id response;
@end

NS_ASSUME_NONNULL_END
