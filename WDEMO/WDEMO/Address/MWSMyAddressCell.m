//
//  MWSMyAddressCell.m
//  MoWanShang
//
//  Created by rrtv on 2022/5/18.
//

#import "MWSMyAddressCell.h"

@implementation MWSMyAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        self.backgroundColor = kCOLOR_dynamicProvider_F7F8FA_292B31;
        self.contentView.backgroundColor = kCOLOR_0F0F0F;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupViews];
    } else {}
    return self;
}

- (void)setupViews {
    [self.contentView addSubview:self.container];
    [self.container addSubview:self.nameLab];
    [self.container addSubview:self.phoneLab];
    [self.container addSubview:self.addressLab];

    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@6);
        make.bottom.equalTo(@-6);
        make.leading.equalTo(@12);
        make.trailing.equalTo(@-12);
    }];
    
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.leading.equalTo(@15);
//        make.trailing.equalTo(@0);
        make.height.equalTo(@23);
    }];

    [self.phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLab);
        make.leading.equalTo(self.nameLab.mas_trailing).offset(5);
        make.trailing.lessThanOrEqualTo(@-15);
//        make.height.equalTo(@20);
    }];
    
    [self.addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLab.mas_bottom).offset(8);
        make.leading.equalTo(@15);
        make.trailing.equalTo(@-15);
//        make.bottom.equalTo(@-15);
//        make.height.equalTo(@40);
    }];
    
    self.nameLab.text = @"汤姆克鲁斯";
    self.phoneLab.text = @"13912341234";
    self.addressLab.text = @"某某某省 某某某市 某某某区 某某某街道 xx路9999弄999号99室";
    
}

- (void)setModel:(MWSAddressModel *)model {
    _model = model;
    self.nameLab.text = model.name;
    self.phoneLab.text = model.phone;
    self.addressLab.text = [NSString stringWithFormat:@"%@ %@", model.area, model.address];
}

//lazy
- (UIView *)container {
    if (!_container) {
        _container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        _container.backgroundColor = kCOLOR_292929;
        _container.layer.cornerRadius = 4.0;
        _container.layer.masksToBounds = YES;
    }
    return _container;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] init];
        _nameLab.font = [UIFont systemFontOfSize:15];
//        _nameLab.textAlignment = NSTextAlignmentLeft;
//        _nameLab.numberOfLines = 1;
//        _nameLab.textColor = [UIColor redColor];
        _nameLab.textColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.9];
        _nameLab.font = [UIFont boldSystemFontOfSize:16];
    }
    return _nameLab;
}

- (UILabel *)phoneLab {
    if (!_phoneLab) {
        _phoneLab = [[UILabel alloc] init];
        _phoneLab.font = [UIFont systemFontOfSize:15];
//        _phoneLab.textAlignment = NSTextAlignmentLeft;
//        _phoneLab.numberOfLines = 1;
//        _phoneLab.textColor = [UIColor redColor];
        _phoneLab.textColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.9];
        _phoneLab.font = [UIFont systemFontOfSize:12];

    }
    return _phoneLab;
}

- (UILabel *)addressLab {
    if (!_addressLab) {
        _addressLab = [[UILabel alloc] init];
        _addressLab.font = [UIFont systemFontOfSize:12];
//        _addressLab.textAlignment = NSTextAlignmentLeft;
        _addressLab.numberOfLines = 2;
//        _addressLab.textColor = [UIColor redColor];
        _addressLab.textColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.9];
        _addressLab.font = [UIFont systemFontOfSize:12];

    }
    return _addressLab;
}

@end
