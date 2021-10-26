//
//  RRAllRankingTagCell.m
//  WDEMO
//
//  Created by rrtv on 2021/10/21.
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
    self.titleLab.textColor = [UIColor blueColor];
    
    self.contentView.backgroundColor = [kCOLOR_A8A8A8 colorWithAlphaComponent:0.12];
    self.titleLab.textColor = kCOLOR_A8A8A8;

    self.contentView.backgroundColor = [kCOLOR_108F80 colorWithAlphaComponent:0.12];
    self.titleLab.textColor = kCOLOR_108F80;
    
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.frame = CGRectMake(0, 0, 40, 40);
        _titleLab.font = RR_COMMONFONT(14);
        _titleLab.textColor = kCOLOR_88898F;
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}
@end
