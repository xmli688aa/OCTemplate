//
//  TanLoginViewModel.m
//  RACDemo
//
//  Created by Ethon.Z on 2019/4/23.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "TanLoginViewModel.h"
#import "TanNetworker.h"

@implementation TanLoginViewModel

- (instancetype)init{
    if (self = [super init]) {
        RACSignal *userNameLengthSig = [RACObserve(self, userName) map:^id(NSString *value) {
            if (value.length >2 ) {
                return @(YES);
            }
            return @(NO);
        }];
        RACSignal *passwordLengthSig = [RACObserve(self, password) map:^id(NSString *value) {
            if (value.length >2 ) {
                return @(YES);
            }
            return @(NO);
        }];
        RACSignal *loginBtnEnable = [RACSignal combineLatest:@[userNameLengthSig,passwordLengthSig] reduce:^id(NSNumber *userName, NSNumber *password){
            return @([userName boolValue] && [password boolValue]);
        }];

//        _loginCommand = [[RACCommand alloc] initWithEnabled:loginBtnEnable signalBlock:^RACSignal *(id input) {
//            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//                //发送网络请求
//                //请求结束 发布信息
//                [subscriber sendNext:@"登录成功"];
//                //伴随着command一起构建的signal，记得要在操作完成后发送完成消息以表示其执行完了  否则不能再执行此command。
//                [subscriber sendCompleted];
//                return nil;
//            }] ;
//        }];

        _loginCommand = [[RACCommand alloc] initWithEnabled:loginBtnEnable signalBlock:^RACSignal *(id input) {
            return [TanNetworker loginWithLoginModel:self];
        }];
    }
    return self;
}

@end
