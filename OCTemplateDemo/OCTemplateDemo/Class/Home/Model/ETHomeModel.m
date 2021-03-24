//
//  ETControllerModel.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/11/25.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETHomeModel.h"

@implementation ETHomeModel


+ (instancetype)controllerName:(NSString *)name title:(NSString *)title{
    ETHomeModel *model = [[self alloc] initWithName:name title:title];
    return model;
}

- (instancetype)initWithName:(NSString *)name title:(NSString *)title{
    self = [super init];
    if (self) {
        self.name = name;
        self.title = title;
    }

    
    return self;
}

@end
