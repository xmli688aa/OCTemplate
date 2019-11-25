
//
//  ETJsObject.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/11/25.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETJsObject.h"

@implementation ETJsObject

- (NSString *)getAccessToken{
    return @"accessToken";
}

- (void)showMobile{
    
}

- (void)appInvoke:(id)params{
    if (self.h5ToNativeBlcok) {
        self.h5ToNativeBlcok(params);
    }
}



@end
