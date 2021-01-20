//
//  UIColor+color.h
//  PUClient
//
//  Created by liurong on 2020/5/7.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (color) 
/// 第一个元素是UIUserInterfaceStyleLigh 或者未定义 类型 的颜色  第二个元素是UIUserInterfaceStyleDark 颜色
/// @param dataArray <#dataArray description#>
+(UIColor*)colorWithDynamicProviderColor:(NSArray *)dataArray;

+ (UIColor *)colorHex:(NSString *)hexString;
+ (UIColor *)colorHex:(NSString *)hexString alpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
