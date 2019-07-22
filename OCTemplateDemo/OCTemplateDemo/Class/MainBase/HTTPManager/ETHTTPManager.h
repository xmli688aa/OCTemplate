//
//  ETHTTPManager.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/7/22.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETHTTPBaseManager.h"

NS_ASSUME_NONNULL_BEGIN

/**
 网络请求类 网络请求初始化 在.m中配置
 */
@interface ETHTTPManager : ETHTTPBaseManager

- (void)sendRequestWithUrl:(NSString *)url parameters:(id)parameters callBack:(nullable KYHTTPCallBack)callBack;

@end

NS_ASSUME_NONNULL_END
