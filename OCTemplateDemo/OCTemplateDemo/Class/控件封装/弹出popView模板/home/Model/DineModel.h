//
//  DineModel.h
//  youpinshitang_menu
//
//  Created by Ethon.Z on 2019/9/20.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    Dine_Zaocan,
    Dine_Wucan,
    Dine_Wancan,
    Dine_Xiaoye,
} DineType;

@interface DineModel : NSObject


/**
 餐饮的标题 早餐 午餐 晚餐 宵夜
 */
@property (copy, nonatomic) NSString *title;
///用餐的类型 早餐 午餐 晚餐 宵夜
@property (assign, nonatomic) DineType dineType;

///特供数据
@property (strong, nonatomic) NSArray *tegongArray;
///对应的餐饮模型
@property (strong, nonatomic) NSArray *dinerArray;
///零食
@property (strong, nonatomic) NSArray *lingshiArray;
///饮料
@property (strong, nonatomic) NSArray *drinkArray;

///通过网络获取数据
+ (void)getMenuDataFromNetwork:(void (^)(NSArray *))resultBlock;

+ (NSArray *)parseDataArray:(NSArray *)dataArray;

@end

NS_ASSUME_NONNULL_END
