

//
//  ETWebViewController.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/11/19.
//  Copyright (c) Hello  All rights reserves.
//


#import "ETWebViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "ETJsObject.h"

@interface ETWebViewController () <UIWebViewDelegate>

@property (nonatomic, strong) JSContext *jsContext;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) ETJsObject *jsObject;
@end

@implementation ETWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化webView
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *baseURL = [[NSBundle mainBundle] bundleURL];
    [self.webView loadHTMLString:[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil] baseURL:baseURL];
    self.webView.delegate = self;
    _jsObject = [[ETJsObject alloc] init];
    __weak __typeof(self)weakSelf = self;
    _jsObject.h5ToNativeBlcok = ^(id  _Nonnull params) {
        NSDictionary *dic = params;
        //解析JSParam 从而知道h5向原生传递的具体内容
        NSLog(@"method:%@",dic[@"method"]);
        NSLog(@"h5向原生传递消息:%@",params);
        NSString *value = dic[@"data"][@"value"];
        NSLog(@"%@",NSThread.currentThread);
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf showMsg:value];
        });

    };
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"加载完成");
    //初始化JSContext
    self.jsContext = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue;
        NSLog(@"异常捕获信息：%@", exceptionValue);
    };
    //注册中间层代理  js通过App对象,调用appInvoke方法 向原生传值 具体实现由ETJsObject对象实现
    self.jsContext[@"App"] = _jsObject;
    //下面的方法 会造成循环引用 导致控制器无法释放
//    [self jsFunction];
}
- (void)jsFunction{
    
    __block typeof(self) weakSelf = self;
    //        与h5约定交互x方法 注册js调用native的通用函数appInvoke
    self.jsContext[@"appInvoke"] = ^(id jsParam){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        NSDictionary *dic = jsParam;
        //解析JSParam 从而知道h5向原生传递的具体内容
        NSLog(@"method:%@",dic[@"method"]);
        NSLog(@"h5向原生传递消息:%@",jsParam);
        NSString *value = dic[@"data"][@"value"];
        NSLog(@"%@",NSThread.currentThread);
        dispatch_async(dispatch_get_main_queue(), ^{
            [strongSelf showMsg:value];
        });
    };
    
    //JS调用OC方法列表 (不通用 不建议使用)
    //    self.jsContext[@"showMobile"] = ^ {
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            [weakSelf showMsg:@"我是下面的小红 手机号是:18870707070"];
    //        });
    //    };
    //    self.jsContext[@"showName"] = ^ (NSString *name) {
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            NSString *info = [NSString stringWithFormat:@"你好 %@, 很高兴见到你",name];
    //            [weakSelf showMsg:info];
    //        });
    //    };
    //    void (^_showSendMsg) (NSString *num, NSString *msg) = ^ (NSString *num, NSString *msg) {
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            NSString *info = [NSString stringWithFormat:@"这是我的手机号: %@, %@ !!",num,msg];
    //            [self showMsg:info];
    //        });
    //    };
    //
    //    [self.jsContext setObject:_showSendMsg forKeyedSubscript:@"showSendMsg"];
}
- (void)showMsg:(NSString *)msg {
    [[[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] show];
}

//OC调用JS方法列表
- (IBAction)btnClick:(UIButton *)sender {
    if (sender.tag == 123) {
        //使用jsContext
        [self.jsContext evaluateScript:@"alertMobile()"];
    }
    
    if (sender.tag == 234) {
        //使用webView
        [self.webView stringByEvaluatingJavaScriptFromString:@"alertName('小红')"];
    }
    
    if (sender.tag == 345) {
        //使用jsValue
        JSValue *jsValue = [self.jsContext objectForKeyedSubscript:@"alertSendMsg"];
        [jsValue callWithArguments:@[@"18870707070",@"周末爬山真是件愉快的事情"]];
    }
    
}

@end
