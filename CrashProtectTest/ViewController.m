//
//  ViewController.m
//  CrashProtectTest
//
//  Created by mac on 2019/7/11.
//  Copyright © 2019 YZTDevelper. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button performSelector:@selector(fooDoesNotRecognizeSelector1)];

}

/*
 +(BOOL)resolveInstanceMethod:(SEL)sel;
 -(id)forwardingTargetForSelector:(SEL)aSelector;
 -(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector;
 -(void)forwardInvocation:(NSInvocation *)anInvocation;
 */


@end
