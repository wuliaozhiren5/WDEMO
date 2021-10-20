//
//  RRAllRankingListCell.m
//  WDEMO
//
//  Created by rrtv on 2021/10/20.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "RRAllRankingListCell.h"

@implementation RRAllRankingListCell
 
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}
 
- (void)setupViews {
//    //aavatar
//    [self.contentView addSubview:self.avatarImageView];
//    [self.contentView addSubview:self.avatarVipIconImageView];
//    //nickname
//    [self.contentView addSubview:self.nicknameLab];
//    [self.contentView addSubview:self.nicknameLevelView];
//    [self.nicknameLevelView addSubview:self.nicknameLevelLab];
//    [self.contentView addSubview:self.nicknameVipIconImageView];
//    //置顶
//    [self.contentView addSubview:self.toppingTagView];
//
//    //bottomView
//    [self.contentView addSubview:self.bottomView];
//    [self.contentView addSubview:self.bottomViewLine];
//    [self.bottomView addSubview:self.dateLab];
//    [self.bottomView addSubview:self.praiseBtn];
//    [self.praiseBtn addSubview:self.praiseBtnLab];
//    //    [self.bottomView addSubview:self.praiseImageView];
//
//    //抗压缩
//    [self.nicknameLab setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
//    [self.nicknameLevelLab setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
//
//    CGFloat avatarImageViewTop = [[self class] getAvatarImageViewTop];
//
//    //top 20
//    //头像
//    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.height.equalTo(@36);
//        make.top.equalTo(@(avatarImageViewTop));
//        make.leading.equalTo(@16);
//    }];
//    [self.avatarVipIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.avatarImageView);
//        make.trailing.equalTo(self.avatarImageView);
//        make.width.equalTo(@11);
//        make.height.equalTo(@11);
//    }];

}
     
#pragma mark - lazy
- (UIImageView *)coverImgV {
    if (!_coverImgV) {
        _coverImgV = [[UIImageView alloc] init];
        _coverImgV.frame = CGRectMake(0, 0, 36, 36);
//        _avatarImageView.backgroundColor = [UIColor grayColor];
        //        _coverImageView.hidden = YES;
        _coverImgV.layer.cornerRadius = 8;
        _coverImgV.layer.masksToBounds = YES;
    }
    return _coverImgV;
}

- (UIButton *)followBtn {
    if (!_followBtn) {
        _followBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 45)];
        [_followBtn setImage:IMAGENAME(@"ic_common_like_n_28") forState:UIControlStateNormal];
        [_followBtn setImage:IMAGENAME(@"ic_common_like_h_28") forState: UIControlStateHighlighted | UIControlStateSelected];
        [_followBtn setImage:IMAGENAME(@"ic_common_like_h_28") forState:UIControlStateSelected];
//        _followBtn.selected = YES;
//        [_followBtn addTarget:self action:@selector(clickPraiseBtn:) forControlEvents:UIControlEventTouchUpInside];
//        _followBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        _followBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 16, 0, 0);
    }
    return _followBtn;
}

- (UIView *)pohtoView {
    if (!_pohtoView) {
        _pohtoView = [[UIView alloc] init];
        _pohtoView.frame = CGRectMake(0, 0, 200, 40);
        _pohtoView.layer.cornerRadius = 8;
        _pohtoView.layer.masksToBounds = YES;
    }
    return _pohtoView;
}

- (UIImageView *)numberIconImgV {
    if (!_numberIconImgV) {
        _numberIconImgV = [[UIImageView alloc] init];
        _numberIconImgV.frame = CGRectMake(0, 0, 40, 40);
//        _numberIconImgV.backgroundColor = [UIColor grayColor];
        //        _coverImageView.hidden = YES;
//        _numberIconImgV.layer.cornerRadius = 8;
//        _numberIconImgV.layer.masksToBounds = YES;
    }
    return _numberIconImgV;
}

- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [[UILabel alloc] init];
        _numberLab.frame = CGRectMake(0, 0, 40, 40);
        _numberLab.font = RR_COMMONFONT(14);
        _numberLab.textColor = kCOLOR_88898F;
    }
    return _numberLab;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.frame = CGRectMake(0, 0, 40, 40);
        _titleLab.font = RR_COMMONFONT(14);
        _titleLab.textColor = kCOLOR_88898F;
    }
    return _titleLab;
}

- (UIImageView *)countIconImgV {
    if (!_countIconImgV) {
        _countIconImgV = [[UIImageView alloc] init];
        _countIconImgV.frame = CGRectMake(0, 0, 40, 40);
//        _countIconImgV.backgroundColor = [UIColor grayColor];
        //        _coverImageView.hidden = YES;
//        _numberIconImgV.layer.cornerRadius = 8;
//        _numberIconImgV.layer.masksToBounds = YES;
    }
    return _countIconImgV;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [[UILabel alloc] init];
        _countLab.frame = CGRectMake(0, 0, 40, 40);
        _countLab.font = RR_COMMONFONT(14);
        _countLab.textColor = kCOLOR_88898F;
    }
    return _countLab;
}

- (UICollectionView *)tagCollectionView {
    if (!_tagCollectionView) {
      
    }
    return _tagCollectionView;
}

- (UILabel *)commentLab {
    if (!_commentLab) {
        _commentLab = [[UILabel alloc] init];
        _commentLab.frame = CGRectMake(0, 0, 40, 40);
        _commentLab.font = RR_COMMONFONT(14);
        _commentLab.textColor = kCOLOR_88898F;
    }
    return _commentLab;
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.frame = CGRectMake(0, 0, 200, 1);
    }
    return _line;
}
 
@end
