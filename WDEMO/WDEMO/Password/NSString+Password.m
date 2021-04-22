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


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSString *)transformCountWithString:(NSInteger)count {
//    评论数规则
//    1、评论数 = 发评论总数 + 发回复总数
//    2、评论数 = 0 不显示
//    3、9999<评论数>1，显示实际评论数
//    4、评论数 = 10000，显示1w
//    5、评论数 > 10000 且 评论数 =< 99999 ，按千位递进展示，如1.1w，9.9w
//    6、评论数 = 100,000，显示10w
//    7、评论数 > 100,000，显示10w+
    NSString *countStr = @"";
    if (count <= 0) {
        countStr = @"";
    } else if (count > 0 && count < 10000) {
        countStr = @(count).stringValue;
    } else if (count == 10000) {
        countStr = @"1w";
    } else if (count > 10000 && count < 100000) {
        //万位
        NSInteger a = count / 10000;
        //千位
        NSInteger b = (count / 1000) % 10;
        if (b > 0) {
            countStr = [NSString stringWithFormat:@"%zi.%ziw", a, b];
        } else {
            countStr = [NSString stringWithFormat:@"%ziw", a];
        }
    } else if (count == 100000) {
        countStr = @"10w";
    } else if (count > 100000) {
        countStr = @"10w+";
    }
    return countStr;
}
@end
