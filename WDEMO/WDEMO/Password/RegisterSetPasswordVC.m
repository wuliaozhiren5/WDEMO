//
//  RegisterSetPasswordVC.m
//  WDEMO
//
//  Created by WDEMO on 2020/9/4.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "RegisterSetPasswordVC.h"
#import <YYKit/YYKit.h>

@interface RegisterSetPasswordVC ()
//跳过按钮
@property (nonatomic, strong) UIButton *skipBtn;

@property (nonatomic, strong) YYLabel *agreementLabel;//点击“确定”或“跳过”即代表您已同意《用户注册协议》

@end

@implementation RegisterSetPasswordVC

-(void)setupViews {
    [super setupViews];
    
    UIButton *skipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [skipBtn setTitle:@"跳过" forState:UIControlStateNormal];
//    [skipBtn setTitleColor:kCOLOR_dynamicProvider_333333_DADBDC forState:UIControlStateNormal];
    skipBtn.titleLabel.font = RR_COMMONFONT(18);
//    skipBtn.backgroundColor = kCOLOR_dynamicProvider_F2F4F5_2E2E2E;
    skipBtn.backgroundColor = kCOLOR_F2F4F5;
    skipBtn.layer.cornerRadius = 24;
    [skipBtn addTarget:self action:@selector(skipAction) forControlEvents:UIControlEventTouchUpInside];
    [self.container addSubview:skipBtn];
    
   
    
    CGFloat fontSize = 12.;
    UIFont *textFont = [UIFont systemFontOfSize:fontSize];
//    UIColor *textColor = kCOLOR_dynamicProvider_333333_DADBDC;
    UIColor *textColor = kCOLOR_333333;
    CGFloat lineSpacing = 5.;
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"点击“确定”或“跳过”即代表您已同意"];
    text.lineSpacing = lineSpacing;
    text.font = textFont;
    text.color = textColor;
 
    NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"《用户注册协议》"];
    one.lineSpacing = lineSpacing;
    one.font = textFont;
    one.color = textColor;
    [one setTextHighlightRange:one.rangeOfAll
                         color:kCOLOR_00BBFF
               backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                     tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
        NSLog(@"《用户注册协议》");
         
//        NSString *url = kAppUserAgreementUrl;
//        Activity_ViewController *next  = [[Activity_ViewController alloc] init];
//        next.targetUrl = url;
//        next.titleStr = @"用户协议";
//        [[RRAppLinkManager sharedManager] pushViewController:next animated:YES];
    }];
    [text appendAttributedString:one];
    
    //文本布局计算
    CGSize size = CGSizeMake(self.view.frame.size.width, CGFLOAT_MAX);
    YYTextLayout * layout = [YYTextLayout layoutWithContainerSize:size text:text];
    YYLabel *label = [YYLabel new];
    label.attributedText = text;
    label.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    // text layout display
    label.size = layout.textBoundingSize;
    label.textLayout = layout;
    [self.container addSubview:label];
    
    _skipBtn = skipBtn;
    _agreementLabel = label;
     
    
    self.oldPassword.hidden = YES;
    self.subtitleLabel.hidden = YES;
    //布局layout
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.top.equalTo(self.view);
//        make.top.equalTo(self.customTabbar.mas_bottom);
        make.leading.trailing.bottom.offset(0);
    }];
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    
    //设置密码
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.container);
        make.leading.equalTo(self.container);
        make.trailing.equalTo(self.container);
        make.height.offset(35);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.titleView.mas_leading).offset(21);
        make.trailing.equalTo(self.titleView.mas_trailing).offset(-21);
        make.height.equalTo(@29);
        make.top.equalTo(self.titleView.mas_top).offset(6);
    }];
    
    [self.freshPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).offset(15.5);
        make.leading.equalTo(@(0));
        make.trailing.equalTo(@(0));
        make.height.equalTo(@(60));
    }];
    [self.confirmPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.freshPassword.mas_bottom).offset(0);
        make.leading.equalTo(@(0));
        make.trailing.equalTo(@(0));
        make.height.equalTo(@(60));
    }];
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.offset(37.5);
        make.trailing.offset(-37.5);
        make.top.equalTo(self.confirmPassword.mas_bottom).offset(45);
        make.height.offset(48);
    }];
    [self.skipBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.offset(37.5);
        make.trailing.offset(-37.5);
        make.top.equalTo(self.submitBtn.mas_bottom).offset(21);
        make.height.offset(48);
    }];
    [self.agreementLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.offset(37.5);
        make.trailing.offset(-37.5);
        make.top.equalTo(self.skipBtn.mas_bottom).offset(24);
     }];
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.agreementLabel.mas_bottom).offset(100);
    }];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)submit:(UIButton *)btn {
    [super submit:btn];
    NSString *oldPasswordStr = self.oldPassword.textField.text;
    NSString *freshPasswordStr= self.freshPassword.textField.text;
    NSString *confirmPasswordStr = self.confirmPassword.textField.text;
    
    if (![NSString judgePassword:freshPasswordStr]) {
        //        [IanAlert alertError:@"密码8~16位，大小写字母、数字或特殊字符，至少包含3种" length:1];
        return;
    }
    if (![freshPasswordStr isEqualToString:confirmPasswordStr]) {
        //        [IanAlert alertError:@"两次密码输入不一致" length:1];
        return;
    }
    
}

- (void)isShowNextBtn {
    [super isShowNextBtn];
    NSString *freshPasswordStr= self.freshPassword.textField.text;
    NSString *confirmPasswordStr = self.confirmPassword.textField.text;
    if (freshPasswordStr.length > 0 && confirmPasswordStr.length > 0) {
        self.submitBtn.enabled = YES;
    } else {
        self.submitBtn.enabled = NO;
    }
}

- (void)skipAction {
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}
 
@end
