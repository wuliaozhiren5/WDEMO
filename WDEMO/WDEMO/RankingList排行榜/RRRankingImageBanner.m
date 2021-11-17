//
//  RRRankingImageBanner.m
//  WDEMO
//
//  Created by rrtv on 2021/10/21.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "RRRankingImageBanner.h"
  
@implementation RRRankingImageBanner

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
//    self.clipsToBounds = YES;
}


//- (instancetype)initWithFrame:(CGRect)frame array:(NSArray*)array{
//    self = [super initWithFrame:frame];
//    if (self) {
//        self.bannerArray = array;
//        self.pageCount = array.count;
//        [self creatScrollView];
//    }
//    return self;
//}
//
//- (void)creatScrollView {
//
//    if (!(self.bannerArray.count > 0)) {
//        return;
//    }
//
//    self.bannerScroll = [[UIScrollView alloc]init];
//    self.bannerScroll.frame = CGRectMake(0, 0, SC_WIDTH, SC_HEIGHT);
//    [self addSubview:self.bannerScroll];
//
//    self.bannerScroll.contentSize = CGSizeMake((self.bannerArray.count) * SC_WIDTH, 0);
//    self.bannerScroll.pagingEnabled = YES;
//    self.bannerScroll.showsHorizontalScrollIndicator = NO ;
//    self.bannerScroll.delegate = self;
//
//    NSInteger count = self.bannerArray.count;
//
//    for (int i = 0; i < count; i++) {
//        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * SC_WIDTH, 0, SC_WIDTH, SC_HEIGHT)];
//        imageView.contentMode = UIViewContentModeScaleAspectFill;
//        imageView.tag = i;
//        [imageView rr_delaySetImageWithURLString:self.bannerArray[i]
//                                placeholderImage:IMAGENAME(@"ranking_image")];
////        [imageView rr_downloadImageWithURLString:model.cov placeholderImage:IMAGENAME(@"ranking_cover")];
//        [self.bannerScroll addSubview:imageView];
////        imageView.userInteractionEnabled = YES;
////        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
////        [imageView addGestureRecognizer:tap];
//    }
////    self.bannerScroll.contentOffset = CGPointMake(0, 0);
//
//    self.bannerPageControl = [[RRDIYPageControl alloc] init];
//    self.bannerPageControl.frame = CGRectMake(0, SC_HEIGHT - 25, SC_WIDTH, 12);
//    self.bannerPageControl.currentPage = 0;
//    self.bannerPageControl.pageIndicatorTintColor = HexUIColorFromRGB(0xFFFFFF, 0.5);
//    self.bannerPageControl.currentPageIndicatorTintColor = HexUIColorFromRGB(0xFFFFFF, 1.0);
//    self.bannerPageControl.pageControlDotSize = RRMakePageControlDotSize(4.5, 4.5, 4.5);
//    [self addSubview:self.bannerPageControl];
//    CGSize size = [self.bannerPageControl customSizeForNumberOfPage:count];
//    self.bannerPageControl.frame = CGRectMake((self.frame.size.width - size.width) / 2.0, self.frame.size.height - size.height - 5, size.width, size.height);
//
//}
//
////#pragma mark - 点击图片
////- (void)tap:(UITapGestureRecognizer *)tap {
////
////}
//
//#pragma  mark **************UIScrollViewDelegate*******************
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
////    CGPoint point = scrollView.contentOffset;
////    BOOL isRight = self.oldScrollOffset > point.x;
////    self.oldScrollOffset = point.x;
////
////    // 调整pageControl的当前 位置
////    if (point.x > SC_WIDTH * (self.pageCount) + SC_WIDTH * 0.5 && !self.bannerTimer) {
////        self.bannerPageControl.currentPage = 0;
////    }
////    else if (point.x < SC_WIDTH * 0.5 && self.bannerTimer && isRight) {
//////    else if (point.x < SC_WIDTH * 0.5 && isRight) {
////
////        self.bannerPageControl.currentPage = self.pageCount - 1;
////    }
////    else {
////        self.bannerPageControl.currentPage = (point.x + SC_WIDTH * 0.5 ) / SC_WIDTH - 1;
////    }
////
////    //处理两种情况，1、当偏移量超出scrollView contentSize最大值时 2、当偏移量小于零时
////    if (point.x >= SC_WIDTH * (self.pageCount + 1)) {
////
////        [scrollView setContentOffset:CGPointMake(SC_WIDTH, 0) animated:NO];
////
////    } else if (point.x < 0) {
////
////        [scrollView setContentOffset:CGPointMake(point.x + SC_WIDTH * (self.pageCount), 0) animated:NO];
////    }
//}

- (void)updateViews {
    //将所有子视图从父视图上移除
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    self.scrollView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
     
    NSInteger index = 0;
    NSInteger n = self.imageArr.count;
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    
    for (int i = 0; i < n; i++) {
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(i * width, 0, width, height)];
        imgV.contentMode = UIViewContentModeScaleAspectFill;
        imgV.tag = i;
        imgV.image = [UIImage imageNamed:self.imageArr[i]];
//        [imgV rr_delaySetImageWithURLString:self.imageArr[i]
//                                placeholderImage:IMAGENAME(@"ranking_image")];
        
//        [imageView rr_downloadImageWithURLString:model.cov placeholderImage:IMAGENAME(@"ranking_cover")];
        [self.scrollView addSubview:imgV];
//        imageView.userInteractionEnabled = YES;
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
//        [imageView addGestureRecognizer:tap];
    }
  
    self.scrollView.contentSize = CGSizeMake(width * n, height);
    
    self.pageControl.numberOfPages = n;
    self.pageControl.currentPage = 0;
    CGSize size = [self.pageControl customSizeForNumberOfPage:n];
    self.pageControl.frame = CGRectMake((self.frame.size.width - size.width) / 2.0, self.frame.size.height - size.height - 5, size.width, size.height);
    
    self.pageControl.hidden = (n > 1) ? NO : YES;
    
    //滑动
    [self scrollViewDidEndScroll];
}

- (void)setImageArr:(NSArray *)imageArr {
    _imageArr = imageArr;
    [self updateViews];
}

#pragma - mark UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        BOOL dragToDragStop = scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
        if (dragToDragStop) {
            [self scrollViewDidEndScroll];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    BOOL scrollToScrollStop = !scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
    if (scrollToScrollStop) {
        [self scrollViewDidEndScroll];
    }
}

- (void)scrollViewDidEndScroll {
    
    //在这里写监听滑动停止要做的事
    NSInteger index = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    self.pageControl.currentPage = index;
}

#pragma - mark lazy
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        _scrollView.bounces = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

- (RRDIYPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[RRDIYPageControl alloc] init];
        _pageControl.frame = CGRectMake(0, 0, 100, 12);
        _pageControl.currentPage = 0;
        _pageControl.pageIndicatorTintColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.5];
        _pageControl.currentPageIndicatorTintColor = kCOLOR_FFFFFF;
        _pageControl.pageControlDotSize = RRMakePageControlDotSize(4.5, 4.5, 4.5);
    }
    return _pageControl;
}
@end
