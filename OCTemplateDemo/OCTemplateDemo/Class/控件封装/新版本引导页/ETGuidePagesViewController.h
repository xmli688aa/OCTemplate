//
//  ETGuidePagesViewController.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/8/19.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^GuidePagesViewClickBlock)(void);

@interface ETGuidePagesViewController : UIViewController

@property (copy, nonatomic) GuidePagesViewClickBlock clickBlock;

+ (BOOL)isShow;

@end

NS_ASSUME_NONNULL_END
