//
//  TanNetworker.h
//  RACDemo
//
//  Created by Ethon.Z on 2019/4/23.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TanNetworker : NSObject

+ (RACSignal *)loginWithUserName:(NSString *) name password:(NSString *)password;

@end

NS_ASSUME_NONNULL_END
