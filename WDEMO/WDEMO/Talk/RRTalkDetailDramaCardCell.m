//
//  RRTalkDetailDramaCardCell.m
//  PPVideo
//
//  Created by rrtv on 2021/12/15.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRTalkDetailDramaCardCell.h"

@implementation RRTalkDetailDramaCardCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.contentView.backgroundColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.24];
    self.contentView.layer.cornerRadius = 8;
    self.contentView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.coverImgV];
    [self.contentView addSubview:self.titleLab];
//    [self.contentView addSubview:self.subTitleLab];
    [self.contentView addSubview:self.scoreLab];
    [self.contentView addSubview:self.scoreStrLab];

    [self.coverImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@4);
        make.leading.equalTo(@(4));
        make.width.equalTo(@(36));
        make.height.equalTo(@(47));
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@8.5);
        make.leading.equalTo(@(46));
        make.trailing.equalTo(@(-12));
//        make.height.equalTo(@(47));
    }];
    
//    [self.subTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@34);
//        make.leading.equalTo(@(46));
//        make.trailing.equalTo(@(-12));
////        make.height.equalTo(@(47));
//    }];
    
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-7);
        make.leading.equalTo(@(47.5));
//        make.trailing.equalTo(@(-12));
        make.height.equalTo(@(14));
    }];
    
    [self.scoreStrLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-7);
        make.leading.equalTo(self.scoreLab.mas_trailing).offset(2);
//        make.trailing.equalTo(@(-12));
        make.height.equalTo(@(15));
    }];

}

- (void)setModel:(RRSeriesItemModel *)model {
    _model= model;
    
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
}

//lazy
- (UIImageView *)coverImgV {
    if (!_coverImgV) {
        _coverImgV = [[UIImageView alloc] init];
        _coverImgV.frame = CGRectMake(16, 16, 90, 90);
        _coverImgV.contentMode = UIViewContentModeScaleAspectFill;
        //        _avatarImageView.backgroundColor = [UIColor grayColor];
        //        _coverImageView.hidden = YES;
        _coverImgV.layer.cornerRadius = 5;
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
//        _titleLab.textColor = kCOLOR_dynamicProvider_222222_DADBDC;
        _titleLab.textColor = kCOLOR_222222;
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

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [[UILabel alloc] init];
        _scoreLab.frame = CGRectMake(0, 0, 40, 40);
        _scoreLab.font = BebasNeue(14);
        _scoreLab.textColor = [kCOLOR_222222 colorWithAlphaComponent:0.6];
    }
    return _scoreLab;
}

- (UILabel *)scoreStrLab {
    if (!_scoreStrLab) {
        _scoreStrLab = [[UILabel alloc] init];
        _scoreStrLab.frame = CGRectMake(0, 0, 40, 40);
        _scoreStrLab.font = SYSTEMFONT(12);
        _scoreStrLab.textColor = [kCOLOR_222222 colorWithAlphaComponent:0.6];
    }
    return _scoreStrLab;
}
@end
