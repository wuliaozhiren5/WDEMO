//
//  MWSDetailedAddressCell.m
//  MoWanShang
//
//  Created by rrtv on 2022/5/19.
//

#import "MWSDetailedAddressCell.h"

@implementation MWSDetailedAddressCell

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
    [self.contentView addSubview:self.textView];
    [self.textView addSubview:self.textViewPlaceholder];
    [self.contentView addSubview:self.line];

    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.contentView);
        make.leading.equalTo(@12);
        make.top.equalTo(@20);

    }];

    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.contentView);
//        make.top.equalTo(self.titleLab);
        make.top.equalTo(@15);
        make.leading.equalTo(@(100 - 8));
        make.trailing.equalTo(@-12);
//        make.height.equalTo(@40);
        make.bottom.equalTo(@-15);
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
    
    self.titleLab.text = @"详细地址";
//    self.textView.text = @"详细地址";
 
    [self.textViewPlaceholder mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.contentView);
        make.top.equalTo(@8);
        make.leading.equalTo(@8);
        make.trailing.equalTo(@-4);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@12);
        make.trailing.equalTo(@-12);
        make.bottom.equalTo(@0);
        make.height.equalTo(@0.5);
    }];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        _titleLab.font = [UIFont systemFontOfSize:15];
//        _titleLab.textAlignment = NSTextAlignmentLeft;
//        _titleLab.numberOfLines = 1;
//        _titleLab.textColor = [UIColor redColor];
        _titleLab.textColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.9];

    }
    return _titleLab;
}
 
- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        _textView.delegate = self;
        _textView.font = [UIFont systemFontOfSize:12];
        _textView.backgroundColor = kCOLOR_0F0F0F;
        _textView.textColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.9];;

    }
    return _textView;
}

- (UILabel *)textViewPlaceholder {
    if (!_textViewPlaceholder) {
        _textViewPlaceholder = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        _textViewPlaceholder.text = @"详细地址";
        _textViewPlaceholder.enabled = NO;//lable必须设置为不可用
        _textViewPlaceholder.backgroundColor = [UIColor clearColor];
    
        _textViewPlaceholder.font = [UIFont systemFontOfSize:12];
        _textViewPlaceholder.textColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.4];
        
    }
    return _textViewPlaceholder;
}

//实现UITextView的代理
- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length == 0) {
        self.textViewPlaceholder.text = @"详细地址";
    } else {
        self.textViewPlaceholder.text = @"";
    }
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0.5)];
        _line.backgroundColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.4];
    }
    return _line;
}
@end
