
//
//  RACViewController.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/11/6.
//  Copyright (c) Hello  All rights reserves.
//


#import "RACViewController.h"
#import "TanLoginViewModel.h"
#import "RedView.h"
#import "SecondViewController.h"

@interface RACViewController ()
@property (strong, nonatomic) RACSignal *signal;
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *juhuaTextView;
@property (strong, nonatomic) TanLoginViewModel *viewModel;

@end

@implementation RACViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loginFlow];
    //    [self signalTest];
    //    [self sigleArrayTest];
    [self testRACMulticastConnection];
    
    [self addRedView];
    
}
///仿登录流程
- (void)loginFlow{
    _juhuaTextView.hidden = YES;
    _viewModel = [[TanLoginViewModel alloc]init];
    
    @weakify(self)
    //下面的方法其实就是监听了文本框的输入
//    RAC(self.viewModel, userName) = self.userNameTF.rac_textSignal;
    //与上面的方法是等价的
    [self.userNameTF.rac_textSignal subscribeNext:^(id x) {
        self.viewModel.userName = x;
    }];
    RAC(self.viewModel, password) = self.passwordTF.rac_textSignal;
    self.loginBtn.rac_command = self.viewModel.loginCommand;
    [self.viewModel.loginCommand execute:@"eeeee"];

    [[self.viewModel.loginCommand executionSignals]
     subscribeNext:^(RACSignal *x) {
        @strongify(self)
        self.juhuaTextView.hidden = NO;
        [x subscribeNext:^(NSString *x) {
            self.juhuaTextView.hidden = YES;
            NSLog(@"%@",x);
        }];
    }];
}
- (void)addRedView{
    //xib加载控制器的时候 控制器的frame可能不正确 导致添加xibView可能显示异常(iPhone7)
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    //方法1.重新设置控制器的frame的方法
//    self.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    //方法2 xibView设置 self.autoresizingMask = UIViewAutoresizingNone;
    RedView *view = [[RedView alloc] init];
    view.frame = CGRectMake(0, 350, 300, 100);
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];

    //1.代替代理传值
    [[view rac_signalForSelector:@selector(test:)] subscribeNext:^(RACTuple *tuple) {
        TanLoginViewModel *model = tuple.allObjects.firstObject;
        NSLog(@"str:%@",model);
    }];
    //    view.btnSubject = [[RACSubject alloc] init];
    //    [view.btnSubject subscribeNext:^(id x) {
    //        NSLog(@"xxxxx:%@",x);
    //    }];
    
    
    //2.代替KVO
    //2.1 只要监听的属性一改变调用
    [[view rac_valuesAndChangesForKeyPath:@"count" options: NSKeyValueObservingOptionNew observer:nil] subscribeNext:^(RACTuple *tuple) {
        NSLog(@"kvo监听:%@",tuple);
        NSDictionary *dic = tuple.allObjects.firstObject;
        NSLog(@"dic:%@",dic);
    }];
    //2.2 KVO:第二种,只要对象的值改变,就会产生信号,订阅信号
    [[view rac_valuesForKeyPath:@"name" observer:nil] subscribeNext:^(id x) {
        NSLog(@"监听:%@",x);
    }];
    //3.按钮的点击
    [[view.btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"按钮被点击了");
    }];
    
    //4.监听文本框文字的输入
    [view.textF.rac_textSignal subscribeNext:^(id x) {
        NSLog(@"文本框文字:%@",x);
    }];
    //5:处理当界面有多次请求时，需要都获取到数据时，才能展示界面
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

- (void)testRACMulticastConnection{
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"请求消息"];
        return nil;
    }] ;
    //下面的运行结果，会执行两遍发送请求，也就是每次订阅都会发送一次请求
    //    [signal subscribeNext:^(id x) {
    //        NSLog(@"收到数据1:%@",x);
    //    }];
    //    [signal subscribeNext:^(id x) {
    //        NSLog(@"收到数据2:%@",x);
    //    }];
    
    //RACMulticastConnection:解决重复请求问题 断点调试发现 [subscriber sendNext:@"请求消息"]只调用一次
    
    RACMulticastConnection *connection = [signal publish];
    [connection.signal subscribeNext:^(id x) {
        NSLog(@"收到数据1:%@",x);
    }];
    [connection.signal subscribeNext:^(id x) {
        NSLog(@"收到数据2:%@",x);
    }];
    [connection.signal subscribeNext:^(id x) {
        NSLog(@"收到数据3:%@",x);
    }];
    [connection connect];
    
}
- (void)signalTest{
    //1.创建信号
    _signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        //2.发送信号
        [subscriber sendNext:@1];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"信号被销毁");
            
        }];
    }];
    [_signal subscribeNext:^(id x) {
        NSLog(@"接收到数据:%@",x);
        
    }];
}
- (void)testRACSubject{
    RACSubject *subject = [RACSubject subject];
    [subject subscribeNext:^(id x) {
        NSLog(@"第一个订阅者:%@",x);
    }];
    
    [subject subscribeNext:^(id x) {
        NSLog(@"第二个订阅者:%@",x);
    }];
    //必须先有订阅 再发布
    [subject sendNext:@"520"];
    //RACSubject 和 RACReplaySubject 区别 RACReplaySubject可以先发送信号，再订阅信号，RACSubject就不可以。
    //    RACReplaySubject *replaySubject = [[RACReplaySubject alloc] init];
    //    [replaySubject sendNext:@"1"];
    //    [replaySubject sendNext:@100];
    //    [replaySubject subscribeNext:^(id x) {
    //        NSLog(@"第一个订阅者受到的数据:%@",x);
    //    }];
    //    [replaySubject subscribeNext:^(id x) {
    //        NSLog(@"第二个订阅者受到的数据:%@",x);
    //    }];
}

- (void)sigleArrayTest{
    //1.遍历数组
    NSArray *numbers = @[@1,@2,@3,@4];
    [numbers.rac_sequence.signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    //2.遍历字典
    NSDictionary *dict = @{@"name":@"xmg",@"age":@18};
    //    [dict.rac_sequence.signal subscribeNext:^(id x) {
    //        NSLog(@"%@",x);
    //    }];
    
    [dict.rac_sequence.signal subscribeNext:^(RACTuple *x) {//id类型直接改成RACTuple类型
        //解包元祖
        RACTupleUnpack(NSString *key,NSString *value) = x;
        NSLog(@"%@ %@",key,value);
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    [_signal subscribeNext:^(id x) {
        NSLog(@"接收到数据:%@",x);
        
    }];
}

//使用RACSubject替换代理
- (IBAction)jumpToSecondVC:(id)sender {
    SecondViewController *secondVC = [SecondViewController new];
    RACSubject *subject = [RACSubject subject];
    secondVC.subject = subject;
    [subject subscribeNext:^(id x) {
        NSLog(@"第二个页面的按钮被点击了:%@",x);
    }];
    [self.navigationController pushViewController:secondVC animated:YES];
    
}

- (IBAction)clickLoginBtn:(id)sender {
    
    
}

@end
