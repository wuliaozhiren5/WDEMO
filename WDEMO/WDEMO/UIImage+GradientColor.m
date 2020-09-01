//
//  UIImage+GradientColor.m
//  PUClient
//
//  Created by 冉合磊 on 2018/9/14.
//  Copyright © 2018年 RRMJ. All rights reserved.
//

#import "UIImage+GradientColor.h"//渐变色

@implementation UIImage (GradientColor)

+ (UIImage *)gradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize {
    return [self gradientColorImageFromColors:colors locations:nil gradientType:gradientType imgSize:imgSize opaque:YES];
}

+ (UIImage *)gradientColorImageFromColors:(NSArray*)colorArray locations:(NSArray *)locationArray gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize opaque:(BOOL)opaque {
    
    NSMutableArray *colors = [NSMutableArray array];
    for(UIColor *c in colorArray) {
        [colors addObject:(id)c.CGColor];
    }
    CGFloat *locations = NULL;
    if (locationArray.count > 0) {
        locations = malloc(sizeof(CGFloat)*colorArray.count);
        for(int i = 0; i < colorArray.count; i ++) {
            locations[i] = (CGFloat)[locationArray[i] doubleValue];
        }
    }
    UIGraphicsBeginImageContextWithOptions(imgSize, opaque, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colorArray lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)colors, locations);
    if (locations != NULL) {
        free(locations);
    }
    CGPoint start;
    CGPoint end;
    switch (gradientType) {
            
        case GradientTypeTopToBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
            
        case GradientTypeLeftToRight:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, 0.0);
            break;
            
        case GradientTypeUpleftToLowright:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, imgSize.height);
            break;
            
        case GradientTypeUprightToLowleft:
            start = CGPointMake(imgSize.width, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
            
        default:
            break;
            
    }
    
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}

@end
