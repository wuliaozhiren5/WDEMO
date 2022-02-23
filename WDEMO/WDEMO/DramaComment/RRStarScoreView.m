//
//  RRStarScoreView.m
//  NJVideo
//
//  Created by WDEMO on 2020/12/21.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import "RRStarScoreView.h"

@interface RRStarScoreView ()

@property (copy, nonatomic)NSMutableArray *imageViewArray;
@property (assign, nonatomic)NSInteger count;
@property (assign, nonatomic)CGFloat score;
@property (copy, nonatomic)NSString *defaultStarImageName;
@property (copy, nonatomic)NSString *halfStarImageName;
@property (copy, nonatomic)NSString *fullStarImageName;
@property (nonatomic, copy) void (^scoreBlock)(float);
@end

@implementation RRStarScoreView

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
        [self setStarImageName];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setStarImageName];
    }
    return self;
}

- (void)setStarImageName {
    _count = 5;
    _defaultStarImageName = @"ic_common_star_grey";
    _halfStarImageName = @"ic_common_star_halfblue";
    _fullStarImageName = @"ic_common_star_blue";
}

- (NSMutableArray *)imageViewArray {
    if (!_imageViewArray) {
        _imageViewArray = [NSMutableArray array];
    }
    return _imageViewArray;
}

//- (void)createScoreViewWithCount:(NSInteger)count width:(CGFloat)width height:(CGFloat)height spacing:(CGFloat)spacing defaultStarImageName:(NSString *)defaultStarImageName halfStarImageName:(NSString *)halfStarImageName fullStarImageName:(NSString *)fullStarImageName withBlock:(nonnull void (^)(float))block {
//
//    [self createScoreViewWithCount:count width:width height:height spacing:spacing defaultStarImageName:defaultStarImageName halfStarImageName:halfStarImageName fullStarImageName:fullStarImageName];
//    if (block) {
//        _scoreBlock = block;
//        for (int i = 0; i < self.imageViewArray.count; i ++) {
//            UIImageView *imageView = [self.imageViewArray objectOrNilAtIndex:i];
//            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doTap:)];
//            imageView.userInteractionEnabled = YES;
//            imageView.tag = i + 1;
//            [imageView addGestureRecognizer:tap];
//        }
//    }
//}

- (void)createScoreViewWithCount:(NSInteger)count
                           width:(CGFloat)width
                          height:(CGFloat)height
                         spacing:(CGFloat)spacing
            defaultStarImageName:(NSString *)defaultStarImageName
               halfStarImageName:(NSString *)halfStarImageName
               fullStarImageName:(NSString *)fullStarImageName {
                  
    if (defaultStarImageName) {
        _defaultStarImageName = defaultStarImageName;
    }
    if (halfStarImageName) {
        _halfStarImageName = halfStarImageName;
    }
    if (fullStarImageName) {
        _fullStarImageName = fullStarImageName;
    }
    [self createScoreViewWithCount:count width:width height:height spacing:spacing];
}

- (void)createScoreViewWithCount:(NSInteger)count
                           width:(CGFloat)width
                          height:(CGFloat)height
                         spacing:(CGFloat)spacing {
    //删除所有子View
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //清空数组
    [self.imageViewArray removeAllObjects];
    NSInteger starCount = count > 0 ? count : _count;
    CGFloat starWidth = width > 0 ? width : 9;
    CGFloat starHeight = height > 0 ? height : 9;
    CGFloat starSpacing = spacing > 0 ? spacing : 3;
    NSInteger n = starCount;
    _count = n;
    for (NSInteger i = 0; i < n; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake((starWidth + starSpacing) * i, 0, starWidth, starHeight);
        imageView.image = [UIImage imageNamed:self.defaultStarImageName];
        [self addSubview:imageView];
        [self.imageViewArray addObject:imageView];
    }
}

/*
规则
5星: 9.5~10
4星半：8.5~9.4
4星：7.5~8.4
3星半：6.5～7.4
3星：5.5～6.4
2星半：4.5～5.4
2星：3.5～4.4
1星半：2.5～3.4
1星：1.5～2.4
半星：0.1～1.4（一般不会出现该情况）
0星：暂无评分 （5.0版本中处理成不展示评分）
*/
- (void)score:(CGFloat)score {
    if (_score == score) {
        return;
    }
    _score = score;
    if (score > 0 && score < 0.5) {
        score = 0.5;
    }
    CGFloat temp = (score + 0.5) / 2.0 * 10;
    CGFloat value = 10.0;
    NSInteger n = self.imageViewArray.count;
    for (NSInteger i = 0; i < n; i++) {
        UIImageView *imageView = self.imageViewArray[i];
        if (temp < 5.0 ) {
            //无星
            imageView.image = [UIImage imageNamed:self.defaultStarImageName];
        } else if (temp >= 5.0 && temp < value) {
            //半星
            imageView.image = [UIImage imageNamed:self.halfStarImageName];
        } else {
            //全星
            imageView.image = [UIImage imageNamed:self.fullStarImageName];
        }
        temp = temp - value;
    }
}

/*
规则
10分：5星、
8分：4星、
6分：3星、
4分：2星、
2分：1星）
*/
- (void)dramaCommentScore:(CGFloat)score {
    if (_score == score) {
        return;
    }
    _score = score;
    
    if (score >= 10) {
        score = 10;
    }
    if (score <= 0) {
        score = 0;
    }
    NSInteger temp = score / 2; //0-5分
    NSInteger value = 1;//每次减1
    NSInteger n = self.imageViewArray.count;
    for (NSInteger i = 0; i < n; i++) {
        UIImageView *imageView = self.imageViewArray[i];
        if (temp < 1) {
            //无星
            imageView.image = [UIImage imageNamed:self.defaultStarImageName];
        } else {
            //全星
            imageView.image = [UIImage imageNamed:self.fullStarImageName];
        }
        temp = temp - value;
    }
}

- (void)doTap:(UITapGestureRecognizer *)tap {
    if (self.scoreBlock) {
        [self dramaCommentScore:tap.view.tag * 2];
        self.scoreBlock(self.score);
    }
}

@end
