//
//  MWSContactsCell.m
//  MoWanShang
//
//  Created by rrtv on 2022/5/19.
//

#import "MWSContactsCell.h"

@implementation MWSContactsCell

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
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.textField];
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.line];

    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.leading.equalTo(@12);
    }];
 
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.trailing.equalTo(@-15);
        make.width.equalTo(@12);
        make.height.equalTo(@16);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.contentView);
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.leading.equalTo(@100);
        make.trailing.equalTo(self.icon.mas_leading).offset(-10);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@12);
        make.trailing.equalTo(@-12);
        make.bottom.equalTo(@0);
        make.height.equalTo(@0.5);
    }];
//    self.nameLab.text = @"汤姆克鲁斯";
//    self.phoneLab.text = @"13912341234";
//    self.addressLab.text = @"某某某省 某某某市 某某某区 某某某街道 xx路9999弄999号99室";
    
    self.titleLab.text = @"联系人";
//    self.textField.placeholder = @"名字";
    
    NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"名字"];
    one.lineSpacing = 2.5;
    one.font = [UIFont systemFontOfSize:12];
    one.color = [kCOLOR_FFFFFF colorWithAlphaComponent:0.4];
    self.textField.attributedPlaceholder = one;
    
    self.icon.hidden = NO;
    self.icon.image = [UIImage imageNamed:@"ic_iphone"];

}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        _titleLab.font = [UIFont systemFontOfSize:14];
//        _titleLab.textAlignment = NSTextAlignmentLeft;
//        _titleLab.numberOfLines = 1;
//        _titleLab.textColor = [UIColor redColor];
        _titleLab.textColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.9];

    }
    return _titleLab;
}
 
- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        _textField.textColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.9];
        _textField.font = [UIFont systemFontOfSize:12];

    }
    return _textField;
}

- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 12, 16)];
        _icon.image = [UIImage imageNamed:@"ic_iphone"];
    }
    return _icon;
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0.5)];
        _line.backgroundColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.4];
    }
    return _line;
}
@end
