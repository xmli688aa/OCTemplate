//
//  ETNewsVM.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/28.
//  Copyright © 2019 . All rights reserved.
//

#import "ETNewsVM.h"
#import "ETNews.h"

@implementation ETNewsVM

- (void)loadNewsData:(void(^)(NSArray *))completion{
    if (completion == nil) {
        return;
    }
    //这里网络请求数据 并对返回的数据进行处理 包装成对象返回
    NSMutableArray *newsData = [NSMutableArray array];
    for (int i = 0; i<10; i++) {
        ETNews *news = [[ETNews alloc] init];
        news.title = [NSString stringWithFormat:@"我是t标题:%d",i];
        news.content = [NSString stringWithFormat:@"我是内容:%d",i];
        [newsData addObject:news];
    }
    completion(newsData);
    
}

@end
