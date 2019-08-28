//
//  Tool.h
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/21.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShaiziGameVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface ETManager : NSObject

///播放筛子的声音和震动
+ (void)playShaiziSoundAndShake;
///打开系统声音
+ (void)openSystemSound;
///关闭系统声音
+ (void)closeSystemSound;

/**
 获取系统声音状态 YES打开 NO关闭
 */
+ (BOOL)getSystemSoundStatus;
///打开系统震动
+ (void)openSystemShake;
///关闭系统震动
+ (void)closeSystemShake;

/**
 获取系统震动状态 YES打开 NO关闭
 */
+ (BOOL)getSystemShakeStatus;


/**
 根据筛子个数 随机筛子点数数据

 @param count 筛子个数
 @return 筛子模型数组
 */
+ (NSMutableArray *)createDataArrayWithShaiziCount:(NSInteger )count;


/**
 根据筛子游戏类型 获取筛子游戏玩法和规则

 @param gameType 筛子游戏类型
 @return 筛子游戏玩法和游戏规则
 */
+ (NSString *)getRulesWithGameType:(ShaiziGameType )gameType;

/**
 获取转盘规则数据

 @return 返回转盘模型数组
 */
+ (NSMutableArray *)getZhuanPanRulesModelsArray;

+ (void)saveZhuanPanModelArray:(NSMutableArray *)modelArray;

/**
 获取自定义转盘规则数据
 
 @return 返回转盘模型数组
 */
+ (NSMutableArray *)getCustomZhuanPanRulesModelsArray;

+ (void)saveCustomZhuanPanModelArray:(NSMutableArray *)modelArray;



@end

NS_ASSUME_NONNULL_END
