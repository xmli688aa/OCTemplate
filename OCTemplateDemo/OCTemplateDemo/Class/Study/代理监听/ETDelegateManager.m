//
//  ETDelegateManager.m
//  OCTemplateDemo
//
//  Created by zwz on 2023/6/18.
//  Copyright © 2023 zhao. All rights reserved.
//

#import "ETDelegateManager.h"

@implementation ETDelegateManager
- (void)test{
    if([self.delegate respondsToSelector:@selector(didClickBtn:)]){
        [self.delegate didClickBtn:5];
    }
    
   
    
    
}

- (void)test2{
    if([self.delegate respondsToSelector:@selector(successBlock:)]){
        [self.delegate successBlock:^{
            NSLog(@"收到了代理的回调");
        }];
    }
}
@end
