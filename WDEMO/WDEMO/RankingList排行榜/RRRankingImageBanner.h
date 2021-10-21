//
//  RRRankingImageBanner.h
//  WDEMO
//
//  Created by rrtv on 2021/10/21.
//  Copyright © 2021 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RRRankingImageBanner : UIView<UIScrollViewDelegate>

@property(strong ,nonatomic) UIScrollView  *  bannerScroll; //滚动视图
@property(strong ,nonatomic) UIPageControl *  bannerPageControl; //分页指示控件
@property(strong ,nonatomic) NSArray       *  bannerArray;   //轮播图name数组
@property(strong ,nonatomic) NSTimer       *  bannerTimer;  //轮播定时器
@property(assign ,nonatomic) NSUInteger       pageCount ;   //记录总页面数
@property(assign ,nonatomic) NSUInteger       CurrentPageCount ; //记录当前的页面
@property(assign ,nonatomic) float            oldScrollOffset;   //记录之前Scroll偏移量
@property(assign ,nonatomic) float            timerInterval; //设置定时器的间隔时间
@property(assign ,nonatomic) BOOL             autoScroll; //自动滚动

- (id)initWithFrame:(CGRect)frame array:(NSArray*)array;

@end

NS_ASSUME_NONNULL_END
