//
//  UIView+Shadow.m
//  WDEMO
//
//  Created by rrtv on 2021/1/19.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "UIView+Shadow.h"

@implementation UIView (Shadow)

#pragma mark - 阴影设置
- (void)setShadowWithOffsetX:(CGFloat)x offsetY:(CGFloat)y Blur:(CGFloat)blur Spread:(CGFloat)spread color:(UIColor *)color alpha:(float)alpha {
    self.layer.masksToBounds = NO; //裁剪图层
    self.layer.shadowOpacity = alpha;   //阴影不透明度
    self.layer.shadowOffset = CGSizeMake(x, y); //阴影偏移量
    self.layer.shadowColor = color.CGColor; //阴影颜色
    self.layer.shadowRadius = blur / 2.0;   //阴影半径
    //如果有扩散，则增加扩散
    if (spread == 0) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
        self.layer.shadowPath = path.CGPath;    //添加了shadowPath后消除了离屏渲染问题
    } else {
        CGFloat dx = -spread;
        CGRect rect = CGRectInset(self.layer.bounds, dx, dx);
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
        self.layer.shadowPath = path.CGPath;    //添加了shadowPath后消除了离屏渲染问题
    }
}

- (void)setShadowWithOffsetX:(CGFloat)x offsetY:(CGFloat)y Blur:(CGFloat)blur Spread:(CGFloat)spread {
    [self setShadowWithOffsetX:x offsetY:y Blur:blur Spread:spread color:[[UIColor blackColor] colorWithAlphaComponent:0.08] alpha:1];
}

- (void)setShadowWithOffsetX:(CGFloat)x offsetY:(CGFloat)y Blur:(CGFloat)blur Spread:(CGFloat)spread color:(UIColor *)color {
    [self setShadowWithOffsetX:x offsetY:y Blur:blur Spread:spread color:color alpha:1];
}

@end
