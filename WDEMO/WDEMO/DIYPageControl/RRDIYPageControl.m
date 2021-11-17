//
//  RRDIYPageControl.m
//  NJVideo
//
//  Created by chenwenfeng on 2021/7/6.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRDIYPageControl.h"

@interface RRDIYPageControl ()

@property (nonatomic, strong) NSMutableArray *dots;

@end

@implementation RRDIYPageControl

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dots = [NSMutableArray array];
        _numberOfPages = 0;
        _currentPage = 0;
        _pageControlDotSize = RRMakePageControlDotSize(4.5, 4.5, 4.5);
        _hidesForSinglePage = NO;
        _currentPageIndicatorTintColor = kCOLOR_FFFFFF;
        _pageIndicatorTintColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.4];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat marginX = _pageControlDotSize.width + _pageControlDotSize.margin;
    for (int i = 0; i < self.dots.count; i++) {
        UIImageView *dot = [self.dots objectOrNilAtIndex:i];
        dot.layer.cornerRadius = _pageControlDotSize.width * 0.5;
        [dot setFrame:CGRectMake(i * marginX, 0, _pageControlDotSize.width, _pageControlDotSize.height)];
        if (i == _currentPage) {
            dot.backgroundColor = _currentPageIndicatorTintColor;
        }else {
            dot.backgroundColor = _pageIndicatorTintColor;
        }
    }
    [self isSingleNeedHidden];
}

- (void)setDotUI:(NSInteger)numberOfPages {
    _dots = [NSMutableArray array];
    CGFloat marginX = _pageControlDotSize.width + _pageControlDotSize.margin;
    for (int i = 0; i < numberOfPages; i++) {
        UIImageView *dot = [[UIImageView alloc] init];
        [dot setFrame:CGRectMake(i * marginX, 0, _pageControlDotSize.width, _pageControlDotSize.height)];
        dot.layer.cornerRadius = _pageControlDotSize.width * 0.5;
        if (i == _currentPage) {
            dot.backgroundColor = _currentPageIndicatorTintColor;
        }else {
            dot.backgroundColor = _pageIndicatorTintColor;
        }
        [_dots addObject:dot];
        [self addSubview:dot];
    }
    [self isSingleNeedHidden];
}

- (void)setNumberOfPages:(NSInteger)numberOfPages {
    _numberOfPages = numberOfPages;
    [self setDotUI:numberOfPages];
    [self isSingleNeedHidden];
}

- (void)setCurrentPage:(NSInteger)currentPage {
    _currentPage = currentPage;
    for (int i = 0; i < _dots.count; i++) {
        UIImageView *dot = [_dots objectAtIndex:i];
        if (i == _currentPage) {
            dot.backgroundColor = _currentPageIndicatorTintColor;
        }else {
            dot.backgroundColor = _pageIndicatorTintColor;
        }
    }
}

- (void)setPageControlDotSize:(RRPageControlDotSize)pageControlDotSize {
    if (pageControlDotSize.width <= 0) {
        NSAssert(NO, @"pageControlDotSize.width <= 0");
    }
    pageControlDotSize.width = pageControlDotSize.width;
    if (pageControlDotSize.height <= 0) {
        NSAssert(NO, @"pageControlDotSize.height <= 0");
    }
    pageControlDotSize.height = pageControlDotSize.height;
    pageControlDotSize.margin = pageControlDotSize.margin;
    _pageControlDotSize = pageControlDotSize;
}

- (void)setHidesForSinglePage:(BOOL)hidesForSinglePage {
    _hidesForSinglePage = hidesForSinglePage;
    [self isSingleNeedHidden];
}

- (void)isSingleNeedHidden {
    self.hidden = (_numberOfPages == 1 && _hidesForSinglePage);
}

- (CGSize)customSizeForNumberOfPage:(NSInteger)page {
    return CGSizeMake((_pageControlDotSize.width + _pageControlDotSize.margin) * page - _pageControlDotSize.margin, _pageControlDotSize.height);
}

@end

