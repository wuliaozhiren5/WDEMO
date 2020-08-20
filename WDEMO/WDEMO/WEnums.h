//
//  WEnums.h
//  WDEMO
//
//  Created by xxx on 2017/11/21.
//  Copyright © 2017年 wwc. All rights reserved.
//

#ifndef WEnums_h
#define WEnums_h

//ios高效开发－正确的使用枚举（Enum）
//http://blog.csdn.net/daleiwang/article/details/50581872
//iOS 枚举的巧用
//http://www.jianshu.com/p/97e582fe89f3

//NS_ENUM，定义状态等普通枚举
typedef NS_ENUM(NSUInteger, TTGState) {
    TTGStateOK = 0,
    TTGStateError,
    TTGStateUnknow
};

//NS_OPTIONS，定义选项
typedef NS_OPTIONS(NSUInteger, TTGDirection) {
    TTGDirectionNone = 0,
    TTGDirectionTop = 1 << 0,
    TTGDirectionLeft = 1 << 1,
    TTGDirectionRight = 1 << 2,
    TTGDirectionBottom = 1 << 3
};

#endif /* WEnums_h */
