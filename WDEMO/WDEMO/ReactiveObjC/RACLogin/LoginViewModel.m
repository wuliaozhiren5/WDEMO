//
//  LoginViewModel.m
//  WDEMO
//
//  Created by rrtv on 2020/8/26.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    //RACObserve可以把KVO转化为信号
    _btnEnableSignal =  [RACSignal combineLatest:@[RACObserve(self,account),RACObserve(self, password)] reduce:^id _Nullable(NSString * account,NSString * password){
        return @(account.length && (password.length > 5));
    }];
    
    //处理登录点击:创建登录命令。（只要处理事件，就要用到RACCommand） 
    _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        NSLog(@"组合参数，准备发送登录请求 - %@",input);
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            
            NSLog(@"开始请求");
            
            NSLog(@"请求成功");
            
            NSLog(@"处理数据");
            
            [subscriber sendNext:@"请求完成，数据给你"];
            
            [subscriber sendCompleted];
            
            return [RACDisposable disposableWithBlock:^{
                NSLog(@"结束了");
            }];
        }];
    }];
    

    //订阅命令中的信号
    [_loginCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        //这里写保存服务器返回的信息
        
    }];
    //监听命令执行过程
    //skip:1跳过第一次信号，因为刚开始没有执行的时候x也为NO
    [[_loginCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        if ([x boolValue]) {
            NSLog(@"正在执行中……");
        }else{
            NSLog(@"执行结束了");
        }
    }];
}

@end
