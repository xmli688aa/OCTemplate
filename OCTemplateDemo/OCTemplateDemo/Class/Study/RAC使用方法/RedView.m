
//
//  RedView.m
//  RACDemo
//
//  Created by Ethon.Z on 2019/4/23.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "RedView.h"
#import "TanLoginViewModel.h"

@implementation RedView


-(void)awakeFromNib{
    [super awakeFromNib];
    self.count = 0;
}
- (IBAction)btnClick:(id)sender {

    TanLoginViewModel *loginModel = [TanLoginViewModel new];
    loginModel.userName = @"ethon";
    [self test:loginModel];
    
//    [self.btnSubject sendNext:@"sfasdfdf"];

}
- (void)test:(TanLoginViewModel *)model{
    self.count ++;
    self.name = [NSString stringWithFormat:@"新的名称:%ld",self.count];
}

@end
