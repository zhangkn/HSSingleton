//
//  HSDataTool.m
//  20160504非ARC的单例模式
//
//  Created by devzkn on 5/4/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HSDataTool.h"

@implementation HSDataTool
HSSingletonM

#pragma mark - test
- (void)dealloc{
    [super dealloc];
    NSLog(@"%s-----%p",__func__,self);
}

@end
