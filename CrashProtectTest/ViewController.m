//
//  ViewController.m
//  CrashProtectTest
//
//  Created by mac on 2019/7/11.
//  Copyright © 2019 YZTDevelper. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "ProtectObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self performSelector:@selector(testSelecter)];

}

/*
//方式1.重写resolveInstanceMethod,添加方法
//但这些方法对于该类本身来说冗余的
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    NSString *methodName = NSStringFromSelector(sel);
    NSLog(@"%@",methodName);
    if ([methodName isEqualToString:@"testSelecter"]) {
        class_addMethod([self class], sel, (IMP)NewFooDoesNotRecognizeSelector,"v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

void NewTestSelecter(id self, SEL _cmd) {
    NSLog(@"在resolveInstanceMethodh当中修复了");
}
*/

/*
//方式2:如果resolveInstanceMethod未执行,则可以重写forwardingTargetForSelector方法
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    NSString *selectorName = NSStringFromSelector(aSelector);
    if ([selectorName isEqualToString:@"testSelecter"]) {
        ProtectObject *protectObject = [[ProtectObject alloc] init];
        return protectObject;
    }
    return [super forwardingTargetForSelector:aSelector];
}

 */

/*
//方式3:重写methodSignatureForSelector先请求一个签名,再走入forwardInvocation(函数执行器),forwardInvocation可以通过NSInvocation的形式将消息转发给多个对象
//但是其开销较大，需要创建新的NSInvocation对象，并且forwardInvocation的函数经常被使用者调用，来做多层消息转发选择机制，不适合多次重写
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        if([ProtectObject instancesRespondToSelector:aSelector])
        {
            signature = [ProtectObject instanceMethodSignatureForSelector:aSelector];
        }
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    if ([ProtectObject instancesRespondToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:[[ProtectObject alloc] init]];
    }
}

*/

/*
- (void)doesNotRecognizeSelector:(SEL)aSelector
{
    NSLog(@"该方法未实现:%@",NSStringFromSelector(aSelector));
}
*/

@end
