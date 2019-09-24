//
//  DineModel.m
//  youpinshitang_menu
//
//  Created by Ethon.Z on 2019/9/20.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "DineModel.h"
#import "MealModel.h"

@implementation DineModel


- (NSString *)title{
    NSString *title = @"";
    switch (self.dineType) {
        case Dine_Zaocan:
            title = @"早餐";
            break;
        case Dine_Wucan:
            title = @"午餐";
            break;
        case Dine_Wancan:
            title = @"晚餐";
            break;
        case Dine_Xiaoye:
            title = @"宵夜";
            break;
            
        default:
            break;
    }
    return title;
}
///通过网络获取数据
+ (void)getMenuDataFromNetwork:(void (^)(NSArray *))resultBlock{
    //网络请求
    
    NSArray *array = [self parseDataArray:@[]];
    if (resultBlock) {
        resultBlock(array);
    }
    
    
}
+ (NSArray *)parseDataArray:(NSArray *)dataArray{
    dataArray = @[
                  @{
                      @"title":@"早餐",
                      @"dineType":@"0",
                      @"tegongArray":@[],
                      @"dinerArray":@[],
                    },
                  @{
                      @"title":@"午餐",
                      @"dineType":@"1",
                      @"tegongArray":@[],
                      @"dinerArray":@[],
                      },
                  @{
                      @"title":@"晚餐",
                      @"dineType":@"2",
                      @"tegongArray":@[],
                      @"dinerArray":@[],
                      },
                  @{
                      @"title":@"宵夜",
                      @"dineType":@"3",
                      @"tegongArray":@[],
                      @"dinerArray":@[],
                      },
                  
                  ];
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (NSDictionary *dict in dataArray) {
        DineModel *dineModel = [DineModel mj_objectWithKeyValues:dict];
        
        NSArray *lingshiArray = [self getPlistArrayWithFileName:@"lingshi"];
        NSArray *drinkArray = [self getPlistArrayWithFileName:@"drink"];
        dineModel.lingshiArray = lingshiArray;
        dineModel.drinkArray = drinkArray;
        [mutableArray addObject:dineModel];
    }


    
    return mutableArray.copy;
}

+ (NSArray *)getPlistArrayWithFileName:(NSString *)fileName{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    NSArray *tempArray = [NSArray arrayWithContentsOfFile:path];
    NSArray *modelArray= [MealModel mj_objectArrayWithKeyValuesArray:tempArray];
    return modelArray;
}


@end
