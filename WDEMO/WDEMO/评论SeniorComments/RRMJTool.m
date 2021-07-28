//
//  RRMJTool.m
//  WDEMO
//
//  Created by rrtv on 2021/7/28.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "RRMJTool.h"

@implementation RRMJTool

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

+ (NSArray *)getSeparatedLinesFromYYLabel:(YYLabel *)yyLabel {
    UILabel *label= [[UILabel alloc] init];
    label.text = [yyLabel text];
    label.font = [yyLabel font];
    label.frame = [yyLabel frame];
    return [self getSeparatedLinesFromLabel:label];
}

+ (NSArray *)getSeparatedLinesFromLabel:(UILabel *)label {
    NSString *text = [label text];
    UIFont *font = [label font];
    CGRect rect = [label frame];
    CTFontRef myFont = CTFontCreateWithName((__bridge CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)myFont range:NSMakeRange(0, attStr.length)];
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attStr);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, rect.size.width, 100000));
    
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    
    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc] init];
    
    for (id line in lines) {
        CTLineRef lineRef = (__bridge CTLineRef)line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        
        NSString *lineString = [text substringWithRange:range];
        [linesArray addObject:lineString];
    }
    return linesArray;
}

@end
