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



@end
