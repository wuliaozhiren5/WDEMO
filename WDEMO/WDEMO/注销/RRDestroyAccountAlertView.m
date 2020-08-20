//
//  RRDestroyAccountAlterview.m
//  PUClient
//
//  Created by rrtv on 2020/8/14.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import "RRDestroyAccountAlertView.h"
#import "ACMacros.h"
#import <YYKit/YYKit.h>
#import <Masonry/Masonry.h>

@interface RRDestroyAccountAlertView ()

@property(strong,nonatomic)UIView *container;

@property(strong,nonatomic)UILabel *titleLab;
@property(strong,nonatomic)UILabel *contentLab;
@property(strong,nonatomic)UIButton *confirmBtn;
@property(strong,nonatomic)UIButton *closeBtn;

@property(strong,nonatomic)NSString *titleStr;
@property(strong,nonatomic)NSString *contentStr;
@property(strong,nonatomic)NSString *confirmStr;
@property(strong,nonatomic)NSString *closeStr;

@property(nonatomic,copy) void (^confirmHandler)(void);
@property(nonatomic,copy) void (^closeHandler)(void);


@end
@implementation RRDestroyAccountAlertView
- (instancetype)initWithFrame:(CGRect)frame
                        titel:(NSString *)title
                      content:(NSString *)content
                      confirm:(nullable NSString *)confirm
                        close:(nullable NSString *)close
               confirmHandler:(void (^)(void))confirmHandler
                 closeHandler:(void (^)(void))closeHandler {
    
    _titleStr = title;
    _contentStr = content;
    _confirmStr = confirm;
    _closeStr = close;
    _confirmHandler = confirmHandler;
    _closeHandler = closeHandler;
    
    self = [self initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) { 
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        [self addTarget:self action:@selector(hidden) forControlEvents:UIControlEventTouchUpInside];
        
        _container = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)];
        _container.backgroundColor = [UIColor whiteColor];
        _container.layer.cornerRadius = 8;
        _container.layer.masksToBounds = YES;
        [self addSubview:_container];
        
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
        _titleLab.text = _titleStr;
        _titleLab.textColor = kCOLOR_333333;
        _titleLab.font = [UIFont systemFontOfSize:18.0];
        [_container addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_container.mas_top).offset(30);
            make.centerX.equalTo(_container);
            make.height.equalTo(@22);
        }];
        
        _contentLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
        //_contentLab.text = @"";
        _contentLab.textColor = kCOLOR_333333;
        _contentLab.numberOfLines = 0;
        _contentLab.font = [UIFont systemFontOfSize:15.0];
        [_container addSubview:_contentLab];
        [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLab.mas_bottom).offset(10);
            make.leading.equalTo(_container.mas_leading).offset(30);
            make.trailing.equalTo(_container.mas_trailing).offset(-30);
            make.centerX.equalTo(_container);
        }];
        
        NSString *labelText = _contentStr ? _contentStr : @"";
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:8];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
        _contentLab.attributedText = attributedString;
        
        _closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 260, 42)];
        _closeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
        [_closeBtn setTitle:_closeStr forState:UIControlStateNormal];
        [_closeBtn setTitleColor:kCOLOR_00BBFF forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(clickCloseBtnBtn) forControlEvents:UIControlEventTouchUpInside];
        [_container addSubview:_closeBtn];
        
        _confirmBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 260, 42)];
        _confirmBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
        [_confirmBtn setTitle:_confirmStr forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:kCOLOR_00BBFF forState:UIControlStateNormal];
        [_confirmBtn addTarget:self action:@selector(clickConfirmBtn) forControlEvents:UIControlEventTouchUpInside];
        [_container addSubview:_confirmBtn];
        
        //        横线
        UIView *horizontalLine = [[UIView alloc]initWithFrame:CGRectZero];
        horizontalLine.backgroundColor = kCOLOR_CACBCC;
        [_container addSubview:horizontalLine];
        
        //        竖线
        UIView *verticalLine = [[UIView alloc]initWithFrame:CGRectZero];
        verticalLine.backgroundColor = kCOLOR_CACBCC;
        [_container addSubview:verticalLine];
        
        //分割线宽度
        //#define kMinBorderWidth    (1.f / [[UIScreen mainScreen] scale])
        CGFloat lineWidth  = kMinBorderWidth;
        
        if (_closeStr && _confirmStr) {
            _closeBtn.hidden = NO;
            _confirmBtn.hidden = NO;
            horizontalLine.hidden = NO;
            verticalLine.hidden = NO;
            
            [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_contentLab.mas_bottom).offset(26.5);
                make.leading.equalTo(_container);
                make.height.equalTo(@(54));
                make.trailing.equalTo(_container.mas_centerX);
            }];
            [_confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_contentLab.mas_bottom).offset(26.5);
                make.trailing.equalTo(_container);
                make.height.equalTo(@54);
                make.leading.equalTo(_container.mas_centerX);
            }];
            
            [horizontalLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_closeBtn.mas_top).offset(0);
                make.leading.equalTo(_container);
                make.trailing.equalTo(_container);
                make.height.equalTo(@(lineWidth));
                
            }];
            [verticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(_container.mas_bottom).offset(0);
                make.centerX.equalTo(_container);
                make.height.equalTo(@54);
                make.width.equalTo(@(lineWidth));
                
            }];
            
            //自适应大小
            [_container mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(300));
                make.bottom.equalTo(_confirmBtn.mas_bottom).offset(0);
                make.center.equalTo(self);
            }];
            
        } else if (!_closeStr && _confirmStr) {
            
            _closeBtn.hidden = YES;
            _confirmBtn.hidden = NO;
            horizontalLine.hidden = NO;
            verticalLine.hidden = YES;
            [_confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_contentLab.mas_bottom).offset(26.5);
                make.trailing.equalTo(_container);
                make.leading.equalTo(_container);
                make.height.equalTo(@54);
            }];
            [horizontalLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_confirmBtn.mas_top).offset(0);
                make.leading.equalTo(_container);
                make.trailing.equalTo(_container);
                make.height.equalTo(@(lineWidth));
                
            }];
            //自适应大小
            [_container mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(300));
                make.bottom.equalTo(_confirmBtn.mas_bottom).offset(0);
                make.center.equalTo(self);
            }];
            
        }else if (_closeStr && !_confirmStr) {
            _closeBtn.hidden = NO;
            _confirmBtn.hidden = YES;
            horizontalLine.hidden = NO;
            verticalLine.hidden = YES;
            [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_contentLab.mas_bottom).offset(26.5);
                make.trailing.equalTo(_container);
                make.leading.equalTo(_container);
                make.height.equalTo(@(54));
            }];
            [horizontalLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_closeBtn.mas_top).offset(0);
                make.leading.equalTo(_container);
                make.trailing.equalTo(_container);
                make.height.equalTo(@(lineWidth));
            }];
            //自适应大小
            [_container mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(300));
                make.bottom.equalTo(_closeBtn.mas_bottom).offset(0);
                make.center.equalTo(self);
            }];
            
        } else {
            _closeBtn.hidden = YES;
            _confirmBtn.hidden = YES;
            horizontalLine.hidden = YES;
            verticalLine.hidden = YES;
            //自适应大小
            [_container mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(300));
                make.bottom.equalTo(_contentLab.mas_bottom).offset(26.5);
                make.center.equalTo(self);
            }];
        }
    }
    return self;
}

-(void)clickCloseBtnBtn {
    
    [self hidden];
    if (_closeHandler) {
        _closeHandler();
    }
}

-(void)clickConfirmBtn {
    
    [self hidden];
    if (_confirmHandler) {
        _confirmHandler();
    }
}

-(void)showInView:(UIView *)view {
    self.frame = view.bounds;
    [view addSubview:self];
    [self showAnimation];
}

-(void)show {
    self.frame = [UIApplication sharedApplication].delegate.window.bounds;
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
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
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
