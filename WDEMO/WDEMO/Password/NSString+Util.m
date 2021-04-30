//
//  NSString+Util.m
//  WDEMO
//
//  Created by rrtv on 2021/4/29.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString (Util)
//过滤回车@"\r"
+ (NSString *)filterReturn:(NSString *)str {
//    str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]; //去除掉首尾的空白字符和换行字符
    str = [str stringByReplacingOccurrencesOfString:@"\r" withString:@""];
//    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return str;
}

//过滤换行@"\n"
+ (NSString *)filterNewLine:(NSString *)str {
    //    str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]; //去除掉首尾的空白字符和换行字符
//        str = [str stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return str;
}
@end
