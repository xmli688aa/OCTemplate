//
//  ETHTTPManager.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/7/22.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETHTTPManager.h"

@implementation ETHTTPManager

- (NSString *)baseURL
{
    return @"https://api.github.com/";
    return @"https://www.baifubao.com/";
}
//请求头
- (NSDictionary *)httpHeaderField{
    return @{@"token" : @"111111",@"pwd" : @"222222"};
}
- (KYRequestSerializerType)requestSerializerType
{
    return KYRequestSerializerTypeHTTP;
}

- (KYResponseSerializerType)responseSerializerType
{
    return KYResponseSerializerTypeHTTP;
}

- (BOOL)allowInvalidCertificates
{
    return NO;
}
- (BOOL)validatesDomainName
{
    return YES;
}
//设置请求超时时间
- (NSTimeInterval)requestTimeout{
    return 10;
}
//设置缓存请求数据时间
- (NSTimeInterval)cashTimeout{
    return 3600;
}
//请求扩展参数
- (id)extendedParameters:(id)parameters url:(nonnull NSString *)url
{
    id params = parameters;
//    NSLog(@"%@,请求参数:\n%@",url,params);
//    [self setValue:@"333333333333" forHTTPHeaderField:@"pid"];
    if ([params isKindOfClass:[NSDictionary class]]) {
        params[@"loginName"] = @"ethon";
    }
    return params;
}
- (BOOL)shouldSaveResponseToCache:(id)response
{
    //这里判断response是否保存
//    if ([response isKindOfClass:[NSString class]]) {
//        NSString *str = (NSString *)response;
//        if ([str containsString:@"area"]) {
//            return YES;
//        }
//    }
//    return NO;
    return YES;

}
//网络请求结果解析
- (id)analysisObjectFromResponse:(id)response url:(NSString *)url
{
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil] ;
    if (dic && [dic isKindOfClass:[NSDictionary class]]) {
        return dic;
    }
    NSString *resultStr = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    return resultStr;
}
//缓存的key是否是全路径
- (BOOL)cacheKeyContainsBaseUrl
{
//    return NO;
    return YES;

}


- (void)sendRequestWithUrl:(NSString *)url parameters:(id)parameters callBack:(nullable KYHTTPCallBack)callBack{
    [super sendRequestWithUrl:url parameters:parameters callBack:callBack];
}

@end
