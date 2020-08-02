//
//  LZLoginMergeView.m
//  longzhu
//
//  Created by plu on 2017/10/11.
//  Copyright © 2017年 developer. All rights reserved.
//

#import "LZLoginMergeView.h"
#import "LZLoginModifyNicknameTipsView.h"
#import "LZLoginModifyNicknameView.h"

@interface LZLoginMergeView ()

@property(strong,nonatomic)UIView *container;

@property(strong,nonatomic)UILabel *titleLab;

@property(strong,nonatomic)UILabel *contentLab;

@property(strong,nonatomic)UIButton *confirmBtn;

@property(strong,nonatomic)UIButton *closeBtn;

@end

@implementation LZLoginMergeView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorFromHexRGB:@"000000" alpha:0.5];
        
        [self addTarget:self action:@selector(hidden) forControlEvents:UIControlEventTouchUpInside];
        
        _container = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 335)];
        _container.backgroundColor = [UIColor colorFromHexRGB:@"ffffff" alpha:1.0];
        _container.layer.cornerRadius = 8;
        [self addSubview:_container];
//        [_container mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.equalTo(@(300));
//            make.height.equalTo(@(355));
//            make.center.equalTo(self);
//        }];
        
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
        _titleLab.text = @"苏宁一账通提示";
        _titleLab.textColor = [UIColor orangeColor];
        _titleLab.font = [UIFont systemFontOfSize:20.0];
        [_container addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_container.mas_top).offset(20);
            make.centerX.equalTo(_container);
        }];
        
        
        _contentLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
//        _contentLab.text = @"苏宁一账通提示";
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
        
//        _contentLab.text = @"亲，苏宁易购账号已经可以一账通行聚力视频、龙珠直播啦！检查到你绑定的“13127676282”手机号已在龙珠直播注册，已为您登录龙珠直播账号哟~";
       _contentLab.text = @"亲，苏宁易购账号已经可以一账通行聚力视频、龙珠直播啦！检查到您绑定的“13127676282”手机号已在龙珠注册，已为您将两个账号的余额、等级、关注等数据合并啦~";
        
        NSString *labelText = _contentLab.text;
        NSRange font_range = [labelText rangeOfString:@"“13127676282”"];

        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:8];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:font_range];
        _contentLab.attributedText = attributedString;
        
        _closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 260, 42)];
        [_closeBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close2"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(clickCloseBtnBtn) forControlEvents:UIControlEventTouchUpInside];
        [_container addSubview:_closeBtn];
        [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.trailing.equalTo(_container);
            make.width.equalTo(@(30));
            make.height.equalTo(@(30));
        }];
        _closeBtn.hidden = YES;
        
        _confirmBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 260, 42)];
        _confirmBtn.layer.cornerRadius = 4;
        _confirmBtn.layer.masksToBounds = YES;
        _confirmBtn.backgroundColor = [UIColor orangeColor];
        _confirmBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
        [_confirmBtn setTitle:@"知道了" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:[UIColor colorFromHexRGB:@"ffffff"] forState:UIControlStateNormal];
        [_confirmBtn addTarget:self action:@selector(clickConfirmBtn) forControlEvents:UIControlEventTouchUpInside];
        [_container addSubview:_confirmBtn];
        [_confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_contentLab.mas_bottom).offset(16);
            make.centerX.equalTo(_container);
            make.width.equalTo(@260);
            make.height.equalTo(@42);
        }];
        
        //自适应大小
        [_container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(300));
            make.bottom.equalTo(_confirmBtn.mas_bottom).offset(16);
            make.center.equalTo(self);
        }];
        
    }
    return self;
}

-(void)clickCloseBtnBtn {
    
    [self hidden];
    
}

-(void)clickConfirmBtn {
    
    LZLoginModifyNicknameTipsView *view = [[LZLoginModifyNicknameTipsView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
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
