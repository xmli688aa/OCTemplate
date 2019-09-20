//
//  MealModel.h
//  youpinshitang_menu
//
//  Created by Ethon.Z on 2019/9/17.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MealModel : NSObject

@property (copy, nonatomic) NSString *mealID;
@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *iconName;
@property (assign, nonatomic) NSInteger jifen;
@property (assign, nonatomic) NSInteger count;
///是否是特供
@property (assign, nonatomic) BOOL tegong;

//添加菜品的时候 用来判断是否选中
@property (assign, nonatomic) BOOL selected;
/// 单品数量
@property (assign, nonatomic) NSInteger orderCount;
/// UI 标识送达
@property (assign, nonatomic) BOOL isDeliver;

- (instancetype)initWithType:(NSString *)type name:(NSString *)name iconName:(NSString *)iconName jifen:(NSInteger )jifen;

@end

NS_ASSUME_NONNULL_END
