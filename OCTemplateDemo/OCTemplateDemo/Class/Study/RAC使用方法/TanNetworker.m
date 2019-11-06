
//
//  TanNetworker.m
//  RACDemo
//
//  Created by Ethon.Z on 2019/4/23.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "TanNetworker.h"
#import "TanLoginViewModel.h"

@implementation TanNetworker

+ (RACSignal *)loginWithUserName:(NSString *) name password:(NSString *)password{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            TanLoginViewModel *model = [TanLoginViewModel new];
            model.userName = @"sunzhongsan";
            model.password = @"abc123";
            [subscriber sendNext:model];
//            [subscriber sendNext:[NSString stringWithFormat:@"User %@, password %@, login!",name,password]];
            //伴随着command一起构建的signal，记得要在操作完成后发送完成消息以表示其执行完了  否则不能再执行此command。
            [subscriber sendCompleted];
        });
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"点击了登录按钮");
        }];
    }];

    
    
}
@end
