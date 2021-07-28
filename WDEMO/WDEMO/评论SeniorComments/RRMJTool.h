//
//  RRMJTool.h
//  WDEMO
//
//  Created by rrtv on 2021/7/28.
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
@end

NS_ASSUME_NONNULL_END
