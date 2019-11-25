//
//  WeakWebViewScriptObject.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/11/25.
//  Copyright (c) Hello  All rights reserves.
//
        

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeakWebViewScriptObject : NSObject <WKScriptMessageHandler>


//WKScriptMessageHandler 这个协议类专门用来处理JavaScript调用原生OC的方法
@property (nonatomic, weak) id<WKScriptMessageHandler> scriptDelegate;


- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate;



@end

NS_ASSUME_NONNULL_END
