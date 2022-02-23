//
//  RRAllRankingPageControl.m
//  WDEMO
//
//  Created by WDEMO on 2021/12/3.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "RRAllRankingPageControl.h"
@interface RRAllRankingPageControl ()
@property (nonatomic, strong) NSMutableArray *pointArr;
@end

@implementation RRAllRankingPageControl

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init {
    self = [super init];
    if (self) {
        _numberOfPages = 0;
        _currentPage = 0;
        _pointWidth = 5.0;
        _pointHeight = 5.0;
        _pointCornerRadius = 2.5;
        _pointSpacing = 5.0;
        _pageIndicatorTintColor = [UIColor grayColor];
        _currentPageIndicatorTintColor = [UIColor whiteColor];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _numberOfPages = 0;
        _currentPage = 0;
        _pointWidth = 5.0;
        _pointHeight = 5.0;
        _pointCornerRadius = 2.5;
        _pointSpacing = 5.0;
        _pageIndicatorTintColor = [UIColor grayColor];
        _currentPageIndicatorTintColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //将所有子视图从父视图上移除
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.pointArr = [NSMutableArray array];
    
    NSInteger numberOfPages = _numberOfPages;
    NSInteger currentPage = _currentPage;
    CGFloat width  = _pointWidth;
    CGFloat height = _pointHeight;
    CGFloat spacing = _pointSpacing;
    UIColor *defaultColor = _pageIndicatorTintColor;
    UIColor *selectColor = _currentPageIndicatorTintColor;
    CGFloat cornerRadius = _pointCornerRadius;

    for (NSInteger i = 0; i < numberOfPages; i++) {
        UIImageView *point = [[UIImageView alloc] init];
        point.frame = CGRectMake(width * i + spacing * i , 0, width, height);
        point.layer.cornerRadius = cornerRadius;
        point.layer.masksToBounds = YES;
        point.backgroundColor = defaultColor;
        point.tag = i;
        if (i == currentPage) {
            point.backgroundColor = selectColor;
        }
        [self addSubview:point];
        [self.pointArr addObject:point];
    }
//    self.backgroundColor = [UIColor blackColor];
//    self.frame = CGRectMake(0, 0, width * numberOfPages + spacing * (numberOfPages - 1), height); 
}

- (void)setCurrentPage:(NSInteger)currentPage {
    _currentPage = currentPage; 
//    if (self.pointArr && self.pointArr.count > 0) {
//        UIColor *defaultColor = _pageIndicatorTintColor;
//        UIColor *selectColor = _currentPageIndicatorTintColor;
//        NSInteger numberOfPages = _numberOfPages;
//        for (NSInteger i = 0; i < numberOfPages; i++) {
//            UIImageView *point = self.pointArr[i];
//            point.backgroundColor = defaultColor;
//            if (i == currentPage) {
//                point.backgroundColor = selectColor;
//            }
//        }
//    }
    UIColor *defaultColor = _pageIndicatorTintColor;
    UIColor *selectColor = _currentPageIndicatorTintColor;
    for (UIImageView *point in self.pointArr) {
        point.backgroundColor = defaultColor;
        NSInteger i = point.tag;
        if (i == currentPage) {
            point.backgroundColor = selectColor;
        }
    }
}
@end
