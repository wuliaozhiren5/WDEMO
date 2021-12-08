//
//  RRAllRankingSwitchViewCell.m
//  NJVideo
//
//  Created by rrtv on 2021/12/3.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRAllRankingSwitchViewCell.h"

@implementation RRAllRankingSwitchViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.contentView.backgroundColor = kCOLOR_F7F8FA;
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

- (void)setTitleStr:(NSString *)titleStr {
    _titleStr = titleStr;
    self.titleLab.text = titleStr;
}

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    _titleLab.font = SYSTEMFONT(15);
    _titleLab.textColor = kCOLOR_969696;
    if (isSelected) {
        _titleLab.font = BOLDSYSTEMFONT(15);
        _titleLab.textColor = kCOLOR_1890FF;
    }
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.frame = CGRectMake(0, 0, 40, 40);
        //        _titleLab.font = RR_COMMONFONT(14);
        _titleLab.font = SYSTEMFONT(15);
        _titleLab.textColor = kCOLOR_969696;
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}
@end
