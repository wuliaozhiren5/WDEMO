//
//  UIView+Shadow.h
//  WDEMO
//
//  Created by WDEMO on 2021/1/19.
//  Copyright © 2021 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Shadow)

/// 设置阴影
/// @param x x
/// @param y y
/// @param blur 阴影半径
/// @param spread 阴影散布
/// @param color 颜色
/// @param alpha 透明度
- (void)setShadowWithOffsetX:(CGFloat)x offsetY:(CGFloat)y Blur:(CGFloat)blur Spread:(CGFloat)spread color:(UIColor *)color alpha:(float)alpha;
- (void)setShadowWithOffsetX:(CGFloat)x offsetY:(CGFloat)y Blur:(CGFloat)blur Spread:(CGFloat)spread color:(UIColor *)color;
- (void)setShadowWithOffsetX:(CGFloat)x offsetY:(CGFloat)y Blur:(CGFloat)blur Spread:(CGFloat)spread;

@end

NS_ASSUME_NONNULL_END
