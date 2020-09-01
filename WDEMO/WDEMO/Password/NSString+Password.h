//
//  NSString+Password.h
//  WDEMO
//
//  Created by rrtv on 2020/9/1.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Password)

// 大小写字母,数字,特殊字符中的至少3种.8=16位
+ (BOOL)judgePassword:(NSString *)password;

@end

NS_ASSUME_NONNULL_END
