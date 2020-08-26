//
//  RACLoginViewController.m
//  WDEMO
//
//  Created by rrtv on 2020/8/26.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "RACLoginViewController.h"
#import "LoginViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface RACLoginViewController ()

@property (strong, nonatomic) UITextField *accountTF;
@property (strong, nonatomic) UITextField *passwordTF;
@property (strong, nonatomic) UIButton *loginBtn;
@property (strong, nonatomic) LoginViewModel *loginVM;

@end

@implementation RACLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupViews];
    [self bindViewModel];
    [self loginEvent];
}
- (void)setupViews {
    //    UINavigationBar与UITabBar半透明：会被遮挡；不透明，不会被遮挡
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    //**************************************************************************
    
    _accountTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 10, 300, 50)];
    _accountTF.placeholder = @"请输入账号";
    _accountTF.borderStyle = UITextBorderStyleRoundedRect;
    //    _accountTF.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_accountTF];
    
    _passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 70, 300, 50)];
    _passwordTF.placeholder = @"请输入密码";
    _passwordTF.borderStyle = UITextBorderStyleRoundedRect;
    //    _passwordTF.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_passwordTF];
    
    _loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 150, 100, 50)];
    [_loginBtn setTitle:@"login" forState:UIControlStateNormal];
    _loginBtn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_loginBtn];
    
}
#pragma mark - ViewModel处理
- (void)bindViewModel {
    
    //给ViewModel账号密码绑定信号
    RAC(self.loginVM,account) = _accountTF.rac_textSignal;
    RAC(self.loginVM,password) = _passwordTF.rac_textSignal;
    
    //把_loginBtn的enabled属性与信号绑定
    //    RAC(_loginBtn,enabled) = self.loginVM.btnEnableSignal;
    
    @weakify(self);
    [self.loginVM.btnEnableSignal subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        
        if ([x isKindOfClass:[NSNumber class]]) {
            NSNumber *xNumber = (NSNumber *)x;
            BOOL enabled = xNumber.boolValue;
            if (enabled) {
                [self.loginBtn setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
            } else {
                [self.loginBtn setTitleColor:[UIColor systemGrayColor] forState:UIControlStateNormal];
            }
            
            self.loginBtn.enabled = enabled;
            
        }
        //        self.loginBtn.enabled = enabled;
        
    }];
    
//    [self.loginVM.loginCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
//        NSLog(@"登录成功，跳转页面");
//    }];
    
    //登录按钮点击事件
    [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"点击了  点击了");
        [self.loginVM.loginCommand execute:@{@"account":_accountTF.text,@"password":_passwordTF.text}];
    }];
}

- (void)loginEvent {
    //    //把_loginBtn的enabled属性与信号绑定
    //    RAC(_loginBtn,enabled) = self.loginVM.loginEnabledSignal;
    //    //登录按钮点击事件
    //    [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
    //        [self.loginVM.loginCommand execute:nil ];
    //    }];
}

#pragma mark - 懒加载
- (LoginViewModel *)loginVM {
    if (!_loginVM) {
        _loginVM = [[LoginViewModel alloc] init];
    }
    return _loginVM;
}
@end
