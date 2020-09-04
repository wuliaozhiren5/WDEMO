//
//  NSString+Password.m
//  WDEMO
//
//  Created by rrtv on 2020/9/1.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "NSString+Password.h"

@implementation NSString (Password)

+ (BOOL)judgePassword:(NSString *)password {
    BOOL result ;
    // 大小写字母,数字,特殊字符中的至少3种.8=16位
    NSString * regex = @"^(?![a-zA-Z]+$)(?![A-Z0-9]+$)(?![A-Z\\W_]+$)(?![a-z0-9]+$)(?![a-z\\W_]+$)(?![0-9\\W_]+$)[a-zA-Z0-9\\W_]{8,16}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    result = [pred evaluateWithObject:password];
    NSLog(@"%hhd",result);
    return result;
}

+ (NSMutableAttributedString *)oldPasswordText {
    CGFloat fontSize = 15.;
//    CGFloat smallFontSize = 12.;
    UIFont *textFont = [UIFont systemFontOfSize:fontSize];
//    UIFont *smallTextFont = [UIFont systemFontOfSize:smallFontSize];
//    UIColor *textColor = kCOLOR_dynamicProvider_CACBCC_616466;
    UIColor *textColor = kCOLOR_CACBCC;
    CGFloat lineSpacing = 5.;
    
    NSMutableAttributedString *oldPasswordText = [[NSMutableAttributedString alloc] initWithString:@"旧密码"];
    oldPasswordText.lineSpacing = lineSpacing;
    oldPasswordText.font = textFont;
    oldPasswordText.color = textColor;
    
    return oldPasswordText;
}

+ (NSMutableAttributedString *)freshPasswordText {
    CGFloat fontSize = 15.;
    CGFloat smallFontSize = 12.;
    UIFont *textFont = [UIFont systemFontOfSize:fontSize];
    UIFont *smallTextFont = [UIFont systemFontOfSize:smallFontSize];
//    UIColor *textColor = kCOLOR_dynamicProvider_CACBCC_616466;
    UIColor *textColor = kCOLOR_CACBCC;
    CGFloat lineSpacing = 5.;
    
    NSMutableAttributedString *freshPasswordText = [[NSMutableAttributedString alloc] initWithString:@"新密码"];
    freshPasswordText.lineSpacing = lineSpacing;
    freshPasswordText.font = textFont;
    freshPasswordText.color = textColor;
    
    NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"(8-16位至少含大小写字母/数字/特殊字符3种)"];
    one.lineSpacing = lineSpacing;
    one.font = smallTextFont;
    one.color = textColor;
    [freshPasswordText appendAttributedString:one];
    
    return freshPasswordText;
}

+ (NSMutableAttributedString *)confirmPasswordText {
    CGFloat fontSize = 15.;
//    CGFloat smallFontSize = 12.;
    UIFont *textFont = [UIFont systemFontOfSize:fontSize];
//    UIFont *smallTextFont = [UIFont systemFontOfSize:smallFontSize];
//    UIColor *textColor = kCOLOR_dynamicProvider_CACBCC_616466;
    UIColor *textColor = kCOLOR_CACBCC;
    CGFloat lineSpacing = 5.;

    NSMutableAttributedString *confirmPasswordText = [[NSMutableAttributedString alloc] initWithString:@"请确认密码"];
    confirmPasswordText.lineSpacing = lineSpacing;
    confirmPasswordText.font = textFont;
    confirmPasswordText.color = textColor;
    
    return confirmPasswordText;
}
@end
