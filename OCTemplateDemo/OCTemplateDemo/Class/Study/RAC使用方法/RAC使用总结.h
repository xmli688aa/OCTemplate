//
//  RAC使用总结.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/11/7.
//  Copyright (c) Hello  All rights reserves.
//


#ifndef RAC_____h
#define RAC_____h
#pragma mark - 基本使用方法 创建--->订阅--->发布
//1、创建信号量
RACSignal * signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
    NSLog(@"创建信号量");
    //3、发布信息
    [subscriber sendNext:@"I'm send next data"];
    NSLog(@"那我啥时候运行");
    return [RACDisposable disposableWithBlock:^{
        NSLog(@"disposable");
    }];
}];

//2、订阅信号量
[signal subscribeNext:^(id  _Nullable x) {
    NSLog(@"%@",x);
}];

//1创建信号，
RACSubject * subject = [RACSubject subject];
//2订阅信号
[subject subscribeNext:^(id  _Nullable x) {
    NSLog(@"%@",x);
}];
//3发送数据
[subject sendNext:@"发送数据"];
#pragma mark - 监听方法，并且可以通过元组把参数传出(用来替代代理/block传值)
//监听view的事件 test方法中将model作为参数 可以获取到model对象
[[self.redView rac_signalForSelector:@selector(test:)] subscribeNext:^(RACTuple * _Nullable x) {
    //    TanLoginViewModel *model = tuple.allObjects.firstObject;
    //    NSLog(@"str:%@",model);
}];
//监听按钮点击
[[_btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
    NSLog(@"%@",x);
}];

#pragma mark - 替代KVO
//写法1
- (void)repleacKVO{
    [_redView rac_observeKeyPath:@"frame" options:NSKeyValueObservingOptionNew observer:nil block:^(id value, NSDictionary *change, BOOL causedByDealloc, BOOL affectedOnlyLastComponent) {
        NSLog(@"1 - %@",value);
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _redView.frame = CGRectMake(50, 60, 200, 200);
}
//方法2
[[_redView rac_valuesForKeyPath:@"frame" observer:nil] subscribeNext:^(id  _Nullable x) {
    NSLog(@"2 - %@",x);
}];
//方法三
[RACObserve(_redView, frame) subscribeNext:^(id  _Nullable x) {
    NSLog(@"3 - %@",x);
}];

#pragma mark - 替代通知

[[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardDidShowNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
    NSLog(@"%@",x);
}];

#pragma mark - 监听文本框的输入
[_textField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
    NSLog(@"%@",x);
}];
//另一种更简单的写法 直接将监听的textField文字赋值给了_label的text属性
RAC(_label,text) = _textField.rac_textSignal;

#pragma mark - 处理当界面有多次请求时，需要都获取到数据时，才能展示界面
- (void)sendRequest{
    RACSignal *requestHot = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"发送网络请求,获取最热商品");
        [subscriber sendNext:@"获取最热商品成功了"];
        return nil;
    }];
    
    RACSignal *requestNew = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"发送网络请求,获取最新商品");
        [subscriber sendNext:@"获取最新商品成功了"];
        return nil;
    }];
    // Selector调用:当所有信号都发送数据的时候调用
    // 数组存放信号
    // Selector注意点:参数根据数组元素决定
    // Selector方法参数类型,就是信号传递出来数据
    [self rac_liftSelector:@selector(updateUI:data2:) withSignalsFromArray:@[requestHot,requestNew]];
}
// 只要两个请求都请求完成的时候才会调用
- (void)updateUI:(NSString *)data1 data2:(NSString *)data2
{
    NSLog(@"两个网络请求成功之后的回调: 请求回调1_%@ 请求q回调2_%@",data1,data2);
}

#endif /* RAC_____h */
