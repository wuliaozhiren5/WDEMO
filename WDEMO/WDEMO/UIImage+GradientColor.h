//
//  UIImage+GradientColor.h
//  PUClient
//
//  Created by 冉合磊 on 2018/9/14.
//  Copyright © 2018年 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GradientType) {
    
    GradientTypeTopToBottom = 0,//从上到下
    
    GradientTypeLeftToRight = 1,//从左到右
    
    GradientTypeUpleftToLowright = 2,//左上到右下
    
    GradientTypeUprightToLowleft = 3,//右上到左下
    
};
/*
 UIColor *topColor = RGBACOLOR(83, 95, 124, 1);
 
 UIColor *bottomColor = RGBACOLOR(83, 95, 124, 0);
 
 UIImage *bgImg = [UIImage gradientColorImageFromColors:@[topColor, bottomColor] gradientType:GradientTypeTopToBottom imgSize:CGSizeMake(KWidth, 200)];
 UIColor *bgColor = [UIColor colorWithPatternImage:bgImg];
 
 [self.bgView  setBackgroundColor:[bgColor colorWithAlphaComponent:0.4]];
 */
@interface UIImage(GradientColor)

/// 生成渐变图片
+ (UIImage *)gradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize;


/// 生成渐变图片
/// @param opaque   NO:带透明通道
+ (UIImage *)gradientColorImageFromColors:(NSArray*)colorArray locations:(NSArray *)locationArray gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize opaque:(BOOL)opaque;

@end




