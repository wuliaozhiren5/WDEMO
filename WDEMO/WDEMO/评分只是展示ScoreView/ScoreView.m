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
@property (assign, nonatomic)NSInteger count;
@property (assign, nonatomic)CGFloat score;
@property (assign, nonatomic)NSString *defaultStarImageName;
@property (assign, nonatomic)NSString *halfStarImageName;
@property (assign, nonatomic)NSString *fullStarImageName;
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


- (void)oldscore:(CGFloat)score {
    if (_score == score) {
        return;
    }
    _score = score;
    CGFloat value = 100 / _count;//中间值 100 / 5 = 20
    //    score 0.0-10.0
    //    CGFloat starScore = score * 10;
    CGFloat temp = score * 10;;
    NSInteger n = self.imageViewArray.count;
    for (NSInteger i = 0; i < n; i++) {
        UIImageView *imageView = self.imageViewArray[i];
        if (temp <= 0.0 ) {
            //无星
            imageView.image = [UIImage imageNamed:self.defaultStarImageName];
        } else if (temp > 0.0 && temp < value) {
            //半星
            imageView.image = [UIImage imageNamed:self.halfStarImageName];
        } else {
            //全星
            imageView.image = [UIImage imageNamed:self.fullStarImageName];
        }
        temp = temp - value;
    }
}
@end

@interface ScoreTitleView ()
@property (strong, nonatomic)UILabel *scoreTitleLabel;
@property (strong, nonatomic)UIFont *scoreTitleFont;
@property (strong, nonatomic)UIColor *scoreTitleColor;
@property (assign, nonatomic)CGFloat scoreTitleSpacing;
@end

@implementation ScoreTitleView
- (void)createScoreViewTitleWithTitltFont:(UIFont *)titltFont
                               titltColor:(UIColor *)titltColor
                             titltSpacing:(CGFloat)titltSpacing {
    UIFont *scoreTitleFont = titltFont ? titltFont: [UIFont systemFontOfSize:10];
    UIColor *scoreTitleColor = titltColor ? titltColor: [UIColor grayColor];
    CGFloat scoreTitleSpacing = titltSpacing > 0 ? titltSpacing : 5;
    self.scoreTitleFont = scoreTitleFont;
    self.scoreTitleColor = scoreTitleColor;
    self.scoreTitleSpacing = scoreTitleSpacing;
    
    self.scoreTitleLabel.font = scoreTitleFont;
    self.scoreTitleLabel.textColor = scoreTitleColor;
}

- (void)scoreTitleStr:(NSString *)titleStr {
    self.scoreTitleLabel.text = titleStr;
    UIImageView *lastImageView = self.imageViewArray.lastObject;
    CGSize size = [self.scoreTitleLabel sizeThatFits:CGSizeZero];
    self.scoreTitleLabel.frame = CGRectMake(lastImageView.frame.origin.x + lastImageView.frame.size.width + self.scoreTitleSpacing, 0, size.width, size.height);
    self.scoreTitleLabel.center = CGPointMake(self.scoreTitleLabel.center.x, self.frame.size.height/2.0);
}

-(UILabel *)scoreTitleLabel {
    if (!_scoreTitleLabel) {
        _scoreTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _scoreTitleLabel.font = [UIFont systemFontOfSize:10];
        _scoreTitleLabel.textColor = [UIColor blackColor];
        [self addSubview:_scoreTitleLabel];
    }
    return _scoreTitleLabel;
}
@end
