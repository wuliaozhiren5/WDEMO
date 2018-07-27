//
//  WConstants.h
//  WDEMO
//
//  Created by xxx on 2017/11/21.
//  Copyright © 2017年 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>

//正确定义Objective-C常量
//http://blog.csdn.net/chowpan/article/details/25061839
//
//如有c或者c++混合的话使用FOUNDATION_EXPORT 来代替 extern
//extern NSString * const MyOwnConstant;
//extern NSString * const YetAnotherConstant;
//
//iOS常量(const)、enum、宏(#define)的使用场景及区别
//http://www.jianshu.com/p/064b5b82a3a2

FOUNDATION_EXTERN NSString * const MyOwnConstant;
FOUNDATION_EXTERN NSString * const YetAnotherConstant;

@interface WConstants : NSObject

@end
