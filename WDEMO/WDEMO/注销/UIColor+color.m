//
//  UIColor+color.m
//  PUClient
//
//  Created by liurong on 2020/5/7.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import "UIColor+color.h"

@implementation UIColor (color)

+ (UIColor*)colorWithDynamicProviderColor:(NSArray *)dataArray {
    if (dataArray.count == 0 || !dataArray) {
        return [UIColor clearColor];
    }
    if (@available(iOS 13.0, *)) {
       UIColor *dyColor =  [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trainCollection) {
           if ([trainCollection userInterfaceStyle] == UIUserInterfaceStyleDark) {
               if (dataArray.count>1) {
                   return dataArray[1];
               }
           }
           return dataArray[0];
       }];
       return dyColor;
    }
    return dataArray[0];
}


+ (UIColor *)colorHex:(NSString *)hexString {
    NSString *string;
    if (![hexString hasPrefix:@"#"]) {
        string = [NSString stringWithFormat:@"#%@",hexString];
    }else{
        string = hexString;
    }
    
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:string];
    scanner.scanLocation = 1;   // by pass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16) / 255.0 green:((rgbValue & 0xFF00) >> 8) / 255.0 blue:(rgbValue & 0xFF) / 255.0 alpha:1.0];
}

+ (UIColor *)colorHex:(NSString *)hexString alpha:(CGFloat)alpha {
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    //#
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}
 
@end
 
