//
//  NSString+Util.h
//  WDEMO
//
//  Created by WDEMO on 2021/4/29.
//  Copyright © 2021 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Util)

//时间戳转化 日期转化 秒
+ (NSString *)getFormatterDateStringWithTimeInterval:(NSTimeInterval)timeInterval;
 
//十万
//用于新评论中的 评论数 点赞数 评论数展示规
+ (NSString *)transformCountWithString:(NSInteger)count;

//九千万
+ (NSString *)transformNinetyMillionCountWithString:(NSInteger)count;

+ (NSString *)commentLikeTransformCountWithString:(NSInteger)count;

+ (NSString *)dramaCommentLikeTransformCountWithString:(NSInteger)count;
 
//过滤回车@"\r"
+ (NSString *)filterReturn:(NSString *)str;

//过滤换行@"\n"
+ (NSString *)filterNewLine:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
