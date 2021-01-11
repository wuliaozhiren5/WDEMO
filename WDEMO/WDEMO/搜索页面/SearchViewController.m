//
//  SearchViewController.m
//  WDEMO
//
//  Created by rrtv on 2021/1/9.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "SearchViewController.h"
#import "ACMacros.h"

@interface SearchViewController ()<SearchBarDelegate>

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
    [self setupViews];

}

- (void)setupViews {
    UISearchBar * bar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 100, 375, 52)];
    [self.view addSubview:bar];
 

    SearchBar *searchBar = [[SearchBar alloc] initWithFrame:CGRectMake(0, 0, 375, 52)];
    searchBar.backgroundColor = [UIColor darkGrayColor];
    searchBar.delegate = self;
    [self.view addSubview:searchBar];
}

#pragma mark - SearchBarDelegate
- (void)searchBarDidBeginEditing:(SearchBar *)searchBar {
    
}

- (void)searchBarDidEndEditing:(SearchBar *)searchBar {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchBarDidChange:(SearchBar *)searchBar {
    
}

- (void)searchBarShouldReturn:(SearchBar *)searchBar {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end


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
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.width = frame.size.width;
        self.height = frame.size.height;
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    
    [self addSubview:self.cancelBtn];
    [self addSubview:self.textView];
    [self.textView addSubview:self.iconImageView];
    [self.textView addSubview:self.deleteBtn];
    [self.textView addSubview:self.textField];

    self.cancelBtn.backgroundColor = [UIColor greenColor];
    self.textField.backgroundColor = self.textView.backgroundColor = [UIColor grayColor];
    self.iconImageView.backgroundColor = [UIColor redColor];
 
    [self.textField becomeFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    return YES;
//}
 

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
}

- (void)clickDeleteBtn:(UIButton *)btn {
    self.textField.text = @"";
    [self showDeletBtn:NO];
}

- (void)clickCancelBtn:(UIButton *)btn {
    if (self.textField.isFirstResponder) {
        [self.textField resignFirstResponder];
    } else {
//        [self.textField becomeFirstResponder];
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarDidEndEditing:)]) {
        [self.delegate searchBarDidEndEditing:self];
    }
}

- (UIView *)textView {
    if (!_textView) {
        _textView = [[UIView alloc] initWithFrame:CGRectMake(16, 11, self.width - 16 - _cancelBtn.frame.size.width, 30)];
        _textView.backgroundColor = [UIColor grayColor];
        _textView.layer.cornerRadius = 15;
        _textView.layer.masksToBounds = YES;
     }
    return _textView;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 7.5, 15, 15)];
        _iconImageView.image = [UIImage imageNamed:@""];
     }
    return _iconImageView;;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(_iconImageView.frame.origin.x + _iconImageView.frame.size.width + 8, 0 , _textView.frame.size.width - _iconImageView.frame.origin.x - _iconImageView.frame.size.width - _deleteBtn.frame.size.width - 8, 30)];
        _textField.delegate = self;
        [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        _textField.returnKeyType = UIReturnKeySearch;
     }
    return _textField;;
}

- (UIButton *)deleteBtn {
    if (!_deleteBtn) {
        _deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(_textView.frame.size.width - 40, 0, 40, 30)];
        [_deleteBtn setTitle:@"X" forState:UIControlStateNormal];
//        [_deleteBtn setImage:[UIImage imageNamed:@"ic_common_checkbox"] forState:UIControlStateNormal];
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
//        [_cancelBtn setImage:[UIImage imageNamed:@"ic_common_checkbox"] forState:UIControlStateNormal];

//        [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(clickCancelBtn:)forControlEvents:UIControlEventTouchUpInside];
     }
    return _cancelBtn;;
}
@end
