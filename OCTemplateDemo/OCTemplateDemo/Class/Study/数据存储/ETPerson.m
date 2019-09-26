//
//  ETPerson.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/9/26.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETPerson.h"

@implementation ETPerson

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
    }
    return self;
}
@end
