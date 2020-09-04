//
//  PasswordVC.m
//  WDEMO
//
//  Created by rrtv on 2020/9/3.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "PasswordVC.h"

@interface PasswordVC () <UIGestureRecognizerDelegate>

@end

@implementation PasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViews];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.view endEditing:YES];
}

- (void)setupViews {
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    //点击退出编辑模式
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapViewController)];
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    
    UIView *container = [[UIView alloc] init];
    [scrollView addSubview:container];
    
    UIView  *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [container addSubview:titleView];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    titleLabel.font = MEDIUMFONT(24);
    titleLabel.text = self.title;//@"密码设置";
    //    titleLabel.textColor = kCOLOR_dynamicProvider_333333_DADBDC;
    [titleView addSubview:titleLabel];
    
    UILabel *subtitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    subtitleLabel.font = RR_COMMONFONT(15);
    subtitleLabel.text = @"为保障您的账号安全，请重置密码后再登录。";
    //    subtitleLabel.textColor = kCOLOR_dynamicProvider_333333_DADBDC;
    [titleView addSubview:subtitleLabel];
    
    PasswordTextFieldView *oldPassword = [[PasswordTextFieldView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    //    oldPassword.placeholder = @"旧密码";
    oldPassword.attributedPlaceholder = [NSString oldPasswordText];
    [oldPassword.textField addTarget:self
                              action:@selector(textFieldDidChange:)
                    forControlEvents:UIControlEventEditingChanged];
    [container addSubview:oldPassword];
    
    PasswordTextFieldView *freshPassword = [[PasswordTextFieldView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    //    freshPassword.placeholder = @"新密码(8-16位至少含大小写字母/数字/特殊字符3种)";
    freshPassword.attributedPlaceholder = [NSString freshPasswordText];;
    [freshPassword.textField addTarget:self
                                action:@selector(textFieldDidChange:)
                      forControlEvents:UIControlEventEditingChanged];
    [container addSubview:freshPassword];
    
    PasswordTextFieldView *confirmPassword = [[PasswordTextFieldView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    //    confirmPassword.placeholder = @"请确认密码";
    confirmPassword.attributedPlaceholder = [NSString confirmPasswordText];;
    [confirmPassword.textField addTarget:self
                                  action:@selector(textFieldDidChange:)
                        forControlEvents:UIControlEventEditingChanged];
    [container addSubview:confirmPassword];
    
    UIButton *submitBtn =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 48)];
    submitBtn.titleLabel.font = SYSTEMFONT(22);
    //        submitbtn.backgroundColor = kCOLOR_dynamicProvider_F2F4F5_2E2E2E;
    //    submitbtn.backgroundColor = kCOLOR_CACBCC;
//    submitBtn.backgroundColor = [UIColor grayColor];
    [submitBtn setTitleColor:kCOLOR_FFFFFF forState:UIControlStateNormal];
    submitBtn.layer.cornerRadius = 24;
    [submitBtn setTitle:@"确定" forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(submit:) forControlEvents:UIControlEventTouchUpInside];
    [submitBtn setButtonDisableType:RRButtonDarkTypeTitleWhiteGradient];
    submitBtn.enabled = NO;
    [container addSubview:submitBtn];
    
    
    _scrollView = scrollView;
    _container = container;
    _titleLabel = titleLabel;
    _subtitleLabel = subtitleLabel;
    _titleView = titleView;
    _oldPassword = oldPassword;
    _freshPassword = freshPassword;
    _confirmPassword = confirmPassword;
    _submitBtn = submitBtn;
    
//    [self setDisabledGradientBackColor];
}

- (void)submit:(UIButton *)btn {
    [self.view endEditing:YES];
}

- (void)textFieldDidChange:(UITextField *)textField {
    
    //    //过滤空格
    //    NSString *tem = [[textField.text componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] componentsJoinedByString:@""];
    //    textField.text = tem;
    [self isShowNextBtn];
}

- (void)isShowNextBtn {
    //    if (_oldPassword.textField.text.length > 0 && _freshPassword.textField.text.length > 0 && _confirmPassword.textField.text.length > 0) {
    //        _submitBtn.enabled = YES;
    //        [self setEnabledGradientColor];
    //    } else {
    //        _submitBtn.enabled = NO;
    //        [self setDisabledGradientBackColor];
    //    }
}

//按钮渐变色
- (void)setDisabledGradientBackColor {
    UIColor *topColor = kCOLOR_CACBCC;
    UIColor *bottomColor = kCOLOR_DADBDC;
    CGSize size = _submitBtn.frame.size;
    UIImage *bgImg = [UIImage gradientColorImageFromColors:@[topColor, bottomColor] gradientType:GradientTypeLeftToRight imgSize:size];
    _submitBtn.backgroundColor = [UIColor colorWithPatternImage:bgImg];
    
}

//按钮渐变色
- (void)setEnabledGradientColor {
    UIColor *topColor = kCOLOR_00D5FF;
    UIColor *bottomColor = kCOLOR_00BBFF;
    CGSize size = _submitBtn.frame.size;
    UIImage *bgImg = [UIImage gradientColorImageFromColors:@[topColor, bottomColor] gradientType:GradientTypeLeftToRight imgSize:size];
    _submitBtn.backgroundColor = [UIColor colorWithPatternImage:bgImg];
    
}

- (void)didTapViewController {
    [self.view endEditing:YES];
}

#pragma mark - UIGestureRecognizerDelegate
 - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    //点击YYLabel
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"YYLabel"]) {
         return NO;
    }
    return  YES;
}
@end
