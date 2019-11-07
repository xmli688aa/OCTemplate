//
//  RedView.h
//  RACDemo
//
//  Created by Ethon.Z on 2019/4/23.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETXibBaseView.h"
NS_ASSUME_NONNULL_BEGIN

@interface RedView : ETXibBaseView

@property (strong, nonatomic) RACSubject *btnSubject;
@property (assign, nonatomic) NSInteger count;
@property (copy, nonatomic) NSString *name;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UITextField *textF;

@end

NS_ASSUME_NONNULL_END
