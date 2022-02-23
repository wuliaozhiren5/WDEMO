//
//  RRAllRankingTagCell.m
//  WDEMO
//
//  Created by WDEMO on 2021/10/21.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "RRAllRankingTagCell.h"

@implementation RRAllRankingTagCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
        
    }
    return self;
}

- (void)setupViews {
    self.contentView.layer.cornerRadius = 3;
    self.contentView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
        make.bottom.equalTo(@0);
    }];
 
}

- (void)setModel:(RRAllRankingTagModel *)model {
    _model = model;
    self.titleLab.text = model.name;
    if (model.isSpecialTag) {
        self.contentView.backgroundColor = [kCOLOR_2CD35B colorWithAlphaComponent:0.12];
        self.titleLab.textColor = kCOLOR_108F80;
    } else {
        self.contentView.backgroundColor = [kCOLOR_A8A8A8 colorWithAlphaComponent:0.12];
        self.titleLab.textColor = kCOLOR_A8A8A8;
    }
}

//lazy
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.frame = CGRectMake(0, 0, 40, 40);
        _titleLab.font = RR_COMMONFONT(12);
        _titleLab.textColor = kCOLOR_88898F;
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}
@end
