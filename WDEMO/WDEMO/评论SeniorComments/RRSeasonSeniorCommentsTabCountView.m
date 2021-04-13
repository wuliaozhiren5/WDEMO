//
//  RRSeasonSeniorCommentsTabCountView.m
//  PUClient
//
//  Created by rrtv on 2021/4/10.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsTabCountView.h"

@implementation RRSeasonSeniorCommentsTabCountView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    
//}
//- (void)addCommentCountLabel:(UIView *)tab {
//    if (!tab) {
//        return;
//    }
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    view.backgroundColor = [UIColor whiteColor];
//    [tab.superview addSubview:view];
    
    UILabel *tagLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 23, 11)];
    tagLab.textAlignment = NSTextAlignmentCenter;
    tagLab.font = SYSTEMFONT(8);
    tagLab.textColor = kCOLOR_0091FF;
    tagLab.backgroundColor = [kCOLOR_0091FF colorWithAlphaComponent:0.1];
    tagLab.layer.cornerRadius = 3;
    tagLab.layer.masksToBounds = YES;
    tagLab.text = @"NEW";
    [self addSubview:tagLab];

    UILabel *countLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 11, 100, 11)];
    countLab.font = SYSTEMFONT(12);
    countLab.textColor = kCOLOR_88898F;
    countLab.text = @"1";
    [self addSubview:countLab];

    [tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(0));
        make.leading.equalTo(@(0));
        make.width.equalTo(@(23));
        make.height.equalTo(@(11));
    }];
    [countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(11));
        make.leading.equalTo(@(0));
    }];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(countLab);
        make.trailing.equalTo(countLab);
//        make.bottom.equalTo(tab.mas_bottom);
//        make.leading.equalTo(tab.mas_trailing);//.offset(2);
    }];
    
    _tagLab = tagLab;
    _countLab = countLab;

}
@end
