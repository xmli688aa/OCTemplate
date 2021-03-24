//
//  ETControllerModel.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/11/25.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ETHomeModel : ETBaseModel

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *title;

+ (instancetype )controllerName:(NSString *)name title:(NSString *)title;

- (instancetype)initWithName:(NSString *)name title:(NSString *)title;


@end

NS_ASSUME_NONNULL_END
