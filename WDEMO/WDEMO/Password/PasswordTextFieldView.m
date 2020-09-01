//
//  PasswordTextFieldView.m
//  WDEMO
//
//  Created by rrtv on 2020/8/31.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "PasswordTextFieldView.h"
#import <Masonry/Masonry.h>
#import "ACMacros.h"
#import <YYKit/YYKit.h>

@interface PasswordTextFieldView ()
@end

@implementation PasswordTextFieldView
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.textField];
        [self addSubview:self.showTextBtn];
        [self addSubview:self.lineView];

        CGFloat lineWidth = kMinBorderWidth;
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(0);
            make.leading.equalTo(self.mas_leading).offset(21);
            make.trailing.equalTo(self.mas_trailing).offset(-21);
            make.height.equalTo(@(lineWidth));
        }];
        
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@(21));
            make.trailing.equalTo(@(-(21 + 21 + 30)));
            make.bottom.equalTo(self.lineView.mas_top).offset(0);
            make.height.equalTo(@(45));

        }];
        
        [self.showTextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(@(-21));
            make.centerY.equalTo(self.textField);
            make.width.equalTo(@30);
            make.height.equalTo(@30);
        }];
    }
    return self;
}

- (void)clickShowTextBtn:(UIButton *)btn {
    _textField.secureTextEntry = !_textField.secureTextEntry;

    if (_textField.secureTextEntry) {
        [_showTextBtn setImage:[UIImage imageNamed:@"ic_common_vip_nosee"] forState:UIControlStateNormal];
    }else {
        [_showTextBtn setImage:[UIImage imageNamed:@"ic_common_see"] forState:UIControlStateNormal];
    }
}

-(void)setPlaceholder:(NSString *)placeholder {
    _textField.placeholder = placeholder;
}

-(void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder{
    _textField.attributedPlaceholder = attributedPlaceholder;
}

- (PasswordTextField *)textField {
    if (!_textField) {
        _textField = [[PasswordTextField alloc]init];
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.keyboardType = UIKeyboardTypeASCIICapable;
        _textField.placeholder = @"请输入密码";
        //         _textField.textColor = [UIColor loginColorFromHexRGB:@"2D3C4E"];
        _textField.font = [UIFont systemFontOfSize:21];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.secureTextEntry = YES;
        //光标颜色
        _textField.tintColor = kCOLOR_00BBFF;
        //        [_textField addTarget:self
        //                       action:@selector(textFieldDidChange:)
        //             forControlEvents:UIControlEventEditingChanged];
        //        _textField.delegate = self;
    }
    return _textField;
}

- (UIButton *)showTextBtn {
    if (!_showTextBtn) {
        
        _showTextBtn = [[UIButton alloc] init];
        _showTextBtn.backgroundColor = [UIColor clearColor];
        [_showTextBtn setImage:[UIImage imageNamed:@"ic_common_see"] forState:UIControlStateNormal];
        [_showTextBtn setImage:[UIImage imageNamed:@"ic_common_vip_nosee"] forState:UIControlStateNormal];
        [_showTextBtn addTarget:self action:@selector(clickShowTextBtn:) forControlEvents:UIControlEventTouchUpInside];
        _showTextBtn.titleLabel.font = [UIFont systemFontOfSize:13];
 
    }
    return _showTextBtn;
    
}

-(UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectZero];
//        _lineView.backgroundColor = kCOLOR_dynamicProvider_E6E7E8_333333;
        _lineView.backgroundColor = kCOLOR_E6E7E8;

    }
    return _lineView;
}
@end
