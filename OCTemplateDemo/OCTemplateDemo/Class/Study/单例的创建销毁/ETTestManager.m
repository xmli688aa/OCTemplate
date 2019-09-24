//
//  ETManager.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/8/23.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETTestManager.h"

@implementation ETTestManager

static ETTestManager *_manager;
static dispatch_once_t onceToken ;

+ (instancetype)share{
    if (_manager == nil) {
        _manager = [[ETTestManager alloc] init];
    }
    return _manager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    dispatch_once(&onceToken, ^{
        _manager = [super allocWithZone:zone];
    });
    return _manager;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return self;
}

+ (void)releaseManager{
    onceToken = 0;
    _manager = nil;
}

@end
