//
//  RRTalkDarmaCard.m
//  NJVideo
//
//  Created by rrtv on 2021/12/13.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRTalkDarmaCard.h"
@interface RRTalkDarmaCard ()
//容器
@property (nonatomic, strong) UIView *container;
//封面图
@property (nonatomic, strong) UIImageView *coverImgV;
//标题
@property (nonatomic, strong) UILabel *titleLab;

//评分 8.9分 富文本做
@property (nonatomic, strong) UILabel *subTitleLab;
//8.9
@property (nonatomic, strong) UILabel *scoreLab;
//分
@property (nonatomic, strong) UILabel *scoreStrLab;
//被删除的提示
@property (nonatomic, strong) UILabel *deleteLab;
//立即观看按钮
@property (nonatomic, strong) UIButton *nextBtn;

@end

@implementation RRTalkDarmaCard

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
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.backgroundColor = kCOLOR_dynamicProvider_F7F8FA_292B31;
 
    [self addSubview:self.container];
    [self.container addSubview:self.coverImgV];
    [self.container addSubview:self.titleLab];
    //    [self.contentView addSubview:self.subTitleLab];
    [self.container addSubview:self.scoreLab];
    [self.container addSubview:self.scoreStrLab];
    [self.container addSubview:self.deleteLab];
    [self.container addSubview:self.nextBtn];
    
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.leading.equalTo(@(0));
        make.trailing.equalTo(@(0));
        make.bottom.equalTo(@(0));
    }];
    
    [self.coverImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@8);
        make.leading.equalTo(@(8));
        make.width.equalTo(@(27));
        make.height.equalTo(@(35));
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@8.5);
        make.leading.equalTo(@(41));
        make.trailing.equalTo(@(-60));
        //        make.height.equalTo(@(47));
    }];
    
//    [self.subTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@30);
//        make.leading.equalTo(@(41));
//        make.trailing.equalTo(@(-60));
//        //        make.height.equalTo(@(47));
//    }];
    
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-7);
        make.leading.equalTo(@(41));
//        make.trailing.equalTo(@(-12));
        make.height.equalTo(@(14));
    }];
    
    [self.scoreStrLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-7);
        make.leading.equalTo(self.scoreLab.mas_trailing).offset(2);
//        make.trailing.equalTo(@(-12));
        make.height.equalTo(@(15));
    }];
    
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.container);
        make.trailing.equalTo(@(-12));
        //        make.height.equalTo(@(47));
    }];
    
    [self.deleteLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.container);
    }];
    
    //    self.coverImgV.backgroundColor = [UIColor redColor];
    //
    //    self.titleLab.text = @"了不起的麦";
    //    self.subTitleLab.text = @"了不起的麦";
    //
    //    CGFloat lineSpacing = 8;
    //    UIColor *textColor = [UIColor blackColor];
    //    UIFont *font = [UIFont boldSystemFontOfSize:12];
    //    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:@""];
    //    attributedText.lineSpacing = lineSpacing;
    //    attributedText.font = font;
    //    attributedText.color = textColor;
    //
    //    {
    //        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"8.9"];
    //        one.lineSpacing = lineSpacing;
    //        one.font = BebasNeue(14);
    //        one.color = textColor;
    //        [attributedText appendAttributedString:one];
    //    }
    //    {
    //        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@" 分"];
    //        one.lineSpacing = lineSpacing;
    //        one.font = font;
    //        one.color = textColor;
    //        [attributedText appendAttributedString:one];
    //    }
    //    self.subTitleLab.attributedText = attributedText;
    
}

- (void)setModel:(RRSeriesItemModel *)model {
    _model = model;
    
    [self.coverImgV rr_delaySetImageWithURLString:model.coverUrl placeholderImage:KplaceholderImg];
    self.titleLab.text = model.title;
    
    //富文本
//    if (model.score > 0) {
//        NSString *scoreStr = [NSString stringWithFormat:@"%.01f", model.score.floatValue];
//        
//        CGFloat lineSpacing = 8;
//        UIColor *textColor = [UIColor blackColor];
//        UIFont *font = [UIFont boldSystemFontOfSize:12];
//        NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:@""];
//        attributedText.lineSpacing = lineSpacing;
//        attributedText.font = font;
//        attributedText.color = textColor;
//        
//        {
//            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:scoreStr];
//            one.lineSpacing = lineSpacing;
//            one.font = BebasNeue(14);
//            one.color = textColor;
//            [attributedText appendAttributedString:one];
//        }
//        {
//            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@" 分"];
//            one.lineSpacing = lineSpacing;
//            one.font = font;
//            one.color = textColor;
//            [attributedText appendAttributedString:one];
//        }
//        self.subTitleLab.attributedText = attributedText;
//    } else {
//        NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:@""];
//        self.subTitleLab.attributedText = attributedText;
//    }
    
   if (model.score > 0) {
       NSString *scoreStr = [NSString stringWithFormat:@"%.01f", model.score.floatValue];
       self.scoreLab.text = scoreStr;
       self.scoreStrLab.text = @"分";

   } else {
       self.scoreLab.text = @"";
       self.scoreStrLab.text = @"";
   }
    
    if (model.enable) {
        self.coverImgV.hidden = NO;
        self.titleLab.hidden = NO;
//        self.subTitleLab.hidden = NO;
        self.scoreLab.hidden = NO;
        self.scoreStrLab.hidden = NO;
        self.nextBtn.hidden = NO;
        self.deleteLab.hidden = YES;
    } else {
        self.coverImgV.hidden = YES;
        self.titleLab.hidden = YES;
//        self.subTitleLab.hidden = YES;
        self.scoreLab.hidden = YES;
        self.scoreStrLab.hidden = YES;
        self.nextBtn.hidden = YES;
        self.deleteLab.hidden = NO;
    }
}

//lazy
- (UIView *)container {
    if (!_container) {
        _container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        _container.layer.cornerRadius = 8;
        _container.layer.masksToBounds = YES;
        _container.backgroundColor = kCOLOR_dynamicProvider_F7F8FA_292B31;
    }
    return _container;
}

- (UIImageView *)coverImgV {
    if (!_coverImgV) {
        _coverImgV = [[UIImageView alloc] init];
        _coverImgV.frame = CGRectMake(16, 16, 90, 90);
        _coverImgV.contentMode = UIViewContentModeScaleAspectFill;
        //        _avatarImageView.backgroundColor = [UIColor grayColor];
        //        _coverImageView.hidden = YES;
        _coverImgV.layer.cornerRadius = 6;
        _coverImgV.layer.masksToBounds = YES;
        //        _coverImgV.userInteractionEnabled = YES;
        _coverImgV.image = IMAGENAME(@"ranking_cover");
    }
    return _coverImgV;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.frame = CGRectMake(0, 0, 40, 40);
        //        _titleLab.font = RR_COMMONFONT(14);
        _titleLab.font = BOLDSYSTEMFONT(14);
        _titleLab.textColor = kCOLOR_dynamicProvider_222222_DADBDC;
//        _titleLab.textColor = kCOLOR_222222;
        //        _titleLab.numberOfLines = 2;
        //        _titleLab.lineBreakMode = NSLineBreakByCharWrapping;
    }
    return _titleLab;
}

- (UILabel *)subTitleLab {
    if (!_subTitleLab) {
        _subTitleLab = [[UILabel alloc] init];
        _subTitleLab.frame = CGRectMake(0, 0, 40, 40);
        //        _titleLab.font = RR_COMMONFONT(14);
        _subTitleLab.font = SYSTEMFONT(14);
        _subTitleLab.textColor = kCOLOR_dynamicProvider_222222_DADBDC;
    }
    return _subTitleLab;
}

- (UIButton *)nextBtn {
    if (!_nextBtn) {
        _nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 56, 30)];
        //        _nextBtn.backgroundColor = [kCOLOR_1890FF colorWithAlphaComponent:0.12];
        //        _nextBtn.layer.cornerRadius = 15;
        //        _nextBtn.layer.masksToBounds = YES;
        [_nextBtn setTitle:@"立即观看" forState:UIControlStateNormal];
        [_nextBtn setTitleColor:kCOLOR_1890FF forState:UIControlStateNormal];
        _nextBtn.titleLabel.font = SYSTEMFONT(12);
        //        [_nextBtn addTarget:self action:@selector(clickSeasonViewBtn:) forControlEvents:UIControlEventTouchUpInside];
        _nextBtn.userInteractionEnabled = NO;
    }
    return _nextBtn;
}

- (UILabel *)deleteLab {
    if (!_deleteLab) {
        _deleteLab = [[UILabel alloc] init];
        _deleteLab.frame = CGRectMake(0, 0, 40, 40);
        //        _deleteLab.font = RR_COMMONFONT(14);
        _deleteLab.font = SYSTEMFONT(10);
        _deleteLab.textColor = kCOLOR_dynamicProvider_222222_DADBDC;
        _deleteLab.text = @"内容因版权到期等原因，暂时下架";
    }
    return _deleteLab;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [[UILabel alloc] init];
        _scoreLab.frame = CGRectMake(0, 0, 40, 40);
        _scoreLab.font = BebasNeue(14);
        _scoreLab.textColor = [kCOLOR_dynamicProvider_222222_DADBDC colorWithAlphaComponent:0.6];
    }
    return _scoreLab;
}

- (UILabel *)scoreStrLab {
    if (!_scoreStrLab) {
        _scoreStrLab = [[UILabel alloc] init];
        _scoreStrLab.frame = CGRectMake(0, 0, 40, 40);
        _scoreStrLab.font = SYSTEMFONT(12);
        _scoreStrLab.textColor = [kCOLOR_dynamicProvider_222222_DADBDC colorWithAlphaComponent:0.6];
    }
    return _scoreStrLab;
}
@end
