

//
//  ETYYCacheVC.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/11/15.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETYYCacheVC.h"
#import "ETYYCacheModel.h"

@interface ETYYCacheVC ()

@end

@implementation ETYYCacheVC

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - 缓存/获取 基本对象
- (IBAction)cacheBaseObject:(id)sender {
    NSDictionary *dic = @{
        @"name":@"jack",
        @"age":@"20",
        @"job":@"manager"
    };
    //缓存的key
    NSString *cacheKey = @"custom_dic";
    
    //name相当于表名 必须传
    //    YYCache *cache = [[YYCache alloc] initWithName:@"cashDic"];
    YYCache *cache = [YYCache cacheWithName:@"name_cashDic"];
    
    [cache setObject:dic forKey:cacheKey withBlock:^{
        NSLog(@"异步缓存");
    }];
    [cache setObject:dic forKey:cacheKey];
    NSLog(@"同步缓存");
    
    [cache objectForKey:cacheKey withBlock:^(NSString * _Nonnull key, id<NSCoding>  _Nonnull object) {
        NSLog(@"异步获取:%@",object);
    }];
    id cacheDic = [cache objectForKey:cacheKey];
    NSLog(@"同步获取:%@",cacheDic);
}
#pragma mark - 自定义对象

- (IBAction)cacheCustomObject:(id)sender {
    
    YYCache *cache = [YYCache cacheWithName:@"name_customObjc"];
    NSString *customCacheKey = @"ETYYCacheModel";

    //自定义的对象存储的时候 必须遵守NSCoding协议
    ETYYCacheModel *model = [[ETYYCacheModel alloc] init];
    model.name = @"tom";
    model.job = @"teacher";
       
    ETYYCacheModel *model2 = [[ETYYCacheModel alloc] init];
    model2.name = @"hank";
    model2.job = @"student";
         
    NSArray *models = @[model,model2];
    [cache setObject:models forKey:customCacheKey withBlock:^{
        NSLog(@"异步缓存");
    }];
    [cache setObject:models forKey:customCacheKey];
    NSLog(@"同步缓存");

    
}
- (IBAction)getCacheCustomObject:(id)sender {
    YYCache *cache = [YYCache cacheWithName:@"name_customObjc"];
    NSString *customCacheKey = @"ETYYCacheModel";

    [cache objectForKey:customCacheKey withBlock:^(NSString * _Nonnull key, id<NSCoding>  _Nonnull object) {
        NSLog(@"异步获取:%@",object);
    }];
    id cacheDic = [cache objectForKey:customCacheKey];
    NSLog(@"同步获取:%@",cacheDic);
    
//    //根据key移除缓存
//    [cache removeObjectForKey:key];
//    //移除所有缓存
//    [cache removeAllObjects];

}
#pragma mark - 缓存设置
- (IBAction)cacheSet:(id)sender {
     YYCache *yyCache=[YYCache cacheWithName:@"LCJCache"];
    [yyCache.memoryCache setCountLimit:50];//内存最大缓存数据个数
    [yyCache.memoryCache setCostLimit:1*1024];//内存最大缓存开销 目前这个毫无用处
    [yyCache.diskCache setCostLimit:10*1024];//磁盘最大缓存开销
    [yyCache.diskCache setCountLimit:50];//磁盘最大缓存数据个数
    [yyCache.diskCache setAutoTrimInterval:60];//设置磁盘lru动态清理频率 默认 60秒
    
    //模拟清理
    for(int i=0 ;i<100;i++){
        //模拟数据
        NSString *value=@"I want to know who is lcj ?";
        //模拟一个key
        NSString *key=[NSString stringWithFormat:@"key%d",i];
        [yyCache setObject:value forKey:key];
    }

    NSLog(@"yyCache.memoryCache.totalCost:%lu",(unsigned long)yyCache.memoryCache.totalCost);
    NSLog(@"yyCache.memoryCache.costLimit:%lu",(unsigned long)yyCache.memoryCache.costLimit);

    NSLog(@"yyCache.memoryCache.totalCount:%lu",(unsigned long)yyCache.memoryCache.totalCount);
    NSLog(@"yyCache.memoryCache.countLimit:%lu",(unsigned long)yyCache.memoryCache.countLimit);

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(120 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        NSLog(@"yyCache.diskCache.totalCost:%lu",(unsigned long)yyCache.diskCache.totalCost);
        NSLog(@"yyCache.diskCache.costLimit:%lu",(unsigned long)yyCache.diskCache.costLimit);

        NSLog(@"yyCache.diskCache.totalCount:%lu",(unsigned long)yyCache.diskCache.totalCount);
        NSLog(@"yyCache.diskCache.countLimit:%lu",(unsigned long)yyCache.diskCache.countLimit);

        for(int i=0 ;i<100;i++){
            //模拟一个key
            NSString *key=[NSString stringWithFormat:@"whoislcj%d",i];
            id vuale=[yyCache objectForKey:key];
            NSLog(@"key ：%@ value : %@",key ,vuale);
        }

    });
}


@end
