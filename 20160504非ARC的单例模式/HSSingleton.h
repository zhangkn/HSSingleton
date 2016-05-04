//
//  HSSingleton.h
//  20160504非ARC的单例模式
//
//  Created by devzkn on 5/4/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#ifndef HSSingleton_h
#define HSSingleton_h
//头文件的单例内容
#define HSSingletonH +(instancetype)shareInsatnce
//.m文件的单例代码
#define HSSingletonM \
static id _instance;\
+(instancetype)shareInsatnce{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [[self alloc]init];\
    });\
    return _instance;\
}\
- (id)copyWithZone:(NSZone *)zone{\
    return _instance;\
}\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [super allocWithZone:zone];\
    });\
    return _instance;\
}\
- (oneway void)release{\
}\
- (instancetype)retain{\
    return self;\
}\
- (NSUInteger)retainCount{\
    return 1;\
}
#endif /* HSSingleton_h */
