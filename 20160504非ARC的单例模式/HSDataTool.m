//
//  HSDataTool.m
//  20160504非ARC的单例模式
//
//  Created by devzkn on 5/4/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HSDataTool.h"

@implementation HSDataTool
//HSSingletonM(DataTool)

static id _instance;
+(instancetype)shareDataTool{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]init];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone{
    return _instance;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}
#pragma mark - MRC环境的适配：重写
/*
 Decrements the receiver’s reference count.
 The receiver is sent a dealloc message when its reference count reaches 0.
 */
#if !__has_feature(objc_arc)
- (oneway void)release{
}
- (instancetype)retain{
    return self;
}
- (NSUInteger)retainCount{
    return 1;
}
- (instancetype)autorelease{
    return self;
}
#endif





#pragma mark - test
#if !__has_feature(objc_arc)
- (void)dealloc{
    [super dealloc];
    NSLog(@"%s-----%p",__func__,self);
}
#endif
@end
