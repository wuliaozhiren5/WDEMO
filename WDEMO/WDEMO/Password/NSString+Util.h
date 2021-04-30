//
//  NSString+Util.h
//  WDEMO
//
//  Created by rrtv on 2021/4/29.
//  Copyright © 2021 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Util)
//过滤回车@"\r"
+ (NSString *)filterReturn:(NSString *)str;

//过滤换行@"\n"
+ (NSString *)filterNewLine:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
