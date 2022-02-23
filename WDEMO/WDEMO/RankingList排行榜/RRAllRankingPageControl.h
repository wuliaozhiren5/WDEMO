//
//  RRAllRankingPageControl.h
//  WDEMO
//
//  Created by WDEMO on 2021/12/3.
//  Copyright © 2021 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RRAllRankingPageControl : UIControl 
/// default is 0
@property (nonatomic, assign) NSInteger numberOfPages;

/// default is 0. Value is pinned to 0..numberOfPages-1
@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, assign) CGFloat pointWidth;
@property (nonatomic, assign) CGFloat pointHeight;
@property (nonatomic, assign) CGFloat pointCornerRadius;
@property (nonatomic, assign) CGFloat pointSpacing;

/// The tint color for non-selected indicators. Default is nil.
@property (nullable, nonatomic, strong) UIColor *pageIndicatorTintColor;

/// The tint color for the currently-selected indicators. Default is nil.
@property (nullable, nonatomic, strong) UIColor *currentPageIndicatorTintColor;

//模仿
@property (nonatomic, strong) UIPageControl *pageControl;

@end

NS_ASSUME_NONNULL_END
