//
//  RRAllRankingListHeader.m
//  WDEMO
//
//  Created by rrtv on 2021/10/21.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "RRAllRankingListHeader.h"

@implementation RRAllRankingListHeader

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
        
    }
    return self;
}

- (void)setupViews {
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.leading.equalTo(@8);
        make.trailing.equalTo(@-8);
        make.bottom.equalTo(@0);
    }];
    
    self.titleLab.text = @"24小时更新，24小时更新，24小时更新，24小时更新，24小时更新，24小时更新，24小时更新，，24小时更新，24小时更新，24小时更新，，24小时更新，24小时更新。";
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.frame = CGRectMake(0, 0, 40, 40);
        _titleLab.font = RR_COMMONFONT(12);
        _titleLab.textColor = kCOLOR_88898F;
    }
    return _titleLab;
}
@end
