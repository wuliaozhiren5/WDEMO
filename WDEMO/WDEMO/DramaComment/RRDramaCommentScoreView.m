//
//  RRDramaCommentScoreView.m
//  NJVideo
//
//  Created by WDEMO on 2021/8/9.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRDramaCommentScoreView.h"

@implementation RRDramaCommentScoreView

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
        [self setupViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self addSubview:self.backgroundView];
    [self addSubview:self.recommendLab];
    [self addSubview:self.starScoreView];
    [self addSubview:self.scoreLab];
    
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
     }];
    
    [self.recommendLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@0);
        make.centerY.equalTo(self);
    }];
    
    [self.starScoreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.recommendLab.mas_trailing).offset(4);
        make.centerY.equalTo(self);
        make.width.equalTo(@68);
        make.height.equalTo(@12);
    }];
    
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.starScoreView.mas_trailing).offset(4);
        make.centerY.equalTo(self.mas_centerY).offset(0.5);
    }];
    
    self.recommendLab.text = @"推荐";
    CGFloat score= 9;
    self.scoreLab.text = [NSString stringWithFormat:@"%.1f", score];
    [self.starScoreView dramaCommentScore:10];
}

- (void)setScore:(CGFloat)score {
    
    _score = score;

    if (score >= 10) {
        score = 10;
    }
    if (score <= 0) {
        score = 0;
    }
     
    NSString *recommendText = @"推荐";
    NSInteger temp = score / 2; //0-5分
    switch (temp) {
        case 1:
            recommendText = @"很差";
            break;
        case 2:
            recommendText = @"较差";
            break;
        case 3:
            recommendText = @"还行";
            break;
        case 4:
            recommendText = @"推荐";
            break;
        case 5:
            recommendText = @"力荐";
            break;
        default:
            break;
    }
    
    self.recommendLab.text = recommendText;
    self.scoreLab.text = [NSString stringWithFormat:@"%.1f", score];//保留一位小数？
    [self.starScoreView dramaCommentScore:score];
}

- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] init];
        _backgroundView.frame = CGRectMake(0, 0, 40, 40);
    }
    return _backgroundView;
}

- (UILabel *)recommendLab {
    if (!_recommendLab) {
        _recommendLab = [[UILabel alloc] init];
        _recommendLab.frame = CGRectMake(0, 0, 40, 40);
//        _recommendLab.font = SYSTEMFONT(12);
        _recommendLab.font = SYSTEMFONT(12);
        _recommendLab.textColor = kCOLOR_85888F;
    }
    return _recommendLab;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [[UILabel alloc] init];
        _scoreLab.frame = CGRectMake(0, 0, 40, 40);
//        _scoreLab.font = RR_COMMONFONT(12);
        _scoreLab.font = BebasNeue(12);
        _scoreLab.textColor = kCOLOR_1890FF;
    }
    return _scoreLab;
}

- (RRStarScoreView *)starScoreView {
    if (!_starScoreView) {
        _starScoreView = [[RRStarScoreView alloc] init];
        [_starScoreView createScoreViewWithCount:5 width:12 height:12 spacing:2 defaultStarImageName:@"ic_juji_star3" halfStarImageName:@"ic_juji_star2" fullStarImageName:@"ic_juji_star"];
    }
    return _starScoreView;
}

@end
