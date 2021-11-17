//
//  RRDIYPageControl.h
//  NJVideo
//
//  Created by chenwenfeng on 2021/7/6.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef struct{
    CGFloat   width; //圆点宽 默认 4.5
    CGFloat   height; //圆点高 默认 4.5
    CGFloat   margin; //圆点间距 默认 4.5
} RRPageControlDotSize;

NS_INLINE RRPageControlDotSize RRMakePageControlDotSize (CGFloat width, CGFloat height, CGFloat margin) {
    RRPageControlDotSize pageControlDotSize;
    pageControlDotSize.width = width;
    pageControlDotSize.height = height;
    pageControlDotSize.margin = margin;
    return pageControlDotSize;
}

@interface RRDIYPageControl : UIControl

/// default is 0
@property (nonatomic, assign) NSInteger numberOfPages;

/// default is 0. Value is pinned to 0..numberOfPages-1
@property (nonatomic, assign) NSInteger currentPage;

/// hides the indicator if there is only one page, default is NO
@property (nonatomic) BOOL hidesForSinglePage;

/// The tint color for non-selected indicators. Default is nil.
@property (nullable, nonatomic, strong) UIColor *pageIndicatorTintColor;

/// The tint color for the currently-selected indicators. Default is nil.
@property (nullable, nonatomic, strong) UIColor *currentPageIndicatorTintColor;

/// The  dot width 、height、magrin. Default is {4.5,4.5,4.5}.
@property (nonatomic, assign) RRPageControlDotSize pageControlDotSize;

- (CGSize)customSizeForNumberOfPage:(NSInteger)page;

@end

NS_ASSUME_NONNULL_END

