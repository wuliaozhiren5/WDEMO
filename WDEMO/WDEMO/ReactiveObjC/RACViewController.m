//
//  RACViewController.m
//  WDEMO
//
//  Created by rrtv on 2020/8/27.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "RACViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface RACViewController ()

//@property (strong, nonatomic) UITextField *accountTF;
//@property (strong, nonatomic) UITextField *passwordTF;
@property (strong, nonatomic) UIButton *loginBtn;
@property (strong, nonatomic) UIButton *registerBtn;

@end

@implementation RACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupViews];
    [self bindViewModel];
    //    [self loginEvent];
    
    
    [self target];
    
}

//rac用来检测bug
- (void)RACbug {
    [[self.view rac_signalForSelector:@selector(removeFromSuperview)] subscribeNext:^(RACTuple * x) {
        NSLog(@"rac用来检测bug");
        NSLog(@"%@,%@",x.first,x.second);
    }];
}

- (void)setupViews {
    //    UINavigationBar与UITabBar半透明：会被遮挡；不透明，不会被遮挡
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    //**************************************************************************
    
    //    _accountTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 10, 300, 50)];
    //    _accountTF.placeholder = @"请输入账号";
    //    _accountTF.borderStyle = UITextBorderStyleRoundedRect;
    //    //    _accountTF.backgroundColor = [UIColor grayColor];
    //    [self.view addSubview:_accountTF];
    //
    //    _passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 70, 300, 50)];
    //    _passwordTF.placeholder = @"请输入密码";
    //    _passwordTF.borderStyle = UITextBorderStyleRoundedRect;
    //    //    _passwordTF.backgroundColor = [UIColor grayColor];
    //    [self.view addSubview:_passwordTF];
    
    _loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 150, 100, 50)];
    [_loginBtn setTitle:@"login" forState:UIControlStateNormal];
    _loginBtn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_loginBtn];
    
    
    _registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 200, 100, 50)];
    [_registerBtn setTitle:@"register" forState:UIControlStateNormal];
    _registerBtn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_registerBtn];
    
}
#pragma mark - ViewModel处理
- (void)bindViewModel {
    
    //    textField输入内容的实时监听
    //    [_accountTF.rac_textSignal subscribeNext:^(id x) {
    //        NSLog(@"%@",x);
    //    }];
    
    //
    //    //给ViewModel账号密码绑定信号
    //    RAC(self.loginVM,account) = _accountTF.rac_textSignal;
    //    RAC(self.loginVM,password) = _passwordTF.rac_textSignal;
    //
    //    //把_loginBtn的enabled属性与信号绑定
    //    //    RAC(_loginBtn,enabled) = self.loginVM.btnEnableSignal;
    //
    //    @weakify(self);
    //    [self.loginVM.btnEnableSignal subscribeNext:^(id  _Nullable x) {
    //        @strongify(self);
    //
    //        if ([x isKindOfClass:[NSNumber class]]) {
    //            NSNumber *xNumber = (NSNumber *)x;
    //            BOOL enabled = xNumber.boolValue;
    //            if (enabled) {
    //                [self.loginBtn setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    //            } else {
    //                [self.loginBtn setTitleColor:[UIColor systemGrayColor] forState:UIControlStateNormal];
    //            }
    //
    //            self.loginBtn.enabled = enabled;
    //
    //        }
    //        //        self.loginBtn.enabled = enabled;
    //
    //    }];
    //
    ////    [self.loginVM.loginCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
    ////        NSLog(@"登录成功，跳转页面");
    ////    }];
    //
    //    //登录按钮点击事件
    //    [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
    //        NSLog(@"点击了  点击了");
    //        [self.loginVM.loginCommand execute:@{@"account":_accountTF.text,@"password":_passwordTF.text}];
    //    }];
    
    
    [_loginBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    [[self rac_signalForSelector:@selector(click:)] subscribeNext:^(RACTuple * x) {
        NSLog(@"点击了");
        NSLog(@"%@,%@",x.first,x.second);
    }];
    //    //这里订阅收到的是一个x,当一个页面存在多个tableview时,我们可以对x进行判断看是哪个tableview
    //    [[self rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:) fromProtocol:@protocol(UITableViewDelegate) ] subscribeNext:^(RACTuple * x) {
    //
    //        NSLog(@"点击了");
    //
    //        NSLog(@"%@,%@",x.first,x.second);
    //
    //    }];
    
    //    // RAC监听按钮的点击事件
    //    [[_registerBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
    //        NSLog(@"点击按钮...");
    //        NSLog(@"x:%@", x);
    //    }];
    
    //代替KVO
    //    [RACObserve(self.tableView, contentOffset) subscribeNext:^(id x) {
    //        NSLog(@"success");
    //    }];
}

- (void)click:(UIButton *) btn{
    
}

//1 代替代理:
- (void)delegate {
    
    [_loginBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    [[self rac_signalForSelector:@selector(click:)] subscribeNext:^(RACTuple * x) {
        NSLog(@"点击了");
        NSLog(@"%@,%@",x.first,x.second);
    }];
    
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"RAC" message:@"RAC TEST" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"other", nil];
    [[self rac_signalForSelector:@selector(alertView:clickedButtonAtIndex:) fromProtocol:@protocol(UIAlertViewDelegate)] subscribeNext:^(RACTuple *tuple) {
        NSLog(@"%@",tuple.first);
        NSLog(@"%@",tuple.second);
        NSLog(@"%@",tuple.third);
    }];
    [alertView show];
    
    [[alertView rac_buttonClickedSignal] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    
}
//2 代替KVO:
- (void)kvo {
    
    UIScrollView *scrolView = [[UIScrollView alloc] initWithFrame:CGRectMake(100, 10, 200, 400)];
    scrolView.contentSize = CGSizeMake(200, 800);
    scrolView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:scrolView];
    [RACObserve(scrolView, contentOffset) subscribeNext:^(id x) {
        NSLog(@"success");
    }];
}
//4 代替通知:
//3 监听事件:
- (void)target {
    
    // 把按钮点击事件转换为信号，点击按钮，就会发送信号
    [[_registerBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"按钮被点击了");
        NSLog(@"点击按钮...");
        NSLog(@"x:%@", x);
    }];
    
    //给Lable或者View添加监听
    UILabel *textLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 250, 200, 30)];
    textLab.backgroundColor = [UIColor greenColor];
    textLab.text = @"********************";
    textLab.userInteractionEnabled = YES;
    [self.view addSubview:textLab];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [tap.rac_gestureSignal subscribeNext:^(id x) {
        NSLog(@"点击Lab");
    }];
    [textLab addGestureRecognizer:tap];
}

//5 监听文本框文字改变:
- (void)text {
    UITextField *text1 = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 150, 50)];
    text1.backgroundColor = [UIColor cyanColor];
    text1.placeholder = @"请输入账号";
    text1.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:text1];
    
    [[text1 rac_textSignal] subscribeNext:^(id x) {
        static int i = 0;
        i++;
        //  text改变就会打印
        NSLog(@"厉害了我的哥------ %d", i);
    }];
}
@end
