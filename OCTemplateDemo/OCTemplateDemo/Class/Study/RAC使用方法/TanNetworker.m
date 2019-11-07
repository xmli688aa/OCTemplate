
//
//  TanNetworker.m
//  RACDemo
//
//  Created by Ethon.Z on 2019/4/23.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "TanNetworker.h"

@implementation TanNetworker

+ (RACSignal *)loginWithLoginModel:(TanLoginViewModel *)loginModel{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        //这里发送网络请求给服务器
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([loginModel.userName isEqualToString:@"admin"]&&[loginModel.password isEqualToString:@"123"]) {
                [subscriber sendNext:@"登录成功"];
            }else{
                [subscriber sendNext:@"密码不正确"];
            }
//            [subscriber sendNext:[NSString stringWithFormat:@"User %@, password %@, login!",name,password]];
            //伴随着command一起构建的signal，记得要在操作完成后发送完成消息以表示其执行完了  否则不能再执行此command。
            [subscriber sendCompleted];
        });
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"登录回调结束");
        }];
    }];

    
    
}
@end
