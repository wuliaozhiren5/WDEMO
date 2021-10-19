//
//  RRMJTool.h
//  WDEMO
//
//  Created by WDEMO on 2021/7/28.
//  Copyright © 2021 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RRMJTool : NSObject
//时间戳转化 日期转化 秒
+ (NSString *)getFormatterDateStringWithTimeInterval:(NSTimeInterval)timeInterval;
//获取行数
+ (NSArray *)getSeparatedLinesFromYYLabel:(YYLabel *)yyLabel;
//获取行数
+ (NSArray *)getSeparatedLinesFromLabel:(UILabel *)label;
//判断中英混合的的字符串长度
+ (int)convertToInt:(NSString*)strtemp;
@end

NS_ASSUME_NONNULL_END
