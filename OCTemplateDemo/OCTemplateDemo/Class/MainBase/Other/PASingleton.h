//
//  PAMAPSingleton.h
//  PAMAP
//
//  Created by apple on 16/6/7.
//  Copyright © 2016年 pingan. All rights reserved.
//


/*
 创建单例方法：类的.h文件 singleton_h(name)
            类的.m文件 singleton_m(name)
 使用单例方法  [类名 shared(name)]
 */
// ## : 连接字符串和参数
#define singleton_h(name) + (instancetype)shared##name;
#if __has_feature(objc_arc) // ARC
#define singleton_m(name) \
static id _instance; \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
});\
return _instance; \
} \
+ (id)copyWithZone:(struct _NSZone *)zone \
{ \
return _instance; \
}
#else // 非ARC
#define singleton_m(name) \
static id _instance; \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
- (oneway void)release \
{ \
\
} \
\
- (id)autorelease \
{ \
return _instance; \
} \
\
- (id)retain \
{ \
return _instance; \
} \
\
- (NSUInteger)retainCount \
{ \
return 1; \
} \
\
+ (id)copyWithZone:(struct _NSZone *)zone \
{ \
return _instance; \
}
#endif
