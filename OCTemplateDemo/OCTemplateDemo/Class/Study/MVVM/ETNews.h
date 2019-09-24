//
//  ETNews.h
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/28.
//  Copyright © 2019 . All rights reserved.
//

#import "ETBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ETNews : ETBaseModel

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;

@end

NS_ASSUME_NONNULL_END
