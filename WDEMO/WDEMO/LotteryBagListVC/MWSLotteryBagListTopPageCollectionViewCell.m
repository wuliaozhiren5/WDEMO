//
//  MWSLotteryBagListTopPageCollectionViewCell.m
//  MoWanShang
//
//  Created by rrtv on 2022/3/30.
//

#import "MWSLotteryBagListTopPageCollectionViewCell.h"

@implementation MWSLotteryBagListTopPageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
  
    [self.contentView addSubview:self.backgroungImgV];
    [self.contentView addSubview:self.titleLab];

    [self.backgroungImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
    }];
    
    self.titleLab.text = @"1-200箱";
    self.titleLab.textColor = [UIColor whiteColor];

    self.backgroungImgV.image = [UIImage imageNamed:@"ic_change_gray"];
    self.backgroungImgV.image = [UIImage imageNamed:@"ic_change_red"];
 
//    [self.iconImgV addSubview:self.countLabBackgroundImgV];
//    //售罄view
//    [self.iconImgV addSubview:self.sellOutView];
//    [self.sellOutView addSubview:self.sellOutImgV];
//
//    [self.contentView addSubview:self.countLab];
//    [self.contentView addSubview:self.goodsNameLab];
//    [self.contentView addSubview:self.goodsIdLab];
//
//
//    self.contentView.backgroundColor = [UIColor blackColor];
//    self.iconImgV.backgroundColor = [UIColor blackColor];
//    self.countLab.textColor = [UIColor whiteColor];
//    self.goodsNameLab.textColor = [UIColor whiteColor];
//    self.goodsIdLab.textColor = [UIColor whiteColor];
//
//    self.countLab.text = @"90/90";
//    self.goodsNameLab.text = @"A赏 贝吉塔贝吉塔贝吉塔贝吉塔贝吉塔";
//    self.goodsIdLab.text = @"编号：312313";
//
//    [self.iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@0);
//        make.leading.trailing.equalTo(@0);
//        make.height.equalTo(self.iconImgV.mas_width);
//    }];
//
//    [self.sellOutView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.equalTo(@0);
//        make.leading.trailing.equalTo(@0);
//    }];
//
//    [self.sellOutImgV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.iconImgV);
//        make.width.equalTo(@30);
//        make.height.equalTo(@55);
//    }];
//
//    [self.countLabBackgroundImgV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.equalTo(self.iconImgV.mas_leading);
//        make.bottom.equalTo(self.iconImgV.mas_bottom);
//        make.width.equalTo(@42);
//        make.height.equalTo(@21);
//    }];
//
//    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.equalTo(self.iconImgV.mas_leading).offset(4);
//        make.bottom.equalTo(self.iconImgV.mas_bottom).offset(-2);
//    }];
//
//    [self.goodsNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.iconImgV.mas_bottom).offset(6);
//        make.leading.equalTo(@0);
//        make.trailing.equalTo(@0);
//    }];
//
//    [self.goodsIdLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(-6);
//        make.leading.equalTo(@0);
//        make.trailing.equalTo(@0);
//    }];
    
}

- (void)setModel:(MWSLotteryBagListTopModel *)model {
    _model = model;
    
    self.titleLab.text = model.name;
    self.titleLab.textColor = [UIColor whiteColor];

    self.backgroungImgV.image = [UIImage imageNamed:@"ic_change_gray"];
    self.backgroungImgV.image = [UIImage imageNamed:@"ic_change_red"];
}

- (void)setIsSelect:(BOOL)isSelect {
    _isSelect = isSelect;
    if (isSelect) {
        self.backgroungImgV.image = [UIImage imageNamed:@"ic_change_red"];
    } else {
        self.backgroungImgV.image = [UIImage imageNamed:@"ic_change_gray"];
    }
}

//lazy
- (UIImageView *)backgroungImgV {
    if (!_backgroungImgV) {
        _backgroungImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _backgroungImgV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _backgroungImgV;
}
 
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.font = [UIFont systemFontOfSize:14];
        _titleLab.textAlignment = NSTextAlignmentCenter;

    }
    return _titleLab;
}

@end
