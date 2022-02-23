//
//  NSString+Util.m
//  WDEMO
//
//  Created by WDEMO on 2021/4/29.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString (Util)

+ (NSString *)getFormatterDateStringWithTimeInterval:(NSTimeInterval)timeInterval {
//    return @"";
    if (timeInterval == 0) {
        return @"";
    }
    NSTimeInterval delta = [[NSDate date] timeIntervalSince1970] - timeInterval;
    if (delta < 60) { // <1分钟-刚刚
        return @"刚刚";
    } else if (delta < 60 * 60) { // <1小时以内-X分钟前
        return [NSString stringWithFormat:@"%d分钟前", (int)(delta / 60)];
    } else if (delta < 60 * 60 * 24) { // <24小时以内-X小时前
        return [NSString stringWithFormat:@"%d小时前", (int)(delta / (60 * 60))];
    } else if (delta < 60 * 60 * 24 * 10) { // <10天-X天前（自然天）
        return [NSString stringWithFormat:@"%d天前", (int)(delta / (60 * 60 * 24))];
    } else { // >10天
        NSDate *create = [NSDate dateWithTimeIntervalSince1970:timeInterval];
//        if (create.isThisYear) { // >=10天-且年份相同 X-Y 如12-12链接文字
//            static NSDateFormatter *thisYearFmt;
//            if (!thisYearFmt) {
//                thisYearFmt = [[NSDateFormatter alloc] init];
//                thisYearFmt.dateFormat = @"MM-dd";
//            }
//            return [thisYearFmt stringFromDate:create];
//        } else { // >=10天且年份不同，显示年月日
            static NSDateFormatter *otherYearFmt;
            if (!otherYearFmt) {
                otherYearFmt = [[NSDateFormatter alloc] init];
                otherYearFmt.dateFormat = @"yyyy-MM-dd";
            }
            return [otherYearFmt stringFromDate:create];
//        }
    }
}

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

//九千万
+ (NSString *)transformNinetyMillionCountWithString:(NSInteger)count {
//    评论数规则
//    1、评论数 = 发评论总数 + 发回复总数
//    2、评论数 = 0 不显示
//    3、9999<评论数>1，显示实际评论数
//    4、评论数 = 10000，显示1w
//    5、评论数 > 10000 且 评论数 =< 89999999 ，按千位递进展示，如1.1w，9.9w
//    6、评论数 = 90,000,000，显示9000w
//    7、评论数 > 90,000,000，显示9000w+
    NSString *countStr = @"";
    if (count <= 0) {
        countStr = @"";
    } else if (count > 0 && count < 10000) {
        countStr = @(count).stringValue;
    } else if (count == 10000) {
        countStr = @"1w";
    } else if (count > 10000 && count < 90000000) {
        //万位
        NSInteger a = count / 10000;
        //千位
        NSInteger b = (count / 1000) % 10;
        if (b > 0) {
            countStr = [NSString stringWithFormat:@"%zi.%ziw", a, b];
        } else {
            countStr = [NSString stringWithFormat:@"%ziw", a];
        }
    } else if (count == 90000000) {
        countStr = @"9000w";
    } else if (count > 90000000) {
        countStr = @"9000w+";
    }
    return countStr;
}

+ (NSString *)commentLikeTransformCountWithString:(NSInteger)count {
    NSString *str = [self transformCountWithString:count];
    if (str.length > 0) {
        return str;
    }else {
        return @"赞";
    }
}

+ (NSString *)dramaCommentLikeTransformCountWithString:(NSInteger)count {
    NSString *str = [self transformNinetyMillionCountWithString:count];
    if (str.length > 0) {
        return str;
    }else {
        return @"赞";
    }
}

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
