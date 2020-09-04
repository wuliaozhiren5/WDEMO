//
//  SetPasswordVC.h
//  WDEMO
//
//  Created by rrtv on 2020/8/31.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PasswordType) {
    PasswordTypeNone      = 0,
    PasswordTypeNoSet     = 1,      //没有密码，设置密码(没有设置过密码)
    PasswordTypeTooSimple = 2,      //存量用户，重置密码(密码过于简单)
    PasswordTypeForget    = 3,      //忘记密码时的重置密码(忘记密码)
};

NS_ASSUME_NONNULL_BEGIN

@interface SetPasswordVC : UIViewController

@property (nonatomic, assign) PasswordType passwordType;
//只有在重置密码(忘记密码)使用
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *code;

@end

NS_ASSUME_NONNULL_END
