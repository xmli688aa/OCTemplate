

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

}



@end
