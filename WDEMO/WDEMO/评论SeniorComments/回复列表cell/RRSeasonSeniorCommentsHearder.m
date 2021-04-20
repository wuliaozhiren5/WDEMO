//
//  RRSeasonSeniorCommentsHearder.m
//  PUClient
//
//  Created by rrtv on 2021/3/24.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsHearder.h"
@interface RRSeasonSeniorCommentsHearder ()
@property (nonatomic, copy)   NSArray<UIButton *> *statusBtnArray;
@property (nonatomic, assign) NSInteger statusIndex;
@property (nonatomic, strong) UIView *statusView;
@property (nonatomic, strong) UIView *statusViewLine;

@property (nonatomic, strong) UIView *swichView;
@property (nonatomic, strong) UILabel *swichLab;
@property (nonatomic, strong) UIButton *swichBtn;
//@property (nonatomic, assign) BOOL isSwichOpen;

@end

@implementation RRSeasonSeniorCommentsHearder

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self createStatusViewLeft];
    [self createStatusViewRight];
}

- (void)createStatusViewLeft {
    
    UIView *swichView = [[UIView alloc] initWithFrame:CGRectMake(15, 6, 100, 30)];
    //    swichView.backgroundColor = [UIColor redColor];
    [self addSubview:swichView];
    
    UILabel *swichLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 52, 30)];
    swichLab.font = RR_COMMONFONT(12);
    swichLab.textColor =  kCOLOR_898A91;
    swichLab.text = @"不看剧透";
    [swichView addSubview:swichLab];
    
    UIButton *swichBtn = [[UIButton alloc] initWithFrame:CGRectMake(52, 0, 30, 30)];
//    swichBtn.backgroundColor = [UIColor greenColor];
    [swichBtn setImage:IMAGENAME(@"ic_comment_sttings_switch_n") forState:UIControlStateNormal];
    [swichBtn setImage:IMAGENAME(@"ic_comment_sttings_switch_h") forState:UIControlStateSelected];
    [swichBtn addTarget:self action:@selector(clickSwichBtn:) forControlEvents:UIControlEventTouchUpInside];
    [swichView addSubview:swichBtn];
    
    self.swichView = swichView;
    self.swichBtn = swichBtn;
    self.swichBtn = swichBtn;
}

- (void)createStatusViewRight {
    CGFloat width = 48;
    CGFloat height = 26;
    //最热 最新  1+48+48+1
    UIView *statusView = [[UIView alloc] initWithFrame:CGRectMake(KWidth - 98 - 16, 6, 98, 30)];
    statusView.layer.cornerRadius = 15.0;
    statusView.backgroundColor = kCOLOR_dynamicProvider_F7F8FA_2A2A2A;
    [self addSubview:statusView];
    
    UIView *statusViewLine = [[UIView alloc] initWithFrame:CGRectMake(2, 2, width, height)];
    statusViewLine.layer.cornerRadius = 15.0;
    statusViewLine.backgroundColor = kCOLOR_AppBackground;
    [statusView addSubview:statusViewLine];
    
    UIButton *btn0 = [[UIButton alloc]initWithFrame:CGRectMake(1, 2, width, height)];
    [statusView addSubview:btn0];
    
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(1 + width, 2, width, height)];
    [statusView addSubview:btn1];
    
    NSMutableAttributedString *normalString0 = [[NSMutableAttributedString alloc] initWithString:@"最热" attributes: @{NSFontAttributeName: RR_COMMONFONT(12), NSForegroundColorAttributeName: kCOLOR_898A91}];
    NSMutableAttributedString *selectedString0 = [[NSMutableAttributedString alloc] initWithString:@"最热" attributes: @{NSFontAttributeName: RR_MEDIUMFONT(12), NSForegroundColorAttributeName: kCOLOR_dynamicProvider_222222_DADBDC}];
    NSMutableAttributedString *normalString1 = [[NSMutableAttributedString alloc] initWithString:@"最新" attributes: @{NSFontAttributeName: RR_COMMONFONT(12), NSForegroundColorAttributeName: kCOLOR_898A91}];
    NSMutableAttributedString *selectedString1 = [[NSMutableAttributedString alloc] initWithString:@"最新" attributes: @{NSFontAttributeName: RR_MEDIUMFONT(12), NSForegroundColorAttributeName: kCOLOR_dynamicProvider_222222_DADBDC}];
    
    [btn0 setAttributedTitle:normalString0 forState:UIControlStateNormal];
    [btn1 setAttributedTitle:normalString1 forState:UIControlStateNormal];
    [btn0 setAttributedTitle:selectedString0 forState:UIControlStateSelected];
    [btn1 setAttributedTitle:selectedString1 forState:UIControlStateSelected];
    
    btn0.tag = 0;
    btn1.tag = 1;
    btn0.selected = YES;
    
    [btn0 addTarget:self action:@selector(clickStatusBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 addTarget:self action:@selector(clickStatusBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    self.statusBtnArray = @[btn0, btn1];
    self.statusIndex = 0;
    self.statusView = statusView;
    self.statusViewLine = statusViewLine;
}

- (void)clickStatusBtn:(UIButton *)btn {
    if (btn.tag == self.statusIndex) {
        return;
    }
    //old
    UIButton *oldBtn = self.statusBtnArray[self.statusIndex];
    oldBtn.selected = NO;
    //new
    UIButton *newBtn = btn;
    newBtn.selected = YES;
    self.statusIndex = btn.tag;
    //ui背景
    self.statusViewLine.center = newBtn.center;
    
    if (self.clickStatusIndex) {
        self.clickStatusIndex(btn, btn.tag);
    }
}

- (void)clickSwichBtn:(UIButton *)btn {
//    self.isSwichOpen = !btn.isSelected;
    btn.selected = !btn.isSelected;
    NSInteger index = @(btn.isSelected).integerValue;
    if (self.clickSwichIndex) {
        self.clickSwichIndex(btn, index);
    }
}
@end
