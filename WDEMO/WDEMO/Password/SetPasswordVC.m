//
//  SetPasswordVC.m
//  WDEMO
//
//  Created by rrtv on 2020/8/31.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "SetPasswordVC.h"
#import "PasswordTextFieldView.h"
#import <Masonry/Masonry.h>
#import "ACMacros.h"
#import <YYKit/YYKit.h>
#import "UIImage+GradientColor.h"//渐变色
#import "NSString+Password.h"

@interface SetPasswordVC () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *subtitleLabel;

@property (nonatomic, strong) UIView  *titleView;
//新密码
@property (nonatomic, strong) PasswordTextFieldView *freshPassword;
//确认密码
@property (nonatomic, strong) PasswordTextFieldView *confirmPassword;
//确认按钮
@property (nonatomic, strong) UIButton *submitBtn;

@end

@implementation SetPasswordVC

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
    
    CGFloat fontSize = 15.;
    CGFloat smallFontSize = 12.;
    UIFont *textFont = [UIFont systemFontOfSize:fontSize];
    UIFont *smallTextFont = [UIFont systemFontOfSize:smallFontSize];
    UIColor *textColor = kCOLOR_9B9B9B;
    CGFloat lineSpacing = 5.;
    
    NSMutableAttributedString *oldPasswordText = [[NSMutableAttributedString alloc] initWithString:@"旧密码"];
    oldPasswordText.lineSpacing = lineSpacing;
    oldPasswordText.font = textFont;
    oldPasswordText.color = textColor;
    
    NSMutableAttributedString *freshPasswordText = [[NSMutableAttributedString alloc] initWithString:@"新密码"];
    freshPasswordText.lineSpacing = lineSpacing;
    freshPasswordText.font = textFont;
    freshPasswordText.color = textColor;
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"(8-16位至少含大小写字母/数字/特殊字符3种)"];
        one.lineSpacing = lineSpacing;
        one.font = smallTextFont;
        one.color = textColor;
        [freshPasswordText appendAttributedString:one];
    }
    
    NSMutableAttributedString *confirmPasswordText = [[NSMutableAttributedString alloc] initWithString:@"请确认密码"];
    confirmPasswordText.lineSpacing = lineSpacing;
    confirmPasswordText.font = textFont;
    confirmPasswordText.color = textColor;
    
    UIScrollView *scrollview = [[UIScrollView alloc] init];
    [self.view addSubview:scrollview];
    
    UIView *container = [[UIView alloc] init];
    [scrollview addSubview:container];
    
    UIView  *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [container addSubview:titleView];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    titleLabel.font = MEDIUMFONT(24);
    titleLabel.text = self.title;//@"设置密码";
//    titleLabel.textColor = kCOLOR_dynamicProvider_333333_DADBDC;
    [titleView addSubview:titleLabel];
    
    UILabel *subtitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    subtitleLabel.font = RR_COMMONFONT(15);
    subtitleLabel.text = @"为保障您的账号安全，请重置密码后再登录。";
//    titleLabel.textColor = kCOLOR_dynamicProvider_333333_DADBDC;
    [titleView addSubview:subtitleLabel];
    
    PasswordTextFieldView *freshPassword = [[PasswordTextFieldView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    //    freshPassword.placeholder = @"新密码(8-16位至少含大小写字母/数字/特殊字符3种)";
    freshPassword.attributedPlaceholder = freshPasswordText;
    [freshPassword.textField addTarget:self
                                action:@selector(textFieldDidChange:)
                      forControlEvents:UIControlEventEditingChanged];
    [container addSubview:freshPassword];
    
    PasswordTextFieldView *confirmPassword = [[PasswordTextFieldView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    //    confirmPassword.placeholder = @"请确认密码";
    confirmPassword.attributedPlaceholder = confirmPasswordText;
    [confirmPassword.textField addTarget:self
                                  action:@selector(textFieldDidChange:)
                        forControlEvents:UIControlEventEditingChanged];
    [container addSubview:confirmPassword];
    
    UIButton *submitbtn =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 48)];
    submitbtn.titleLabel.font = SYSTEMFONT(22);
    //        submitbtn.backgroundColor = kCOLOR_dynamicProvider_F2F4F5_2E2E2E;
    //    submitbtn.backgroundColor = kCOLOR_CACBCC;
    submitbtn.backgroundColor = [UIColor grayColor];
    [submitbtn setTitleColor:kCOLOR_FFFFFF forState:UIControlStateNormal];
    submitbtn.layer.cornerRadius = 24;
    [submitbtn setTitle:@"确定" forState:UIControlStateNormal];
    [submitbtn addTarget:self action:@selector(submit:) forControlEvents:UIControlEventTouchUpInside];
    submitbtn.enabled = NO;
    [container addSubview:submitbtn];
    
    //布局
    [scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.top.equalTo(self.view);
//        make.top.equalTo(self.customTabbar.mas_bottom);
//        make.leading.trailing.bottom.offset(0);
    }];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollview);
        make.width.equalTo(scrollview);
    }];
    
    switch (_passwordType) {
        case PasswordTypeNoSet:
        {
            //设置密码
            subtitleLabel.hidden = YES;
            [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(container);
                make.leading.equalTo(container);
                make.trailing.equalTo(container);
                make.height.offset(35);
            }];
            [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.leading.equalTo(titleView.mas_leading).offset(21);
                make.trailing.equalTo(titleView.mas_trailing).offset(-21);
                make.height.equalTo(@29);
                make.top.equalTo(titleView.mas_top).offset(6);
            }];
            
        }
            break;
            
        default:
        {
            //重置密码
            subtitleLabel.hidden = NO;
            [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(container);
                make.leading.equalTo(container);
                make.trailing.equalTo(container);
                make.height.offset(65);
            }];
            
            [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.leading.equalTo(titleView.mas_leading).offset(21);
                make.trailing.equalTo(titleView.mas_trailing).offset(-21);
                make.height.equalTo(@29);
                make.top.equalTo(titleView.mas_top).offset(6);
            }];
            
            [subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.leading.equalTo(titleView.mas_leading).offset(21);
                make.trailing.equalTo(titleView.mas_trailing).offset(-21);
                make.height.equalTo(@18);
                make.top.equalTo(titleLabel.mas_bottom).offset(11);
                
            }];
        }
            break;
    }
    
//    if (!_isReset) {
//        //设置密码
//        subtitleLabel.hidden = YES;
//        [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(container);
//            make.leading.equalTo(container);
//            make.trailing.equalTo(container);
//            make.height.offset(35);
//        }];
//        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.leading.equalTo(titleView.mas_leading).offset(21);
//            make.trailing.equalTo(titleView.mas_trailing).offset(-21);
//            make.height.equalTo(@29);
//            make.top.equalTo(titleView.mas_top).offset(6);
//        }];
//    } else {
//        //重置密码
//        subtitleLabel.hidden = NO;
//        [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(container);
//            make.leading.equalTo(container);
//            make.trailing.equalTo(container);
//            make.height.offset(65);
//        }];
//
//        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.leading.equalTo(titleView.mas_leading).offset(21);
//            make.trailing.equalTo(titleView.mas_trailing).offset(-21);
//            make.height.equalTo(@29);
//            make.top.equalTo(titleView.mas_top).offset(6);
//        }];
//
//        [subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.leading.equalTo(titleView.mas_leading).offset(21);
//            make.trailing.equalTo(titleView.mas_trailing).offset(-21);
//            make.height.equalTo(@18);
//            make.top.equalTo(titleLabel.mas_bottom).offset(11);
//
//        }];
//    }

    [freshPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleView.mas_bottom).offset(15.5);
        make.leading.equalTo(@(0));
        make.trailing.equalTo(@(0));
        make.height.equalTo(@(60));
    }];
    [confirmPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(freshPassword.mas_bottom).offset(0);
        make.leading.equalTo(@(0));
        make.trailing.equalTo(@(0));
        make.height.equalTo(@(60));
    }];
    [submitbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.offset(37.5);
        make.trailing.offset(-37.5);
        make.top.equalTo(confirmPassword.mas_bottom).offset(45);
        make.height.offset(48);
    }];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(submitbtn.mas_bottom).offset(100);
    }];
    
    _scrollView = scrollview;
    _titleLabel = titleLabel;
    _subtitleLabel = subtitleLabel;
    _titleView = titleView;
    _freshPassword = freshPassword;
    _confirmPassword = confirmPassword;
    _submitBtn = submitbtn;
    
    [self setDisabledGradientBackColor];
}

- (void)submit:(UIButton *)btn {
    //规则
    //    1、若新密码输入不符合条件，则toast提示：
    //    密码8~16位，大小写字母、数字或特殊字符，至少包含3种
    //    2、若两次输入密码不一致，则toast提示：
    //    两次密码输入不一致
    //    3、若原密码输入错误，则toast提示：
    //    密码错误
    //    4、若新密码与旧密码相同，则toast提示：
    //    新密码与旧密码相同
    
    [self.view endEditing:YES];
    
    NSString *oldPasswordStr;
    NSString *freshPasswordStr= _freshPassword.textField.text;
    NSString *confirmPasswordStr = _confirmPassword.textField.text;
    
    if (freshPasswordStr.length < 8 || freshPasswordStr.length > 16) {
        //        [IanAlert alertError:@"密码8~16位" length:1];
        return;
    }
    if (![NSString judgePassword:freshPasswordStr]) {
        //        [IanAlert alertError:@"密码8~16位，大小写字母、数字或特殊字符，至少包含3种" length:1];
        return;
    }
    if (![freshPasswordStr isEqualToString:confirmPasswordStr]) {
        //        [IanAlert alertError:@"两次密码输入不一致" length:1];
        return;
    }
  
    //    NSString *userId = [UserInfoConfig sharedUserInfoConfig].userInfo.Id;
    //    NSString *token = [UserInfoConfig sharedUserInfoConfig].userInfo.token;
    //    if (userId.length == 0 || token.length == 0) {
    //        [IanAlert alertError:@"登录信息失效，请重新登录后再修改" length:1];
    //        return;
    //    }
    //    __weak __typeof(self)weakself = self;
    //    ModifiedPwdApi * resetApi = [[ModifiedPwdApi alloc]initWithUserId:userId oldPwd:[oldPasswordStr MD5] newPwd:[freshPasswordStr MD5] token:token];
    //    [IanAlert showloadingAllowUserInteraction:NO];
    //    [resetApi startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
    //
    //        NSDictionary * dic = request.responseJSONObject;
    //        //NSLog(@"%@",dic);
    //        if (dic) {
    //            RRJsonModel * json = [RRJsonModel modelWithDictionary:dic];
    //            if (json.code == SUCCESSCODE) {
    //                [IanAlert alertSuccess:@"返回重新登录" length:1];
    //                [UserInfoConfig clearUserInfo];
    //                [weakself performSelector:@selector(popRootViewController) withObject:nil afterDelay:1];
    //            }else{
    //                [IanAlert alertError:json.msg length:1];
    //            }
    //
    //        }else{
    //
    //            [IanAlert alertError:ERRORMSG1 length:1];
    //        }
    //    } failure:^(YTKBaseRequest *request) {
    //        [IanAlert alertError:ERRORMSG2 length:1];
    //
    //    }];
    
    switch (_passwordType) {
        case PasswordTypeNoSet:
        {
        }
            break;
        case PasswordTypeTooSimple:
        {
        }
            break;
        case PasswordTypeForget:
        {
        }
            break;
        default:
        {
        }
            break;
    }
}

- (void)textFieldDidChange:(UITextField *)textField {
    //    //过滤空格
    //    NSString *tem = [[textField.text componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] componentsJoinedByString:@""];
    //    textField.text = tem;
    [self isShowNextBtn];
}

- (void)isShowNextBtn {
    if (_freshPassword.textField.text.length > 0 && _confirmPassword.textField.text.length > 0) {
        _submitBtn.enabled = YES;
        [self setEnabledGradientColor];
    } else {
        _submitBtn.enabled = NO;
        [self setDisabledGradientBackColor];
    }
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
@end
