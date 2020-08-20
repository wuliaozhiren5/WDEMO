//
//  LZLoginModifyNicknameView.m
//  longzhu
//
//  Created by plu on 2017/10/12.
//  Copyright © 2017年 developer. All rights reserved.
//

#import "LZLoginModifyNicknameView.h"
@interface LZLoginModifyNicknameView ()

@property(strong,nonatomic)UIView *container;

@property(strong,nonatomic)UILabel *titleLab;

@property(strong,nonatomic)UILabel *contentLab;

@property(strong,nonatomic)UILabel *nameTitle;

@property(strong,nonatomic)UITextField *textField;

@property(strong,nonatomic)UIView *textFieldBackView;

@property(strong,nonatomic)UIButton *confirmBtn;

@property(strong,nonatomic)UIButton *closeBtn;

@end

@implementation LZLoginModifyNicknameView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorFromHexRGB:@"000000" alpha:0.5];
        
//        [self addTarget:self action:@selector(hidden) forControlEvents:UIControlEventTouchUpInside];
        
        _container = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 335)];
        _container.backgroundColor = [UIColor colorFromHexRGB:@"ffffff" alpha:1.0];
        _container.layer.cornerRadius = 8;
        [self addSubview:_container];
        
//                [_container mas_makeConstraints:^(MASConstraintMaker *make) {
//                    make.width.equalTo(@(300));
//                    make.height.equalTo(@(355));
//                    make.center.equalTo(self);
//                }];
        
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
        _titleLab.text = @"修改昵称";
        _titleLab.textColor = [UIColor orangeColor] ;
        _titleLab.font = [UIFont systemFontOfSize:20.0];
        [_container addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_container.mas_top).offset(20);
            make.centerX.equalTo(_container);
        }];
        
        _contentLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
        _contentLab.textColor = [UIColor colorFromHexRGB:@"2D3C4E"];
        _contentLab.numberOfLines = 0;
        _contentLab.font = [UIFont systemFontOfSize:16.0];
        [_container addSubview:_contentLab];
        [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLab.mas_bottom).offset(16);
            make.leading.equalTo(_container.mas_leading).offset(24);
            make.trailing.equalTo(_container.mas_trailing).offset(-24);
            make.centerX.equalTo(_container);
        }];
        _contentLab.text = @"当前昵称：XXX";
        
        _textFieldBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 335)];
        _textFieldBackView.backgroundColor = [UIColor colorFromHexRGB:@"ffffff" alpha:1.0];
        _textFieldBackView.layer.cornerRadius = 8;
        _textFieldBackView.layer.borderColor = [UIColor colorFromHexRGB:@"2D3C4E" alpha:0.1].CGColor;
        _textFieldBackView.layer.borderWidth = 1.0;
        [self.container addSubview:_textFieldBackView];
        
        [_textFieldBackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_container.mas_leading).offset(20);
            make.trailing.equalTo(_container.mas_trailing).offset(-20);
            make.height.equalTo(@(44));
            make.top.equalTo(_contentLab.mas_bottom).offset(16);
        }];
        
        _nameTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
        _nameTitle.text = @"新昵称";
        _nameTitle.textColor = [UIColor colorFromHexRGB:@"2D3C4E"];
        _nameTitle.numberOfLines = 0;
        _nameTitle.font = [UIFont systemFontOfSize:16.0];
        [_textFieldBackView addSubview:_nameTitle];
        [_nameTitle mas_makeConstraints:^(MASConstraintMaker *make) {
             make.leading.equalTo(_textFieldBackView.mas_leading).offset(12);
             make.centerY.equalTo(_textFieldBackView);
        }];
        
        _textField = [[UITextField alloc]init];
        _textField.borderStyle = UITextBorderStyleNone;
//        _textField.keyboardType = UIKeyboardTypeNumberPad;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;//删除按钮
//        phoneTextField.secureTextEntry = YES;//密码
        _textField.placeholder = @"请输入";
        _textField.textColor = [UIColor colorFromHexRGB:@"2D3C4E"];
        _textField.font = [UIFont systemFontOfSize:14];
        [_textFieldBackView addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(_textFieldBackView);
            make.leading.equalTo(_textFieldBackView.mas_leading).offset(71);
            make.trailing.equalTo(_textFieldBackView.mas_trailing).offset(-16);
        }];
        [_textField becomeFirstResponder];
//        [phoneTextField addTarget:self
//                           action:@selector(textFieldDidChange:)
//                 forControlEvents:UIControlEventEditingChanged];
        //    _textField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 44)];
        //    _textField.leftViewMode = UITextFieldViewModeAlways;
        //    _textField.rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 44)];
        //    _textField.rightViewMode = UITextFieldViewModeAlways;
   
 
        _closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 260, 42)];
        [_closeBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close2"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(clickCloseBtnBtn) forControlEvents:UIControlEventTouchUpInside];
        [_container addSubview:_closeBtn];
        [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.trailing.equalTo(_container);
            make.width.equalTo(@(30));
            make.height.equalTo(@(30));
        }];
        _closeBtn.backgroundColor = [UIColor orangeColor];
//        _closeBtn.hidden = YES;
        
        _confirmBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 260, 42)];
        _confirmBtn.layer.cornerRadius = 4;
        _confirmBtn.layer.masksToBounds = YES;
        _confirmBtn.backgroundColor = [UIColor orangeColor];
        _confirmBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
        [_confirmBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:[UIColor colorFromHexRGB:@"ffffff"] forState:UIControlStateNormal];
        [_confirmBtn addTarget:self action:@selector(clickConfirmBtn) forControlEvents:UIControlEventTouchUpInside];
        [_container addSubview:_confirmBtn];
        [_confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_textFieldBackView.mas_bottom).offset(16);
            make.centerX.equalTo(_container);
            make.width.equalTo(@260);
            make.height.equalTo(@42);
        }];
        
        //自适应大小
        [_container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(300));
            make.bottom.equalTo(_confirmBtn.mas_bottom).offset(16);
//            make.center.equalTo(self);
            make.centerX.equalTo(self);

            make.centerY.equalTo(self.mas_centerY).offset(-250/2.0);

            
//            if (SCREEN_HEIGHT > 480) {
//                make.centerY.equalTo(self.mas_centerY).offset(-250);
//            }else {
//                make.centerY.equalTo(@((SCREEN_HEIGHT - 280 - _container.height/2)/2));
//            }
        }];
        
    }
    return self;
}

-(void)clickCloseBtnBtn {
    
    [self hidden];
    
}

-(void)clickConfirmBtn {
    
    LZLoginModifyNicknameView *view = [[LZLoginModifyNicknameView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [view show];
    [self hidden];
    
}

-(void)showInView:(UIView *)view{
    [view addSubview:self];
    [self showAnimation];
}

-(void)show{
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    [self showAnimation];
}

-(void)hidden {
    
    [self hiddenAnimation];
}

- (void)showAnimation {
    self.alpha = 0.1;
    self.backgroundColor = [UIColor clearColor];
    self.container.transform = CGAffineTransformMakeScale(0.8, 0.8);
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:20
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
                         self.container.transform = CGAffineTransformIdentity;
                         self.alpha = 1;
                     }
                     completion:nil];
}

- (void)hiddenAnimation {
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:10
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.backgroundColor = [UIColor clearColor];
                         self.container.transform = CGAffineTransformMakeScale(0.8, 0.8);
                         self.alpha = 0.0;
                     }
                     completion:^(BOOL finished) {
                         
                         [self removeFromSuperview];
                         
                     }];
}

 
@end
