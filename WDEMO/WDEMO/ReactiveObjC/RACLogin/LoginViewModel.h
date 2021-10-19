//
//  LoginViewModel.h
//  WDEMO
//
//  Created by WDEMO on 2020/8/26.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject

@property (nonatomic, strong) NSString *account;
@property (nonatomic, strong) NSString *password;
//按钮是否被允许点击
@property (nonatomic, strong) RACSignal *btnEnableSignal;
//登录按钮命令
@property (nonatomic, strong) RACCommand *loginCommand;

@end

NS_ASSUME_NONNULL_END
