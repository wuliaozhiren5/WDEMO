//
//  RRDramaCommentDetailScoreView.m
//  NJVideo
//
//  Created by WDEMO on 2021/8/11.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRDramaCommentDetailScoreView.h"

@implementation RRDramaCommentDetailScoreView

- (void)setupViews {
    [self addSubview:self.backgroundView];
    [self addSubview:self.recommendLab];
    [self addSubview:self.starScoreView];
    [self addSubview:self.scoreLab];
    
    [self.recommendLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@12);
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
        make.centerY.equalTo(self);
    }];
    
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.leading.equalTo(self.recommendLab.mas_leading).offset(-12);
        make.trailing.equalTo(self.starScoreView.mas_trailing).offset(12);
    }];
    
    self.scoreLab.hidden = YES;
    
    self.recommendLab.textColor = kCOLOR_1890FF;
    self.backgroundView.backgroundColor = [kCOLOR_1890FF colorWithAlphaComponent:0.12];
    self.backgroundView.layer.cornerRadius = 15;
    self.backgroundView.layer.masksToBounds = YES;
    
    self.recommendLab.text = @"推荐";
    CGFloat score= 9;
    self.scoreLab.text = [NSString stringWithFormat:@"%.1f", score];
    [self.starScoreView dramaCommentScore:10];
    
}
@end
