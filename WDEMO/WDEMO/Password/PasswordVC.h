//
//  PasswordVC.h
//  WDEMO
//
//  Created by rrtv on 2020/9/3.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PasswordTextFieldView.h"
#import "ACMacros.h"
#import <Masonry/Masonry.h>
#import <YYKit/YYKit.h>
#import "UIButton+buttonType.h"//暗黑模式
#import "UIImage+GradientColor.h"//渐变色
#import "NSString+Password.h"
NS_ASSUME_NONNULL_BEGIN

@interface PasswordVC : UIViewController

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIView *container;
//标题
@property (nonatomic, strong) UILabel *titleLabel;
//副标题
@property (nonatomic, strong) UILabel *subtitleLabel;
//标题view
@property (nonatomic, strong) UIView  *titleView;
//老密码
@property (nonatomic, strong) PasswordTextFieldView *oldPassword;
//新密码
@property (nonatomic, strong) PasswordTextFieldView *freshPassword;
//确认密码
@property (nonatomic, strong) PasswordTextFieldView *confirmPassword;
//确认按钮
@property (nonatomic, strong) UIButton *submitBtn;

- (void)setupViews;
//按钮渐变色
- (void)setDisabledGradientBackColor;
//按钮渐变色
- (void)setEnabledGradientColor;

- (void)submit:(UIButton *)btn;

- (void)isShowNextBtn;

@end

NS_ASSUME_NONNULL_END
