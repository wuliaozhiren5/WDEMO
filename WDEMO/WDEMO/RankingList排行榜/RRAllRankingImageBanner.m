//
//  RRAllRankingImageBanner.m
//  WDEMO
//
//  Created by WDEMO on 2021/10/21.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "RRAllRankingImageBanner.h"
  
@implementation RRAllRankingImageBanner

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
    [self addSubview:self.page];

//    self.clipsToBounds = YES;
}

- (void)updateViews {
 
    //将所有子视图从父视图上移除
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.pageControl.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.page.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    self.scrollView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    if (!(self.imageArr.count > 0)) {
        return;
    }
    
    NSInteger index = 0;
    NSInteger n = self.imageArr.count;
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    
    for (int i = 0; i < n; i++) {
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(i * width, 0, width, height)];
        imgV.contentMode = UIViewContentModeScaleAspectFill;
        imgV.tag = i;
//        [imgV rr_delaySetImageWithURLString:self.imageArr[i]
//                                placeholderImage:IMAGENAME(@"ranking_image")];
//        [imageView rr_downloadImageWithURLString:model.cov placeholderImage:IMAGENAME(@"ranking_cover")];
        imgV.image = IMAGENAME(@"ranking_cover");
        imgV.backgroundColor = [UIColor grayColor];
        [self.scrollView addSubview:imgV];
        imgV.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [imgV addGestureRecognizer:tap];
    }
  
    self.scrollView.contentSize = CGSizeMake(width * n, height);
    self.scrollView.contentOffset = CGPointMake(0, 0);
    
    self.pageControl.numberOfPages = n;
    self.pageControl.currentPage = 0;
    
    if (n > 1) {
        CGSize size = [self.pageControl customSizeForNumberOfPage:n];
        self.pageControl.frame = CGRectMake((self.frame.size.width - size.width) / 2.0, self.frame.size.height - size.height - 5, size.width, size.height);
    } else {
        self.pageControl.frame = CGRectZero;
    }
    
    //滑动
    [self scrollViewDidEndScroll];
    
    CGFloat spacing = 4.5;
    CGFloat pointWidth = 4.5;
    CGFloat pointHeight = 4.5;
    self.page.numberOfPages = n;
    self.page.currentPage = 0;
    self.page.pointWidth = 4.5;
    self.page.pointHeight = 4.5;
    self.page.pointSpacing = 4.5;
    self.page.pointCornerRadius = 4.5 / 2.0;
    self.page.pageIndicatorTintColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.5];
    self.page.currentPageIndicatorTintColor = kCOLOR_FFFFFF;
    self.page.frame = CGRectMake(0, 0, n * pointWidth + spacing * (n - 1), pointHeight);
    self.page.center = CGPointMake(self.frame.size.width/ 2.0, self.frame.size.height - self.page.frame.size.height - 25);
}

- (void)setImageArr:(NSArray *)imageArr {
    _imageArr = imageArr;
    [self updateViews];
}

- (void)slide:(NSInteger)tag {
    if (self.slideImage) {
        self.slideImage(tag);
    }
}

#pragma mark - 点击图片
- (void)tap:(UITapGestureRecognizer *)tap {
    NSInteger tag = tap.view.tag;
    if (self.clickImage) {
        self.clickImage(tag);
    }
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
    self.page.currentPage = index;

    [self slide:index];
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

- (RRAllRankingPageControl *)page {
    if (!_page) {
        _page = [[RRAllRankingPageControl alloc] init];
    }
    return _page;

}
@end
