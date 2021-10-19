//
//  ChangePasswordVC.m
//  WDEMO
//
//  Created by WDEMO on 2020/9/3.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ChangePasswordVC.h"

@interface ChangePasswordVC ()

@end

@implementation ChangePasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setupViews {
    [super setupViews];
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
    [self.oldPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).offset(15.5);
        make.leading.equalTo(@(0));
        make.trailing.equalTo(@(0));
        make.height.equalTo(@(60));
    }];
    [self.freshPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oldPassword.mas_bottom).offset(0);
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
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.submitBtn.mas_bottom).offset(100);
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
    
    //规则
    //    1、若新密码输入不符合条件，则toast提示：
    //    密码8~16位，大小写字母、数字或特殊字符，至少包含3种
    //    2、若两次输入密码不一致，则toast提示：
    //    两次密码输入不一致
    //    3、若原密码输入错误，则toast提示：
    //    密码错误
    //    4、若新密码与旧密码相同，则toast提示：
    //    新密码与旧密码相同
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
    NSString *oldPasswordStr = self.oldPassword.textField.text;
    NSString *freshPasswordStr= self.freshPassword.textField.text;
    NSString *confirmPasswordStr = self.confirmPassword.textField.text;
    if (oldPasswordStr.length > 0 && freshPasswordStr.length > 0 && confirmPasswordStr.length > 0) {
        self.submitBtn.enabled = YES;
    } else {
        self.submitBtn.enabled = NO;
    }
}

@end
