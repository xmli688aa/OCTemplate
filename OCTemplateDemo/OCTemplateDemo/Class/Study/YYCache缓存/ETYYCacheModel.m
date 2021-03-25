
//
//  ETYYCacheModel.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/11/15.
//  Copyright (c) Hello  All rights reserves.
//


#import "ETYYCacheModel.h"

@implementation ETYYCacheModel



//使用MJ归档
- (void)encodeWithCoder:(NSCoder*)aCoder{
    [self mj_encode:aCoder];
}
- (id)initWithCoder:(NSCoder*)aDecoder{
    self= [super init];
    [self mj_decode:aDecoder];
    return self;
}


//自定义归档
//- (void)encodeWithCoder:(NSCoder*)aCoder{
//    [aCoder encodeObject:self.name forKey:@"name"];
//    [aCoder encodeObject:self.job forKey:@"job"];
//}
//- (id)initWithCoder:(NSCoder*)aDecoder{
//    if (self = [super init]) {
//        self.name = [aDecoder decodeObjectForKey:@"name"];
//        self.job = [aDecoder decodeObjectForKey:@"job"];
//    }
//    return self;
//}


@end
