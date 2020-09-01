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

@end
