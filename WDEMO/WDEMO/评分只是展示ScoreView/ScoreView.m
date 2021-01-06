//
//  ScoreView.m
//  WDEMO
//
//  Created by rrtv on 2020/12/18.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ScoreView.h"
@interface ScoreView ()

@property (copy, nonatomic)NSMutableArray *imageViewArray;
@property (assign, nonatomic)CGFloat score;

@end

@implementation ScoreView

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
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (NSMutableArray *)imageViewArray {
    if (!_imageViewArray) {
        _imageViewArray = [NSMutableArray array];
    }
    return _imageViewArray;
}

- (void)createScoreViewWithCount:(NSInteger)count
                           width:(CGFloat)width
                          height:(CGFloat)height
                         spacing:(CGFloat)spacing {
    //删除所有子View
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //清空数组
    [self.imageViewArray removeAllObjects];
    NSInteger starCount = count > 0 ? count : 5;
    CGFloat starWidth = width > 0 ? width : 9;
    CGFloat starHeight = height > 0 ? height : 9;
    CGFloat starSpacing = spacing > 0 ? spacing : 3;
    NSInteger n = starCount;
    for (NSInteger i = 0; i < n; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake((starWidth + starSpacing) * i, 0, starWidth, starHeight);
        imageView.image = [UIImage imageNamed:@"ic_common_star_grey"];
        [self addSubview:imageView];
        [self.imageViewArray addObject:imageView];
    }
}

- (void)score:(CGFloat)score {
    if (_score == score) {
        return;
    }
    _score = score;
    //    score 0.0-10.0
    //    CGFloat starScore = score * 10;
    CGFloat temp = score * 10;;
    NSInteger n = self.imageViewArray.count;
    for (NSInteger i = 0; i < n; i++) {
        UIImageView *imageView = self.imageViewArray[i];
        if (temp <= 0.0 ) {
            //无星
            imageView.image = [UIImage imageNamed:@"ic_common_star_grey"];
        } else if (temp > 0.0 && temp < 10.0) {
            //半星
            imageView.image = [UIImage imageNamed:@"ic_common_star_halfblue"];
        } else {
            //全星
            imageView.image = [UIImage imageNamed:@"ic_common_star_blue"];
        }
        temp = temp - 10.0;
    }
}

@end
