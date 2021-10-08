//
//  RRSeasonSeniorCommentsInputBar.m
//  PUClient
//
//  Created by rrtv on 2021/3/24.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsInputBar.h"

@implementation RRSeasonSeniorCommentsInputBar

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
    
    UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    iconImageView.layer.cornerRadius = 15;
    iconImageView.layer.masksToBounds = YES;
    [self addSubview:iconImageView];
    
    UIButton *textBoxBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 33)];
    textBoxBtn.layer.cornerRadius = 33.0 / 2.0;
    textBoxBtn.layer.masksToBounds = YES;
    textBoxBtn.backgroundColor = kCOLOR_dynamicProvider_F2F4F5_2F3137;
    //    [textBoxBtn addTarget:self action:@selector(clickTextBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:textBoxBtn];
    
    UILabel *textBoxLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 33)];
    textBoxLab.textColor = kCOLOR_dynamicProvider_CACBCC_616466;
    textBoxLab.font = SYSTEMFONT(14);
    textBoxLab.text = @"写条评论一起互动吧";
    [textBoxBtn addSubview:textBoxLab];
    
    self.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_292B31;
    iconImageView.backgroundColor = [UIColor grayColor];

    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@30);
        make.leading.equalTo(self.mas_leading).offset(15);
        make.top.equalTo(@13);
    }];
  
    [textBoxBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@33);
        make.leading.equalTo(@15);
        make.trailing.equalTo(self.mas_trailing).offset(-15);
        make.centerY.equalTo(iconImageView);
    }];
    
    [textBoxLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(@0);
        make.leading.trailing.equalTo(@12);
    }];
    
    _iconImageView = iconImageView;
    _textBoxBtn = textBoxBtn;
    _textBoxLab = textBoxLab;
    _iconImageView.hidden = YES;

}

//- (void)createBottomBar {
//    UIView *bar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 53)];
//    [self.view addSubview:bar];
//
//    UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
//    iconImageView.layer.cornerRadius = 15;
//    iconImageView.layer.masksToBounds = YES;
//    [bar addSubview:iconImageView];
//
//    UIImageView *textBtnLeftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 26, 33)];
//    textBtnLeftImageView.image = IMAGENAME(@"ic_bottombar_textbox");
//    [bar addSubview:textBtnLeftImageView];
//
//    UIButton *textBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 320, 33)];
//    textBtn.layer.cornerRadius = 33.0 / 2.0;
//    textBtn.layer.masksToBounds = YES;
//    textBtn.backgroundColor = kCOLOR_F2F4F5;
//    [textBtn addTarget:self action:@selector(clickTextBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [bar addSubview:textBtn];
//
//    UILabel *textLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 33)];
//    textLab.textColor = kCOLOR_919699;
//    textLab.font = SYSTEMFONT(14);
//    textLab.text = @"写条评论一起互动吧";
//    [textBtn addSubview:textLab];
//
//    bar.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_1F2126;
//    iconImageView.backgroundColor = [UIColor grayColor];
////    chatBtn.backgroundColor = [UIColor grayColor];
//
//    [bar mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(@(53 - appMargin().bottom));
//        make.leading.equalTo(self.view);
//        make.trailing.equalTo(self.view);
//        make.bottom.equalTo(@(0));
//    }];
//
//    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.height.equalTo(@30);
//        make.leading.equalTo(self.view).offset(15);
//        make.top.equalTo(@13);
//    }];
//
//    [textBtnLeftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(@26);
//        make.height.equalTo(@33);
//        make.leading.equalTo(@41);
//        make.centerY.equalTo(iconImageView);
//    }];
//
//    [textBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(@33);
//        make.leading.equalTo(@51);
//        make.trailing.equalTo(self.view).offset(-15);
//        make.centerY.equalTo(textBtnLeftImageView);
//    }];
//
//    [textLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.equalTo(@0);
//        make.leading.trailing.equalTo(@12);
//    }];
//}
@end
