//
//  ETTestXibView.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/8/7.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETXibBaseView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^TestXibViewBlock)(NSInteger clickIndex);

@interface ETTestXibView : ETXibBaseView
///子视图的按钮 超出父视图的处理
@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (nonatomic, copy) TestXibViewBlock blcok;

@end

NS_ASSUME_NONNULL_END
