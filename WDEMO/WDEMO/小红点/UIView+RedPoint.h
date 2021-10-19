//
//  UIView+RedPoint.h
//  WDEMO
//
//  Created by WDEMO on 2021/1/17.
//  Copyright © 2021 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (RedPoint)
 
/// 在View上添加红点
/// @param point point description
/// @param view view description
+ (void)createRedViewWithPoint:(CGPoint)point bySuperView:(UIView *)view;
+ (void)createRedViewWithRect:(CGRect)rect bySuperView:(UIView *)view;
//在view清除
+ (void)cleanRedViewBySuperView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
