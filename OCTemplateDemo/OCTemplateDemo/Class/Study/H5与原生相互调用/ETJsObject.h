//
//  ETJsObject.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/11/25.
//  Copyright (c) Hello  All rights reserves.
//
        

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JSExport.h>

NS_ASSUME_NONNULL_BEGIN

@protocol JSExportDelegate <JSExport>

- (NSString *)getAccessToken;

- (void)showMobile;

- (void)appInvoke:(id)params;

@end


@interface ETJsObject : NSObject<JSExportDelegate>


@property (copy, nonatomic) void (^h5ToNativeBlcok)(id params);

@end

NS_ASSUME_NONNULL_END
