//
//  PasswordTextField.m
//  WDEMO
//
//  Created by WDEMO on 2020/9/1.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "PasswordTextField.h"

@implementation PasswordTextField

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

//禁用复制粘贴
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    if (menuController) {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }
    return NO;
}

@end
