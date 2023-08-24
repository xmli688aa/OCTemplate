//
//  ETDelegateManager.h
//  OCTemplateDemo
//
//  Created by zwz on 2023/6/18.
//  Copyright © 2023 zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ETDelegateManagerDelegate<NSObject>

@optional

- (void)didClickBtn:(NSInteger )index;

- (void)successBlock:(void(^)(void))successBlock;

@end

@interface ETDelegateManager : NSObject

@property(weak, nonatomic) id<ETDelegateManagerDelegate> delegate;

- (void)test;
- (void)test2;

@end

NS_ASSUME_NONNULL_END
