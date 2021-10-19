//
//  RRSeasonSeniorCommentsCell.m
//  PUClient
//
//  Created by WDEMO on 2021/3/25.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsCell.h"
#import <CoreText/CoreText.h>
#import "RRMJTool.h"
//#import "PriseDynamicApi.h"
//#import "UserHeaderView.h"
//#import "RrmjUser.h"

@interface RRSeasonSeniorCommentsCell ()
@end

@implementation RRSeasonSeniorCommentsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.isShowMore = NO;
        self.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_1F2126;
        [self setupViews];
    } else {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setupViews {
    //aavatar
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.avatarVipIconImageView];
    //nickname
    [self.contentView addSubview:self.nicknameLab];
    [self.contentView addSubview:self.nicknameLevelView];
    [self.nicknameLevelView addSubview:self.nicknameLevelLab];
    [self.contentView addSubview:self.nicknameVipIconImageView];
    //置顶
    [self.contentView addSubview:self.toppingTagView];

    //bottomView
    [self.contentView addSubview:self.bottomView];
    [self.contentView addSubview:self.bottomViewLine];
    [self.bottomView addSubview:self.dateLab];
    [self.bottomView addSubview:self.praiseBtn];
    [self.praiseBtn addSubview:self.praiseBtnLab];
    //    [self.bottomView addSubview:self.praiseImageView];

    //抗压缩
    [self.nicknameLab setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [self.nicknameLevelLab setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];

    CGFloat avatarImageViewTop = [[self class] getAvatarImageViewTop];

    //top 20
    //头像
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@36);
        make.top.equalTo(@(avatarImageViewTop));
        make.leading.equalTo(@16);
    }];
    [self.avatarVipIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.avatarImageView);
        make.trailing.equalTo(self.avatarImageView);
        make.width.equalTo(@11);
        make.height.equalTo(@11);
    }];

    //昵称vip
    [self.nicknameVipIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@14);
        make.height.equalTo(@14);
        make.centerY.equalTo(self.nicknameLab);
        make.trailing.lessThanOrEqualTo(self.contentView.mas_trailing).offset(-16);
    }];
    
    //昵称等级view
    [self.nicknameLevelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.nicknameVipIconImageView.mas_leading).offset(-4);
        make.centerY.equalTo(self.nicknameLab);
//        make.leading.equalTo(self.nicknameLevelLab.mas_leading).offset(-4);
        make.height.equalTo(@14);
    }];
    
    //昵称等级lab
    [self.nicknameLevelLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@4);
        make.trailing.equalTo(@-4);
        make.centerY.equalTo(self.nicknameLevelView);
        //        make.trailing.equalTo(@-16);
        //        make.top.equalTo(self.avatarImageView.mas_top).offset(-2);
    }];
    
    //昵称
    [self.nicknameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@61);
        make.trailing.equalTo(self.nicknameLevelView.mas_leading).offset(-4);
//        make.top.equalTo(self.avatarImageView.mas_top).offset(-2);
        make.top.equalTo(@10);
        make.height.equalTo(@17);
    }];

//消息中查看详情
//    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(@0);
//        make.leading.equalTo(@0);
//        make.trailing.equalTo(@0);
//        make.height.equalTo(@45);
//    }];
    
    [self.bottomViewLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
        make.leading.equalTo(@61);
        make.trailing.equalTo(@-16);
        make.height.equalTo(@(1.0f / [UIScreen mainScreen].scale));
    }];

    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.leading.equalTo(@61);
        //      make.height.equalTo(@45);
    }];
 
    [self.praiseBtnLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.praiseBtn);
//        make.leading.equalTo(@34);
        make.trailing.equalTo(@-16);
        make.height.equalTo(@15);
    }];
    
    [self.praiseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.trailing.equalTo(@0);
        make.leading.equalTo(self.praiseBtnLab.mas_leading).offset(-33);
    }];
    
    [self.toppingTagView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(self.contentLab.mas_top).offset(0);
        make.centerY.equalTo(self.nicknameLab.mas_centerY);
        make.trailing.equalTo(@-16);
        make.width.equalTo(@30);
        make.height.equalTo(@14);
    }];
}

- (void)setModel:(RRSeniorCommentsModel *)model {
    _model = model;
    
    CGFloat nicknameLabTop = [[self class] getNicknameLabTop];

    //填充数据
    //头像
//    [self.avatarImageView rr_setImageWithURLString:model.author.headImgUrl placeholderImage:KPersonHolderImg];

    //nickname
    self.nicknameLab.text = model.author.nickName;
    NSString *levelStr = [NSString stringWithFormat:@"Lv.%zi", model.author.level];
    self.nicknameLevelLab.text = levelStr;
    
    //置顶
    BOOL isTopping = model.sticky;
    self.toppingTagView.hidden = YES;
    //昵称，用户等级，vip图标的边距
    CGFloat trailingMargin = -16;
    if (isTopping) {
        trailingMargin = -56;
        self.toppingTagView.hidden = NO;
    }
  
    //vip
//    BOOL isVip = [RrmjUser isVip:model.author.medalList];
//    BOOL isVipExpired = [RrmjUser isVipExpired:self.model.author.medalList];
    BOOL isVip = YES;
    BOOL isVipExpired = YES;
//    NSInteger vipLevel = (self.dramaCommentModel.author.vipLevel.level).integerValue;
    if (isVip) {
//        self.avatarVipIconImageView.hidden = NO;
        self.nicknameVipIconImageView.hidden = NO;
        if (isVipExpired) {
            self.nicknameVipIconImageView.image  = IMAGENAME(@"ic_vip_grade_n_0");
        } else {
            self.nicknameVipIconImageView.image  = IMAGENAME(@"ic_vip_grade_0");
        }
        
        //昵称vip
        [self.nicknameVipIconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@14);
            make.height.equalTo(@14);
            make.centerY.equalTo(self.nicknameLab);
            make.trailing.lessThanOrEqualTo(self.contentView.mas_trailing).offset(trailingMargin);
        }];
        
        //昵称等级view
        [self.nicknameLevelView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self.nicknameVipIconImageView.mas_leading).offset(-4);
            make.centerY.equalTo(self.nicknameLab);
//            make.leading.equalTo(self.nicknameLevelLab.mas_leading).offset(-4);
            make.height.equalTo(@14);
        }];
        
        //昵称等级lab
        [self.nicknameLevelLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@4);
            make.trailing.equalTo(@-4);
            make.centerY.equalTo(self.nicknameLevelView);
            //        make.trailing.equalTo(@-16);
            //        make.top.equalTo(self.avatarImageView.mas_top).offset(-2);
        }];
        
        //昵称
        [self.nicknameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@61);
            make.trailing.equalTo(self.nicknameLevelView.mas_leading).offset(-4);
            //        make.top.equalTo(self.avatarImageView.mas_top).offset(-2);
            make.top.equalTo(@(nicknameLabTop));
            make.height.equalTo(@17);
        }];
        
    } else {
//        self.avatarVipIconImageView.hidden = YES;
        self.nicknameVipIconImageView.hidden = YES;
        
        //昵称等级view
        [self.nicknameLevelView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.trailing.lessThanOrEqualTo(self.contentView.mas_trailing).offset(trailingMargin);
            make.centerY.equalTo(self.nicknameLab);
//            make.leading.equalTo(self.nicknameLevelLab.mas_leading).offset(-4);
            make.height.equalTo(@14);
        }];
        
        //昵称等级lab
        [self.nicknameLevelLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@4);
            make.trailing.equalTo(@-4);
            make.centerY.equalTo(self.nicknameLevelView);
            //        make.trailing.equalTo(@-16);
            //        make.top.equalTo(self.avatarImageView.mas_top).offset(-2);
        }];
        
        //昵称
        [self.nicknameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@61);
            make.trailing.equalTo(self.nicknameLevelView.mas_leading).offset(-4);
            //        make.top.equalTo(self.avatarImageView.mas_top).offset(-2);
            make.top.equalTo(@(nicknameLabTop));
            make.height.equalTo(@17);
        }];
    }
    
    //V是认证标识
//    self.avatarVipIconImageView.image = [UserHeaderView imageForUserType:[UserHeaderView certLabel:model.author.certLabel]];
//    if (self.avatarVipIconImageView.image) {
//        self.avatarVipIconImageView.hidden = NO;
//    } else {
//        self.avatarVipIconImageView.hidden = YES;
//    }
    
    //填充数据
    //点赞
    NSString *likeCountStr = [NSString transformCountWithString:model.likeCount];
    NSString *dateStr = [RRMJTool getFormatterDateStringWithTimeInterval:model.createTime / 1000.0];
    self.praiseBtn.selected = model.liked;
    self.praiseBtnLab.text = likeCountStr;
    self.dateLab.text = dateStr;

}

+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model {
    return 0;
}

#pragma mark - lazy
- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc]init];
        _avatarImageView.frame = CGRectMake(0, 0, 36, 36);
        _avatarImageView.backgroundColor = [UIColor grayColor];
        //        _coverImageView.hidden = YES;
        _avatarImageView.layer.cornerRadius = 18;
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
        _avatarImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesturRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [_avatarImageView addGestureRecognizer:tapGesturRecognizer];
    }
    return _avatarImageView;
}

- (UILabel *)nicknameLab {
    if (!_nicknameLab) {
        _nicknameLab = [[UILabel alloc] init];
        _nicknameLab.frame = CGRectMake(0, 0, 40, 40);
        _nicknameLab.font = RR_COMMONFONT(14);
        _nicknameLab.textColor = kCOLOR_88898F;
        _nicknameLab.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesturRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [_nicknameLab addGestureRecognizer:tapGesturRecognizer];
    }
    return _nicknameLab;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 45)];
    }
    return _bottomView;
}

- (UILabel *)dateLab {
    if (!_dateLab) {
        _dateLab = [[UILabel alloc] init];
        _dateLab.frame = CGRectMake(0, 0, 40, 40);
        _dateLab.font = RR_COMMONFONT(11);
        _dateLab.textColor = kCOLOR_85888F;
    }
    return _dateLab;
}

- (UIButton *)praiseBtn {
    if (!_praiseBtn) {
        _praiseBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 45)];
        [_praiseBtn setImage:IMAGENAME(@"ic_common_like_n_28") forState:UIControlStateNormal];
        [_praiseBtn setImage:IMAGENAME(@"ic_common_like_h_28") forState: UIControlStateHighlighted | UIControlStateSelected];
        [_praiseBtn setImage:IMAGENAME(@"ic_common_like_h_28") forState:UIControlStateSelected];
        _praiseBtn.selected = YES;
        [_praiseBtn addTarget:self action:@selector(clickPraiseBtn:) forControlEvents:UIControlEventTouchUpInside];
        _praiseBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _praiseBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 16, 0, 0);
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

- (UIView *)bottomViewLine {
    if (!_bottomViewLine) {
        _bottomViewLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1.0f / [UIScreen mainScreen].scale)];
        _bottomViewLine.backgroundColor = kCOLOR_dynamicProvider_E6E7E8_333333;
    }
    return _bottomViewLine;
}

- (UIImageView *)avatarVipIconImageView {
    if (!_avatarVipIconImageView) {
        _avatarVipIconImageView = [[UIImageView alloc]init];
        _avatarVipIconImageView.frame = CGRectMake(0, 0, 9, 9);
        //        _avatarImageView.backgroundColor = [UIColor grayColor];
        //        _avatarVipIconImageView.hidden = YES;
        //        _avatarVipIconImageView.layer.cornerRadius = 4.5;
        //        _avatarVipIconImageView.layer.masksToBounds = YES;
        //        _avatarVipIconImageView.layer.borderWidth = 1;
        //        _avatarVipIconImageView.layer.borderColor = kCOLOR_dynamicProvider_FFFFFF_1F2126.CGColor;
        _avatarVipIconImageView.image  = IMAGENAME(@"ic_comment_v");
        _avatarVipIconImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _avatarVipIconImageView;
}

- (UIImageView *)nicknameVipIconImageView {
    if (!_nicknameVipIconImageView) {
        _nicknameVipIconImageView = [[UIImageView alloc]init];
        _nicknameVipIconImageView.frame = CGRectMake(0, 0, 11, 11);
        ////        _nicknameVipIconImageView.backgroundColor = [UIColor grayColor];
        //        //        _nicknameVipIconImageView.hidden = YES;
        //                _nicknameVipIconImageView.layer.cornerRadius = 18;
        //                _nicknameVipIconImageView.layer.masksToBounds = YES;
        _nicknameVipIconImageView.contentMode = UIViewContentModeScaleAspectFill;
        _nicknameVipIconImageView.image  = IMAGENAME(@"ic_comment_vip");
        
    }
    return _nicknameVipIconImageView;
}

- (UIView *)nicknameLevelView {
    if (!_nicknameLevelView) {
        _nicknameLevelView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 14)];
        _nicknameLevelView.layer.cornerRadius = 7;
        _nicknameLevelView.layer.masksToBounds = YES;
        _nicknameLevelView.backgroundColor = kCOLOR_dynamicProvider_F0F1F2_333333;
    }
    return _nicknameLevelView;
}

- (UILabel *)nicknameLevelLab {
    if (!_nicknameLevelLab) {
        _nicknameLevelLab = [[UILabel alloc] init];
        _nicknameLevelLab.frame = CGRectMake(0, 0, 40, 40);
        _nicknameLevelLab.font = RR_BOLDFONT(9);
        _nicknameLevelLab.textColor = kCOLOR_6D7380;
    }
    return _nicknameLevelLab;
}

- (UIView *)toppingTagView {
    if (!_toppingTagView) {
        _toppingTagView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 14)];
        _toppingTagView.layer.cornerRadius = 2;
        _toppingTagView.layer.masksToBounds = YES;
        _toppingTagView.backgroundColor = [kCOLOR_1890FF colorWithAlphaComponent:0.12];
         
        UILabel *tagLab = [[UILabel alloc] init];
        tagLab.frame = CGRectMake(0, 0, 30, 14);
        tagLab.font = RR_COMMONFONT(9);
        tagLab.textColor = kCOLOR_1890FF;
        tagLab.textAlignment = NSTextAlignmentCenter;
        tagLab.text = @"置顶";
        [_toppingTagView addSubview:tagLab];
    }
    return _toppingTagView;
}

#pragma mark - 点赞
- (void)clickPraiseBtn:(UIButton *)btn {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            NSString  *typeId = self.model.ID;
//            BOOL liked = self.model.liked;
//            @weakify(self);
//            PriseDynamicApi *api = [[PriseDynamicApi alloc] initWithDynamic:typeId andDel:liked ? @"YES" : @""];
//            [api startWithCompletionBlock:^(RRJsonModel *result, NSError *error) {
//                @strongify(self);
//                if (!result) {
//                    TOAST(error.localizedDescription);
//                    return;
//                } else {
//                    if (!liked) {
//                        if (result.code == 0 || result.code == 3001) {//"code": "3001", "msg": "已经添加过收藏",
//                            TOAST(@"点赞成功");
//                            self.model.liked = YES;
//                            self.model.likeCount = self.model.likeCount + 1;
//                            self.praiseBtn.selected = YES;
//        //                    self.praiseBtnLab.text = @(self.model.likeCount).stringValue;
//                            self.praiseBtnLab.text = [NSString transformCountWithString:self.model.likeCount];
//
//                        } else {
//                            TOAST(result.msg);
//                        }
//                    } else {
//                        if (result.code == 0 || result.code == 3002) {//"code": "3001", "msg": "已经添加过收藏",
//                            TOAST(@"取消点赞");
//                            self.model.liked = NO;
//                            self.model.likeCount = self.model.likeCount - 1;
//                            self.praiseBtn.selected = NO;
//        //                    self.praiseBtnLab.text = @(self.model.likeCount).stringValue;
//                            self.praiseBtnLab.text = [NSString transformCountWithString:self.model.likeCount];
//
//                        } else {
//                            TOAST(result.msg);
//                        }
//                    }
//                }
//            }];
//        }
//    }];
//
//    if (self.clickPraise) {
//        self.clickPraise(self.model);
//    }
}

#pragma mark - 点击头像 点击昵称
- (void)tapAction:(UITapGestureRecognizer *)tap {
//    [[RRAppLinkManager sharedManager] goUpuserDetail:self.model.author.ID toRoot:NO];
}

#pragma mark - 布局
+ (CGFloat)getAvatarImageViewTop {
    return 12;
}

+ (CGFloat)getNicknameLabTop {
    return 10;
}

+ (CGFloat)getContentLabTop {
    return 34;
}

+ (CGFloat)getSpacing {
    return 8;
}

+ (CGFloat)getBottomViewHeight {
    return 36;
}

+ (CGFloat)padding {
    return 16;
}

+ (CGFloat)textLeading {
    return 61;
}
@end


