//
//  MWSLotteryBagListTopOrderWayCollectionViewCell.m
//  MoWanShang
//
//  Created by rrtv on 2022/3/30.
//

#import "MWSLotteryBagListTopOrderWayCollectionViewCell.h"

@implementation MWSLotteryBagListTopOrderWayCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
  
    [self.contentView addSubview:self.iconImgV];
    [self.contentView addSubview:self.titleLab];
 
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.leading.equalTo(@0);
//        make.trailing.equalTo(@0);
    }];
    
    [self.iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.titleLab.mas_trailing).offset(6);
        make.centerY.equalTo(self.titleLab);
        make.width.equalTo(@15);
        make.height.equalTo(@15);
    }];
    self.titleLab.text = @"等级";
//    self.titleLab.textColor = [UIColor whiteColor];

    self.iconImgV.image = [UIImage imageNamed:@"ic_sort_n"];
    self.iconImgV.image = [UIImage imageNamed:@"ic_sort_h"];
  
//    self.iconImgV.image = [UIImage imageNamed:@"ic_down"];
//    self.iconImgV.image = [UIImage imageNamed:@"ic_up"];
    
}

- (void)setModel:(MWSLotteryBagListTopModel *)model {
    _model = model;
    
    self.titleLab.text = model.name;
    self.titleLab.textColor = [UIColor whiteColor];

    if ([model.type isEqualToString: @"level"]) {
        self.titleLab.textColor = [UIColor whiteColor];
        if (self.isOpen) {
            self.iconImgV.image = [UIImage imageNamed:@"ic_up"];
        } else {
            self.iconImgV.image = [UIImage imageNamed:@"ic_down"];
        }
    } else {
        if (self.isSelect) {
            self.titleLab.textColor = [UIColor redColor];
            self.iconImgV.image = [UIImage imageNamed:@"ic_sort_h"];
        } else {
            self.titleLab.textColor = [UIColor whiteColor];
            self.iconImgV.image = [UIImage imageNamed:@"ic_sort_n"];
        }
        
        if ([model.sort isEqualToString:@"DESC"]) {
            self.iconImgV.image = [UIImage imageNamed:@"ic_sort_h"];
        } else {
            self.iconImgV.image = [UIImage imageNamed:@"ic_sort_n"];
        }
    }

}
 
//- (void)setIsSelect:(BOOL)isSelect {
//    _isSelect = isSelect;
//    if (isSelect) {
//        self.titleLab.textColor = [UIColor redColor];
//        self.iconImgV.image = [UIImage imageNamed:@"ic_sort_h"];
//
//     } else {
//         self.titleLab.textColor = [UIColor whiteColor];
//         self.iconImgV.image = [UIImage imageNamed:@"ic_sort_n"];
//
//     }
//}
//
//- (void)setIsOpen:(BOOL)isOpen {
//    _isOpen = isOpen;
//}
//lazy
- (UIImageView *)iconImgV {
    if (!_iconImgV) {
        _iconImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _iconImgV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconImgV;
}
 
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
//        _titleLab.font = [UIFont systemFontOfSize:12];
//        _titleLab.textAlignment = NSTextAlignmentCenter;

    }
    return _titleLab;
}

@end
 
