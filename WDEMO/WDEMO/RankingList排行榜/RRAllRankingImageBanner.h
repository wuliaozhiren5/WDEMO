//
//  RRAllRankingImageBanner.h
//  WDEMO
//
//  Created by rrtv on 2021/10/21.
//  Copyright © 2021 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRDIYPageControl.h"
#import "RRAllRankingPageControl.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRAllRankingImageBanner : UIView<UIScrollViewDelegate>

@property(strong ,nonatomic) UIScrollView *scrollView; //滚动视图
@property(strong ,nonatomic) RRDIYPageControl *pageControl; //分页指示控件

@property(strong ,nonatomic) RRAllRankingPageControl *page; //分页指示控件

@property(strong ,nonatomic) NSArray *imageArr;
//点击图片的currentIndex
@property (nonatomic, assign) NSInteger currentIndex;

@property(nonatomic, copy) void (^slideImage)(NSInteger index);

@property(nonatomic, copy) void (^clickImage)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
