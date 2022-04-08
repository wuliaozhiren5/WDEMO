//
//  MWSLotteryBagListTopLevelCollectionViewCell.m
//  MoWanShang
//
//  Created by rrtv on 2022/3/30.
//

#import "MWSLotteryBagListTopLevelCollectionViewCell.h"

@implementation MWSLotteryBagListTopLevelCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
  
    [self.contentView addSubview:self.titleLab];
  
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.leading.equalTo(@0);
//        make.trailing.equalTo(@0);
    }];
    
    self.titleLab.text = @"L赏";
    self.titleLab.textColor = [UIColor whiteColor];
 
}

- (void)setModel:(MWSLotteryBagListTopModel *)model {
    _model = model;
    
    self.titleLab.text = model.name;
//    self.titleLab.textColor = [UIColor whiteColor];
 
}

- (void)setIsSelect:(BOOL)isSelect {
    _isSelect = isSelect;
    if (isSelect) {
        self.titleLab.textColor = [UIColor redColor];
    } else {
        self.titleLab.textColor = [UIColor whiteColor];
    }
}

//lazy
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
//        _titleLab.font = [UIFont systemFontOfSize:12];
//        _titleLab.textAlignment = NSTextAlignmentCenter;

    }
    return _titleLab;
}

@end
