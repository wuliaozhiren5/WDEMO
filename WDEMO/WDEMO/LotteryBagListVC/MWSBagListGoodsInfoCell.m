//
//  MWSBagListGoodsInfoCell.m
//  MoWanShang
//
//  Created by rrtv on 2022/3/29.
//

#import "MWSBagListGoodsInfoCell.h"

@implementation MWSBagListGoodsInfoCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
  
    [self.contentView addSubview:self.levelLab];
    [self.contentView addSubview:self.countLab];
    
    [self.levelLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@0);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.levelLab.mas_trailing).offset(6);
        make.centerY.equalTo(self.contentView);
    }];

    self.levelLab.text = @"A";
    self.countLab.text = @"99/99";
}

- (void)setModel:(MWSLotteryDetailGoodsInfoModel *)model {
    _model = model;
    if (self.level && [model.good_level isEqualToString:self.level]) {
        self.levelLab.textColor = [UIColor redColor];
    } else {
        self.levelLab.textColor = [UIColor blackColor];

    }
    self.levelLab.text = model.good_level;
    self.countLab.text = [NSString stringWithFormat:@"%zi/%zi", model.good_left, model.good_total];
}

- (UILabel *)levelLab {
    if (!_levelLab) {
        _levelLab = [[UILabel alloc] init];
        _levelLab.font = [UIFont systemFontOfSize:14];
        //        _levelLab.textAlignment = NSTextAlignmentLeft;
    }
    return _levelLab;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [[UILabel alloc] init];
        _countLab.font = [UIFont systemFontOfSize:14];
        //        _countLab.textAlignment = NSTextAlignmentLeft;
    }
    return _countLab;
}
@end
