//
//  UITabBar+badge.h
//  WDEMO
//
//  Created by aimeiju on 2022/7/19.
//  Copyright © 2022 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBar (badge)
- (void)showBadgeOnItemIndex:(int)index;
- (void)hideBadgeOnItemIndex:(int)index;
@end

NS_ASSUME_NONNULL_END
