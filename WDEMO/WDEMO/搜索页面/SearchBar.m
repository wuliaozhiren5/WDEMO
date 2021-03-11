//
//  SearchBar.m
//  WDEMO
//
//  Created by rrtv on 2021/1/25.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "SearchBar.h"
#import "ACMacros.h"
#import "UIColor+color.h"
#import "THeader.h"
@interface SearchBar ()<UITextFieldDelegate>
//输入框复试图
@property (nonatomic, strong) UIView *textView;
//icon
@property (nonatomic, strong) UIImageView *iconImageView;
//输入框
@property (nonatomic, strong) UITextField *textField;
//删除按钮
@property (nonatomic, strong) UIButton *deleteBtn;
//取消按钮
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@end

@implementation SearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.width = self.frame.size.width;
        self.height = self.frame.size.height;
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_1F2126;
    [self addSubview:self.cancelBtn];
    [self addSubview:self.textView];
    [self.textView addSubview:self.iconImageView];
    [self.textView addSubview:self.deleteBtn];
    [self.textView addSubview:self.textField];

//    self.cancelBtn.backgroundColor = [UIColor greenColor];
//    self.textField.backgroundColor = self.textView.backgroundColor = [UIColor grayColor];
//    self.iconImageView.backgroundColor = [UIColor redColor];
    
//    [self.textField becomeFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    [self showDeletBtn:(textField.text.length > 0)];
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarDidBeginEditing:)]) {
        [self.delegate searchBarDidBeginEditing:self];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarDidEndEditing:)]) {
        [self.delegate searchBarDidEndEditing:self];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    textField.placeholder = textField.text;
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarShouldReturn:)]) {
        [self.delegate searchBarShouldReturn:self];
    }
    return YES;
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    return YES;
//}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSInteger kMaxLength = 20;
    NSInteger strLength = textField.text.length - range.length + string.length;
    return (strLength <= kMaxLength);
//    TOAST(@"最多输入20个字符");
}
 
- (void)textFieldDidChange:(UITextField *)textField {
    NSLog(@"textField - 输入框内容改变,当前内容为: %@",textField.text);
    NSString *textStr = textField.text;
    NSString *str = [textStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"textField - 输入框内容改变,当前内容为: %@",str);
    [self showDeletBtn:(textField.text.length > 0)];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarDidChange:)]) {
        [self.delegate searchBarDidChange:self];
    }
}

- (void)showDeletBtn:(BOOL)isShow {
    self.deleteBtn.hidden = !isShow;
//    self.textField.text = self.text
}

- (void)clickDeleteBtn:(UIButton *)btn {
    self.textField.text = @"";
    //删除按钮消失
    [self showDeletBtn:NO];
    //键盘消失
    //[self.textField resignFirstResponder];
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarDidChange:)]) {
        [self.delegate searchBarDidChange:self];
    }
}

- (void)clickCancelBtn:(UIButton *)btn {
    if (self.textField.isFirstResponder) {
        [self.textField resignFirstResponder];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarDidCancel:)]) {
        [self.delegate searchBarDidCancel:self];
    }
}

- (BOOL)becomeFirstResponder {
    return [self.textField becomeFirstResponder];
}

- (BOOL)resignFirstResponder {
    return [self.textField resignFirstResponder];
}

- (NSString *)text {
    return self.textField.text;
}

- (void)setText:(NSString *)text {
    self.textField.text = text;
    self.textField.placeholder = text;
}

- (UIView *)textView {
    if (!_textView) {
        _textView = [[UIView alloc] initWithFrame:CGRectMake(16, 11, self.width - 16 - _cancelBtn.frame.size.width, 30)];
        _textView.backgroundColor = kCOLOR_dynamicProvider_F2F4F5_2D2E33;
        _textView.layer.cornerRadius = 15;
        _textView.layer.masksToBounds = YES;
     }
    return _textView;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 7.5, 15, 15)];
        _iconImageView.image = [UIImage imageNamed:@"ic_search_results_bar_28"];
     }
    return _iconImageView;;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(_iconImageView.frame.origin.x + _iconImageView.frame.size.width + 8, 0 , _textView.frame.size.width - _iconImageView.frame.origin.x - _iconImageView.frame.size.width - _deleteBtn.frame.size.width - 8, 30)];
        _textField.delegate = self;
        [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        _textField.returnKeyType = UIReturnKeySearch;
        _textField.textColor = kCOLOR_dynamicProvider_222222_E5E7EB;
        _textField.font = RR_COMMONFONT(14);
        _textField.tintColor = kCOLOR_1890FF;

     }
    return _textField;;
}

- (UIButton *)deleteBtn {
    if (!_deleteBtn) {
        _deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(_textView.frame.size.width - 40, 0, 40, 30)];
//        [_deleteBtn setTitle:@"X" forState:UIControlStateNormal];
        [_deleteBtn setImage:[UIImage imageNamed:@"ic_search_results_bar_close_28"] forState:UIControlStateNormal];
//        [_deleteBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_deleteBtn addTarget:self action:@selector(clickDeleteBtn:)forControlEvents:UIControlEventTouchUpInside];
        _deleteBtn.hidden = YES;
     }
    return _deleteBtn;;
}

- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.width - 60, 0, 60, 52)];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:kCOLOR_dynamicProvider_222222_E5E7EB forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = RR_COMMONFONT(14);
        [_cancelBtn addTarget:self action:@selector(clickCancelBtn:)forControlEvents:UIControlEventTouchUpInside];
     }
    return _cancelBtn;;
}
@end
 
