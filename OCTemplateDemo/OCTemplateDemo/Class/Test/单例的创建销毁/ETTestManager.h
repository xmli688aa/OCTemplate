//
//  ETManager.h
//  OCTemplateDemo
//
//  Created by Ethon on 2019/8/23.
//  Copyright © 2019 zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETTestManager : NSObject

@property (nonatomic, copy) NSString *name;

+ (instancetype)share;

+ (void)releaseManager;

@end

NS_ASSUME_NONNULL_END
