//
//  RRDestroyAccountReasonCell.m
//  PUClient
//
//  Created by WDEMO on 2020/8/13.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import "RRDestroyAccountReasonCell.h"
#import "ACMacros.h"
#import <YYKit/YYKit.h>
#import <Masonry/Masonry.h>
@implementation RRDestroyAccountReasonModel

+ (instancetype)initWithTitle:(NSString *)title
                       reason:(NSString *)reason
                         type:(RRDestroyAccountReasonType)type
                       select:(BOOL)select {
    RRDestroyAccountReasonModel *model = [RRDestroyAccountReasonModel alloc];
    model.title = title;
    model.reason = reason;
    model.type = type;
    model.select = select;
    return model;
}
@end

@implementation RRDestroyAccountReasonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.selectBtn];
        
        [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(14);
            make.leading.equalTo(self.contentView.mas_leading).offset(21);
            make.width.equalTo(@30);
            make.height.equalTo(@30);
        }];
        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.selectBtn.mas_centerY);
            make.leading.equalTo(self.selectBtn.mas_trailing).offset(12);
//            make.trailing.equalTo(self.contentView.mas_trailing).offset(-21);
            make.trailing.lessThanOrEqualTo(self.contentView.mas_trailing).offset(-21);
        }];
        
    } else {}
    return self;
}

- (void)setModel:(RRDestroyAccountReasonModel *)model{
    _model = model;
    self.titleLab.text = _model.title;
    
}

-(void)isSelected:(BOOL)select{
    self.isSelected = select;
    if (self.isSelected) {
        [self.selectBtn setImage:[UIImage imageNamed:@"ic_common_radio_selected"] forState:UIControlStateNormal];
        self.titleLab.textColor = kCOLOR_00BBFF;
    }else {
        [self.selectBtn setImage:[UIImage imageNamed:@"ic_common_checkbox"] forState:UIControlStateNormal];
        self.titleLab.textColor = kCOLOR_333333; 
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _titleLab.frame = CGRectMake(0, 0, 40, 40);
        _titleLab.font = [UIFont systemFontOfSize:15.0];
        _titleLab.userInteractionEnabled = YES;
    }
    return _titleLab;
}

-(UIButton *)selectBtn {
    if (!_selectBtn) {
        _selectBtn = [[UIButton alloc]init];
        _selectBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        _selectBtn.frame = CGRectMake(0, 0, 40, 40); 
        [_selectBtn setImage:[UIImage imageNamed:@"ic_common_checkbox"] forState:UIControlStateNormal];
    }
    return _selectBtn;
}
@end



@implementation RRDestroyAccountReasonTextCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //        self.selectionStyle = UITableViewCellSelectionStyleNone;
                 //        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.textView];
        [self.contentView addSubview:self.numLabel];
        [self.textView addSubview:self.placeholderLabel];
        [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLab.mas_bottom).offset(26);
            make.leading.equalTo(self.contentView.mas_leading).offset(21);
            make.trailing.equalTo(self.contentView.mas_trailing).offset(-21);
            make.height.equalTo(@85);
        }];
        
        [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.textView.mas_bottom).offset(-13);            make.trailing.equalTo(self.textView.mas_trailing).offset(-9);
        }];
    } else {}
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void) isSelected:(BOOL)select{
    self.isSelected = select;
    if (self.isSelected) {
        [self.selectBtn setImage:[UIImage imageNamed:@"ic_common_radio_selected"] forState:UIControlStateNormal];
        self.titleLab.textColor = kCOLOR_00BBFF;
        self.textView.userInteractionEnabled = YES;
        self.textView.hidden = NO;
        self.numLabel.hidden = NO;
    }else {
        [self.selectBtn setImage:[UIImage imageNamed:@"ic_common_checkbox"] forState:UIControlStateNormal];
        self.titleLab.textColor = kCOLOR_333333;
        self.textView.userInteractionEnabled = NO;
        self.textView.hidden = YES;
        self.numLabel.hidden = YES;
    }
}

-(UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc]init];
        _textView.frame = CGRectMake(0, 0, 40, 40);
        _textView.backgroundColor = kCOLOR_F6F7F8;
        _textView.userInteractionEnabled = NO;
        _textView.textColor = kCOLOR_333333;
        _textView.font = [UIFont systemFontOfSize:15.0];
        _textView.layer.cornerRadius = 4;
        _textView.textContainerInset = UIEdgeInsetsMake(9, 9, 9, 32.5);
        //光标颜色
        _textView.tintColor = kCOLOR_00BBFF;
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineSpacing = 3;// 字体的行间距
        NSDictionary *attributes = @{NSFontAttributeName:_textView.font,
        NSForegroundColorAttributeName:kCOLOR_333333,
            NSParagraphStyleAttributeName:paragraphStyle};
        _textView.typingAttributes = attributes;

    }
    return _textView;
}

- (UILabel *)numLabel {
    if (!_numLabel) {
        _numLabel = [[UILabel alloc] init];
        _numLabel.textColor = kCOLOR_CACBCC;
        _numLabel.font =[UIFont systemFontOfSize:12.0];
        _numLabel.text = @"";
    }
    return _numLabel;
}

-(UILabel *)placeholderLabel {
    if (!_placeholderLabel) {
        _placeholderLabel = [[UILabel alloc] init];
        _placeholderLabel.frame = CGRectMake(12, 9, 200, 17);
        _placeholderLabel.font = [UIFont systemFontOfSize:15.0];
        //        _placeholderLabel.text = _placeholderStr;
        _placeholderLabel.textColor = kCOLOR_CACBCC;
        //    _placeholderLabel.enabled = NO;//lable必须设置为不可用
        _placeholderLabel.backgroundColor = [UIColor clearColor];
        [_textView addSubview:_placeholderLabel];
    }
    return _placeholderLabel;
}

@end
