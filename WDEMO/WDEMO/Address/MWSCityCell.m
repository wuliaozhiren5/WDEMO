//
//  MWSCityCell.m
//  MoWanShang
//
//  Created by rrtv on 2022/5/23.
//

#import "MWSCityCell.h"

@implementation MWSCityCell

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
        self.contentView.backgroundColor = kCOLOR_292929;
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupViews];
    } else {}
    return self;
}

- (void)setupViews {
    [self.contentView addSubview:self.nameLab];
    [self.contentView addSubview:self.line];

    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.leading.equalTo(@15);
//        make.trailing.equalTo(@0);
        make.height.equalTo(@23);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@12);
        make.trailing.equalTo(@-12);
        make.bottom.equalTo(@0);
        make.height.equalTo(@0.5);
    }];
    self.nameLab.text = @"xxx";
     
}

//- (void)setModel:(MWSProvinceModel *)model {
//    _model = model;
//    self.nameLab.text = model.name;
//
//}

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

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0.5)];
        _line.backgroundColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.4];
    }
    return _line;
}
@end
