//
//  ViewController.m
//  20160504非ARC的单例模式
//
//  Created by devzkn on 5/4/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "ViewController.h"
#import "HSDataTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    HSDataTool *tool0 = [[HSDataTool alloc]init];
//    NSLog(@"%p",tool0);
//    [tool0 release];
//    NSLog(@"%p",tool0);
//单例对象已经被释放
    NSLog(@"%p",[HSDataTool shareInsatnce]);//[HSDataTool init]: message sent to deallocated instance 0x786ed580
    HSDataTool *tool1 = [HSDataTool shareInsatnce];
    [tool1 release];
    
    NSLog(@"%p",[HSDataTool shareInsatnce]);
    NSLog(@"%p",[HSDataTool shareInsatnce]);
    NSLog(@"%p",[[HSDataTool shareInsatnce]copy]);//-[HSDataTool copy]: message sent to deallocated instance 0x9f01af0
    [[HSDataTool shareInsatnce]release];
    HSDataTool *tool = [[HSDataTool alloc]init];
    NSLog(@"%@",tool);
    NSLog(@"%p",[HSDataTool shareInsatnce]);


    
}

@end
