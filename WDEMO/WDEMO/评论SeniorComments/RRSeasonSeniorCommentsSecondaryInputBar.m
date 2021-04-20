//
//  RRSeasonSeniorCommentsSecondaryInputBar.m
//  PUClient
//
//  Created by rrtv on 2021/4/12.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsSecondaryInputBar.h"

@implementation RRSeasonSeniorCommentsSecondaryInputBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [super setupViews];
    
    [self addSubview:self.praiseBtn];
    [self.praiseBtn addSubview:self.praiseBtnLab];

    [self.iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@30);
        make.leading.equalTo(self).offset(15);
        make.top.equalTo(@13);
    }];
 
    [self.praiseBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@33);
        make.trailing.equalTo(@-15);
        //        make.height.equalTo(@45);
        //        make.width.equalTo(@100);
        make.leading.equalTo(self.praiseBtnLab);
        make.centerY.equalTo(self.iconImageView);
    }];
    
    [self.praiseBtnLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.trailing.equalTo(@-20);
    }];

    [self.textBoxBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@33);
        make.leading.equalTo(@15);
        make.trailing.equalTo(self.praiseBtn.mas_leading).offset(0);
        make.centerY.equalTo(self.iconImageView);
    }];

    [self.textBoxLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(@0);
        make.leading.equalTo(@12);
    }];
  
    //抗拉伸
    [self.praiseBtnLab setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.textBoxBtn setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];

    self.iconImageView.hidden = YES;
    self.praiseBtnLab.text = @"";
}

- (UIButton *)praiseBtn {
    if (!_praiseBtn) {
        _praiseBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 45)];
        [_praiseBtn setImage:[UIImage imageNamed:@"ic_comment_like_n"] forState:UIControlStateNormal];
        [_praiseBtn setImage:[UIImage imageNamed:@"ic_comment_like_h"] forState:UIControlStateSelected];
        _praiseBtn.selected = YES;
        _praiseBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    return _praiseBtn;
}
 
- (UILabel *)praiseBtnLab {
    if (!_praiseBtnLab) {
        _praiseBtnLab = [[UILabel alloc] init];
        _praiseBtnLab.frame = CGRectMake(0, 0, 40, 40);
        _praiseBtnLab.font = RR_COMMONFONT(12);
        _praiseBtnLab.textColor = kCOLOR_85888F;
    }
    return _praiseBtnLab;
}
@end
