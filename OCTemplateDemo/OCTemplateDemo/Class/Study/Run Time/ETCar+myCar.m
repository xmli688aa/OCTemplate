//
//  ETCar+myCar.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/8/7.
//  Copyright (c) Hello  All rights reserves.
//

        

#import "ETCar+myCar.h"
#import <objc/runtime.h>

void startEngine (id self, SEL _cmd, NSString *brand){
    NSLog(@"my %@ car starts the engine", brand);
}

@implementation ETCar (myCar)

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(drive)) {
        //给类添加一个新的方法和该方法的具体实现。分析一下这个方法需要的参数：
        class_addMethod([self class], sel, (IMP)startEngine, "v@:@");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
//上面c语言的startEngine方法 等价于下面oc的方法
//- (void)startEngine:(NSString *)brand {
//    NSLog(@"my %@ car starts the engine", brand);
//}




@end
