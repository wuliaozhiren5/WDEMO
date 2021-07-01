//
//  RRSeasonSeniorCommentsCell.m
//  PUClient
//
//  Created by rrtv on 2021/3/25.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsCell.h"
#import <CoreText/CoreText.h>

//#import "RRSeasonSeniorCommentsReplyTableView.h"

@interface RRSeasonSeniorCommentsCell ()
////头像
//@property (nonatomic, strong) UIImageView *avatarImageView;
//@property (nonatomic, strong) UIImageView *avatarVipIconImageView;
////昵称
//@property (nonatomic, strong) UILabel *nicknamelab;//昵称
//@property (nonatomic, strong) UIView *nicknameLevelView;//昵称等级
//@property (nonatomic, strong) UILabel *nicknameLevelLab;//昵称等级
//@property (nonatomic, strong) UIImageView *nicknameVipIconImageView;//昵称vip
//
////剧透
//@property (nonatomic, strong) UIView *firstView;//剧透
//@property (nonatomic, strong) UILabel *firstLab;//剧透
//
////内容
////@property (nonatomic, strong) UILabel *contentLab; //内容
//@property (nonatomic, strong) YYLabel *yyContentLab;//内容
//
////单图
//@property (nonatomic, strong) UIImageView *singleImageView;//单图
//
////底部的View
//@property (nonatomic, strong) UIView *bottomView;
//@property (nonatomic, strong) UILabel *dateLab; //日期
//@property (nonatomic, strong) UIButton *praiseBtn;
//@property (nonatomic, strong) UILabel *praiseBtnLab;
////@property (nonatomic, strong) UIImageView *praiseImageView; //imgV

////@property (nonatomic, strong) RRSeasonSeniorCommentsReplyTableView *tableView;

//@property (nonatomic, assign) BOOL isShowMore;//是否显示更多数据 默认NO
////@property (nonatomic, assign) BOOL isFirst;//是否是剧透
 
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
    [self.contentView addSubview:self.nicknamelab];
    [self.contentView addSubview:self.nicknameLevelView];
    [self.nicknameLevelView addSubview:self.nicknameLevelLab];
    [self.contentView addSubview:self.nicknameVipIconImageView];
    //contentLab
    //    [self.contentView addSubview:self.contentLab];
    [self.contentView addSubview:self.yyContentLab];
    //bottomView
    [self.contentView addSubview:self.bottomView];
    [self.bottomView addSubview:self.dateLab];
    [self.bottomView addSubview:self.praiseBtn];
    [self.praiseBtn addSubview:self.praiseBtnLab];
    //    [self.bottomView addSubview:self.praiseImageView];
    //剧透
    [self.contentView addSubview:self.firstView];
    [self.firstView addSubview:self.firstLab];
    //image
    [self.contentView addSubview:self.singleImageView];
    //replyTable
//    [self.contentView addSubview:self.tableView];

    //抗压缩
    [self.nicknamelab setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [self.nicknameLevelLab setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    
    //top 20
    //头像
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@36);
        make.top.equalTo(@12);
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
        make.centerY.equalTo(self.nicknamelab);
        make.trailing.lessThanOrEqualTo(self.contentView.mas_trailing).offset(-16);
    }];
    
    //昵称等级view
    [self.nicknameLevelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.nicknameVipIconImageView.mas_leading).offset(-4);
        make.centerY.equalTo(self.nicknamelab);
        make.leading.equalTo(self.nicknameLevelLab.mas_leading).offset(-4);
        make.height.equalTo(@14);
    }];
    
    //昵称等级lab
    [self.nicknameLevelLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.equalTo(@4);
        make.trailing.equalTo(@-4);
        make.centerY.equalTo(self.nicknameLevelView);
        //        make.trailing.equalTo(@-16);
        //        make.top.equalTo(self.avatarImageView.mas_top).offset(-2);
    }];
    
    //昵称
    [self.nicknamelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@61);
        make.trailing.equalTo(self.nicknameLevelView.mas_leading).offset(-4);
//        make.top.equalTo(self.avatarImageView.mas_top).offset(-2);
        make.top.equalTo(@10);
        make.height.equalTo(@17);
    }];
    
 
    //    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(self.nicknamelab.mas_bottom).offset(7);
    //        make.leading.equalTo(@61);
    //        make.trailing.equalTo(@-16);
    //    }];
    
    //    [self.yyContentLab mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(self.nicknamelab.mas_bottom).offset(7);
    //        make.leading.equalTo(@61);
    //        make.trailing.equalTo(@-16);
    //    }];
    
//消息中查看详情
//    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(@0);
//        make.leading.equalTo(@0);
//        make.trailing.equalTo(@0);
//        make.height.equalTo(@45);
//    }];
    
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.leading.equalTo(@61);
        //      make.height.equalTo(@45);
    }];
    
    [self.praiseBtnLab mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(@0);
        make.bottom.equalTo(@-13);
        make.trailing.equalTo(@-40);
        make.height.equalTo(@15);
    //        make.centerY.equalTo(self.praiseBtn);
    }];

    [self.praiseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.trailing.equalTo(@0);
        //        make.height.equalTo(@45);
        //        make.width.equalTo(@100);
        make.leading.equalTo(self.praiseBtnLab.mas_leading).offset(-16);
    }];
    
    //firstView
    [self.firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(self.contentLab.mas_top).offset(0);
        make.top.equalTo(self.yyContentLab.mas_top).offset(4);
        make.leading.equalTo(@61);
        make.width.equalTo(@26);
        make.height.equalTo(@14);
    }];
    [self.firstLab mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.equalTo(self.firstView);
        make.center.equalTo(self.firstView);
    }];
    
//    [self.singleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        //        make.top.equalTo(self.contentLab.mas_bottom).offset(4);
//        //        make.top.equalTo(self.yyContentLab.mas_top).offset(0);
//        make.bottom.equalTo(self.bottomView.mas_top).offset(0);
//        make.leading.equalTo(@61);
//        make.width.equalTo(@197);
//        //        make.height.equalTo(@197);
//        make.height.equalTo(self.singleImageView.mas_width).multipliedBy(2.0);
//    }];
}

- (void)setModel:(RRSeniorCommentsModel *)model {
    _model = model;
    //填充数据
    self.praiseBtn.selected = model.liked;
    self.praiseBtnLab.text = [NSString transformCountWithString:model.likeCount];
//    self.dateLab.text = [NSString getFormatterDateStringWithTimeInterval:model.createTime / 1000.0];
    self.dateLab.text = [NSString getFormatterDateStringWithTimeInterval:model.createTime / 1000.0];

    //头像
//    [self.avatarImageView rr_setImageWithURLString:model.author.headImgUrl placeholderImage:KPersonHolderImg];
    self.avatarImageView.image = [UIImage imageNamed:KPersonHolderImg];
    //nickname
    self.nicknamelab.text = model.author.nickName;
    NSString *levelStr = [NSString stringWithFormat:@"Lv.%zi", model.author.level];
    self.nicknameLevelLab.text = levelStr;
    
    //vip
    BOOL isVip = YES;
//    for (RRMedalModel *medal in model.author.medalList) {
//        if (medal.medalId == 1) {
//            isVip = YES;
//            break;
//        }
//    }
    if (isVip) {
//        self.avatarVipIconImageView.hidden = NO;
        self.nicknameVipIconImageView.hidden = NO;
        
        //昵称vip
        [self.nicknameVipIconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@14);
            make.height.equalTo(@14);
            make.centerY.equalTo(self.nicknamelab);
            make.trailing.lessThanOrEqualTo(self.contentView.mas_trailing).offset(-16);
        }];
        
        //昵称等级view
        [self.nicknameLevelView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self.nicknameVipIconImageView.mas_leading).offset(-4);
            make.centerY.equalTo(self.nicknamelab);
            make.leading.equalTo(self.nicknameLevelLab.mas_leading).offset(-4);
            make.height.equalTo(@14);
        }];
        
        //昵称等级lab
        [self.nicknameLevelLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            //        make.leading.equalTo(@4);
            make.trailing.equalTo(@-4);
            make.centerY.equalTo(self.nicknameLevelView);
            //        make.trailing.equalTo(@-16);
            //        make.top.equalTo(self.avatarImageView.mas_top).offset(-2);
        }];
        
        //昵称
        [self.nicknamelab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@61);
            make.trailing.equalTo(self.nicknameLevelView.mas_leading).offset(-4);
            //        make.top.equalTo(self.avatarImageView.mas_top).offset(-2);
            make.top.equalTo(@10);
            make.height.equalTo(@17);
        }];
        
    } else {
//        self.avatarVipIconImageView.hidden = YES;
        self.nicknameVipIconImageView.hidden = YES;
        
        //昵称等级view
        [self.nicknameLevelView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.trailing.lessThanOrEqualTo(self.contentView.mas_trailing).offset(-16);
            make.centerY.equalTo(self.nicknamelab);
            make.leading.equalTo(self.nicknameLevelLab.mas_leading).offset(-4);
            make.height.equalTo(@14);
        }];
        
        //昵称等级lab
        [self.nicknameLevelLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            //        make.leading.equalTo(@4);
            make.trailing.equalTo(@-4);
            make.centerY.equalTo(self.nicknameLevelView);
            //        make.trailing.equalTo(@-16);
            //        make.top.equalTo(self.avatarImageView.mas_top).offset(-2);
        }];
        
        //昵称
        [self.nicknamelab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@61);
            make.trailing.equalTo(self.nicknameLevelView.mas_leading).offset(-4);
            //        make.top.equalTo(self.avatarImageView.mas_top).offset(-2);
            make.top.equalTo(@10);
            make.height.equalTo(@17);
        }];
    }
    
//    //V是认证标识
//    self.avatarVipIconImageView.image = [UserHeaderView imageForUserType:[UserHeaderView certLabel:model.author.certLabel]];
//    if (self.avatarVipIconImageView.image) {
//        self.avatarVipIconImageView.hidden = NO;
//    } else {
//        self.avatarVipIconImageView.hidden = YES;
//    }
}

+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model {
    return 0;
}

#pragma mark - lazy
- (UIImageView *)singleImageView {
    if (!_singleImageView) {
        _singleImageView = [[UIImageView alloc] init];
        _singleImageView.frame = CGRectMake(0, 0, 197, 197);
        _singleImageView.backgroundColor = [UIColor grayColor];
        //        _singleImageView.hidden = YES;
        _singleImageView.layer.cornerRadius = 8;
        _singleImageView.layer.masksToBounds = YES;
        _singleImageView.contentMode = UIViewContentModeScaleAspectFill;
        _singleImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesturRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageAction:)];
        [_singleImageView addGestureRecognizer:tapGesturRecognizer];
    }
    return _singleImageView;
}


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

- (UILabel *)nicknamelab {
    if (!_nicknamelab) {
        _nicknamelab = [[UILabel alloc] init];
        _nicknamelab.frame = CGRectMake(0, 0, 40, 40);
        _nicknamelab.font = RR_COMMONFONT(14);
        _nicknamelab.textColor = kCOLOR_88898F;
        _nicknamelab.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesturRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [_nicknamelab addGestureRecognizer:tapGesturRecognizer];
    }
    return _nicknamelab;
}

//- (UILabel *)contentLab {
//    if (!_contentLab) {
//        _contentLab = [[UILabel alloc] init];
//        _contentLab.frame = CGRectMake(0, 0, KWidth -61 - 16, 40);
//        _contentLab.font = RR_COMMONFONT(12);
//        _contentLab.textColor = kCOLOR_85888F;
//        _contentLab.numberOfLines = 0;
//
//    }
//    return _contentLab;
//}

- (YYLabel *)yyContentLab {
    if (!_yyContentLab) {
        _yyContentLab = [YYLabel new];
        _yyContentLab.frame = CGRectMake(0, 0, KWidth - 61 - 16, 300);
        _yyContentLab.font = RR_COMMONFONT(14);
        _yyContentLab.lineBreakMode = NSLineBreakByCharWrapping;
        _yyContentLab.numberOfLines = 0;
        //        _yyContentLab.userInteractionEnabled = YES;
        
        UILongPressGestureRecognizer* longPressGr = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressToDo:)];
        longPressGr.minimumPressDuration = 1.0;
        [_yyContentLab addGestureRecognizer:longPressGr];
    }
    return _yyContentLab;
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
        _dateLab.font = RR_COMMONFONT(12);
        _dateLab.textColor = kCOLOR_85888F;
    }
    return _dateLab;
}

- (UIButton *)praiseBtn {
    if (!_praiseBtn) {
        _praiseBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 45)];
        [_praiseBtn setImage:IMAGENAME(@"ic_comment_like_n") forState:UIControlStateNormal];
        [_praiseBtn setImage:IMAGENAME(@"ic_comment_like_h") forState: UIControlStateHighlighted | UIControlStateSelected];
        [_praiseBtn setImage:IMAGENAME(@"ic_comment_like_h") forState:UIControlStateSelected];
        _praiseBtn.selected = YES;
        _praiseBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_praiseBtn addTarget:self action:@selector(clickPraiseBtn:) forControlEvents:UIControlEventTouchUpInside];
        _praiseBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    }
    return _praiseBtn;
}

//- (UIImageView *)praiseImageView {
//    if (!_praiseImageView) {
//        _praiseImageView = [[UIImageView alloc]init];
//        _praiseImageView.frame = CGRectMake(0, 0, 36, 36);
//        //        _avatarImageView.backgroundColor = [UIColor grayColor];
//        //        _coverImageView.hidden = YES;
//        //        _praiseImageView.layer.cornerRadius = 18;
//        //        _praiseImageView.layer.masksToBounds = YES;
//        //        _praiseImageView.contentMode = UIViewContentModeScaleAspectFill;
//    }
//    return _praiseImageView;
//}

- (UILabel *)praiseBtnLab {
    if (!_praiseBtnLab) {
        _praiseBtnLab = [[UILabel alloc] init];
        _praiseBtnLab.frame = CGRectMake(0, 0, 40, 40);
        _praiseBtnLab.font = RR_COMMONFONT(12);
        _praiseBtnLab.textColor = kCOLOR_85888F;
    }
    return _praiseBtnLab;
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

- (UIView *)firstView {
    if (!_firstView) {
        _firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 26, 14)];
        _firstView.layer.cornerRadius = 3;
        _firstView.layer.masksToBounds = YES;
        _firstView.backgroundColor = [kCOLOR_FF4865 colorWithAlphaComponent:0.1];
    }
    return _firstView;
}

- (UILabel *)firstLab {
    if (!_firstLab) {
        _firstLab = [[UILabel alloc] init];
        _firstLab.frame = CGRectMake(0, 0, 26, 14);
        _firstLab.font = RR_COMMONFONT(10);
        _firstLab.textColor = kCOLOR_FF4865;
        _firstLab.textAlignment = NSTextAlignmentCenter;
        _firstLab.text = @"剧透";
    }
    return _firstLab;
}

//- (RRSeasonSeniorCommentsReplyTableView *)tableView {
//    if (!_tableView) {
//        _tableView = [[RRSeasonSeniorCommentsReplyTableView alloc] initWithFrame:CGRectMake(0, 0, (KWidth - 61 - 16), 100)];
//    }
//    return _tableView;
//}

#pragma mark - 点击文字
//- (void)clickTextBtn {
//    if (self.clickText) {
//        self.clickText(self.model);
//    }
//}

#pragma mark - 点赞
- (void)clickPraiseBtn:(UIButton *)btn {
 
//    NSString  *typeId = self.model.ID;
//    BOOL liked = self.model.liked;
//    WS(weakSelf);
//    PriseDynamicApi *api = [[PriseDynamicApi alloc] initWithDynamic:typeId andDel:liked ? @"YES" : @""];
//    [api startWithCompletionBlock:^(RRJsonModel *result, NSError *error) {
//        if (!result) {
//            TOAST(error.localizedDescription);
//            return;
//        } else {
//            if (!liked) {
//                if (result.code == 0 || result.code == 3001) {//"code": "3001", "msg": "已经添加过收藏",
//                    TOAST(@"点赞成功");
//                    weakSelf.model.liked = YES;
//                    weakSelf.model.likeCount = weakSelf.model.likeCount + 1;
//                    weakSelf.praiseBtn.selected = YES;
////                    weakSelf.praiseBtnLab.text = @(weakSelf.model.likeCount).stringValue;
//                    weakSelf.praiseBtnLab.text = [NSString transformCountWithString:weakSelf.model.likeCount];
//
//                } else {
//                    TOAST(result.msg);
//                }
//            } else {
//                if (result.code == 0 || result.code == 3002) {//"code": "3001", "msg": "已经添加过收藏",
//                    TOAST(@"取消点赞成功");
//                    weakSelf.model.liked = NO;
//                    weakSelf.model.likeCount = weakSelf.model.likeCount - 1;
//                    weakSelf.praiseBtn.selected = NO;
////                    weakSelf.praiseBtnLab.text = @(weakSelf.model.likeCount).stringValue;
//                    weakSelf.praiseBtnLab.text = [NSString transformCountWithString:weakSelf.model.likeCount];
//
//                } else {
//                    TOAST(result.msg);
//                }
//            }
//        }
//    }];
}

#pragma mark - 长按手势
- (void)longPressToDo:(UILongPressGestureRecognizer *)gesture {
     //长按开始
     if (gesture.state == UIGestureRecognizerStateBegan) {
        NSLog(@"--> 长按手势 state :begin ");
         [self showAlertView];
    } else {
         //长按结束
        NSLog(@"--> 长按手势 state :end ");
    }
}
 
- (void)showAlertView {
//    WS(weakSelf);
//    RRAlertItem *item1 = [[RRAlertItem alloc] initWithTitle:@"复制" itemImg:IMAGENAME(@"ic_popbar_copy") itemStyle:RRAlertItemStyleListIconText];
//    item1.actionBlock = ^(RRAlertItem *item) {
//        NSLog(@"点击了%@", item.title);
//        [weakSelf clickCopyBtn];
//    };
//
//    RRAlertItem *item2 = [[RRAlertItem alloc] initWithTitle:@"删除" itemImg:IMAGENAME(@"ic_popbar_delete") itemStyle:RRAlertItemStyleListIconText];
//    item2.actionBlock = ^(RRAlertItem *item) {
//        NSLog(@"点击了%@", item.title);
//        [weakSelf clickDeleteBtn];
//    };
//
//    RRAlertItem *item3 = [[RRAlertItem alloc] initWithTitle:@"举报" itemImg:IMAGENAME(@"ic_popbar_warn") itemStyle:RRAlertItemStyleListIconText];
//    item3.actionBlock = ^(RRAlertItem *item) {
//        NSLog(@"点击了%@", item.title);
//        [weakSelf clickReportBtn];
//    };
//
//    RRAlertItem *item4 = [[RRAlertItem alloc] initWithTitle:@"不感兴趣" itemImg:IMAGENAME(@"ic_popbar_report") itemStyle:RRAlertItemStyleListIconText];
//    item4.actionBlock = ^(RRAlertItem *item) {
//        TOAST(@"操作成功，将减少此类内容推送");
//    };
//
//    BOOL isCommentUser = [UserInfoConfig sharedUserInfoConfig].userInfo.commentUser;
//    //老评论
//    if (!isCommentUser) {
//        NSArray *itemArray = @[item1, item3];
//        NSString *title = [NSString stringWithFormat:@"%@：%@", self.model.author.nickName, self.model.content];
//        RRAlertBase *alert = [[RRAlertBase alloc] initWithTitle:title itemArray:itemArray];
//        [alert titleStyleWithText:title lines:2 textColor:kCOLOR_898A91 font:SYSTEMFONT(14) lineHeihgt:6];
//        [alert showWithAnimation:YES];
//        return;
//    }
//
//    BOOL isMy = [[UserInfoConfig sharedUserInfoConfig].userInfo.Id isEqualToString:self.model.author.ID];
//    //复制,删除
//    NSArray *itemArray = @[item1, item2];
//    if (!isMy) {
//        itemArray = @[item1, item3];
//    }
//
//    if (![UserInfoConfig sharedUserInfoConfig].isMoviesOpen) {
//        itemArray = @[item1, item2, item4];
//        if (!isMy) {
//            itemArray = @[item1, item3, item4];
//        }
//    }
////    NSString *title = @"举报毒舌电影：好搞笑哦好好看撒大噶点范德萨发的撒范德萨到发疯剧啊撒地方大法大范德萨发到点点滴滴带的…";
//    NSString *title = [NSString stringWithFormat:@"%@：%@", self.model.author.nickName, self.model.content];
//    RRAlertBase *alert = [[RRAlertBase alloc] initWithTitle:title itemArray:itemArray];
//    [alert titleStyleWithText:title lines:2 textColor:kCOLOR_898A91 font:SYSTEMFONT(14) lineHeihgt:6];
//    [alert showWithAnimation:YES];
}
 
#pragma mark - 复制
- (void)clickCopyBtn {
    //复制文字
    UIPasteboard *pab = [UIPasteboard generalPasteboard];
    pab.string = self.model.content;
//    if (pab == nil) {
//        TOAST(@"复制失败");
//    } else {
//        TOAST(@"已复制");
//    }
}

#pragma mark - 举报
- (void)clickReportBtn {
//    __block NSString * Message;
//    //408之后 都为commetType   兼容帖子为reply状态
//    ReportApi * api = [[ReportApi alloc] initWithID:self.model.ID type:KCommentType content:nil];
//    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
//        NSDictionary * dic = request.responseJSONObject;
//        if (dic) {
//            RRJsonModel * json = [RRJsonModel modelWithDictionary:dic];
//            if (json.code == SUCCESSCODE) {
//                Message = @"举报成功";
////                    [IanAlert alertSuccess:Message];
//                TOAST(Message);
//            }else if (json.code == 1124){
//                Message = @"该内容您已举报过了";
////                    [IanAlert alertSuccess:Message];
//                TOAST(Message);
//            }else if (json.code == 1125){
//                Message = @"您不能举报自己哦";
////                    [IanAlert alertError:Message];
//                TOAST(Message);
//            }else{
//                Message = @"举报失败";
////                    [IanAlert alertError:Message];
//                TOAST(Message);
//            }
//        }else{
//            Message = @"举报失败";
////                [IanAlert alertError:Message];
//            TOAST(Message);
//        }
//    } failure:^(YTKBaseRequest *request) {
//        Message = @"举报失败";
////            [IanAlert alertError:Message];
//        TOAST(Message);
//    }];
}
 
#pragma mark - 删除btn
- (void)clickDeleteBtn {
//    WS(weakSelf)
//    RRAlertView *alertView = [[RRAlertView alloc] initWithTitle:nil
//                                                        content:@"删除后不可恢复，是否确认删除？"
//                                                    cancelTitle:@"取消"
//                                                      sureTitle:@"确认删除"];
//    alertView.dismissBlock = ^(BOOL isClicked) {
//        if (isClicked) {
//            //确认删除
//            [weakSelf clickSureDeleteBtn];
//        } else {
//            //取消
//        }
//    };
//    [alertView showInView:kAppDelegate.window];
}

#pragma mark - 确认删除btn
- (void)clickSureDeleteBtn {
//    NSString  *typeId = self.model.ID;
//    WS(weakSelf)
//    [RRSeniorCommentsDeletetApi requestSeniorCommentsDeleteWithTypeId:typeId block:^(BOOL success, NSError * _Nonnull error) {
//        if (success) {
//            if (weakSelf.clickDelete) {
//                weakSelf.clickDelete(self.model);
//            }
//        }
//    }];
}
#pragma mark - 点击图片
- (void)tapImageAction:(UITapGestureRecognizer *)tap {
    [self previewClick];
}
#pragma mark - 点击头像 点击昵称
- (void)tapAction:(UITapGestureRecognizer *)tap {
//    [[RRAppLinkManager sharedManager] goUpuserDetail:self.model.author.ID toRoot:NO];
     
}

- (void)previewClick {

//    NSMutableArray *assetArray = [NSMutableArray array];
//    for (RRSeniorCommentsImageModel *object in self.model.images) {
//        HXCustomAssetModel *assetModel = [HXCustomAssetModel assetWithNetworkImageURL:[NSURL URLWithString:object.url] selected:YES];
//        [assetArray addObject:assetModel];
//
//    }
//
//    HXPhotoManager *photoManager = [HXPhotoManager managerWithType:HXPhotoManagerSelectedTypePhotoAndVideo];
//    photoManager.configuration.saveSystemAblum = YES;
//    photoManager.configuration.photoMaxNum = 0;
//    photoManager.configuration.videoMaxNum = 0;
//    photoManager.configuration.maxNum = 10;
//    photoManager.configuration.selectTogether = YES;
//    photoManager.configuration.photoCanEdit = NO;
//    photoManager.configuration.videoCanEdit = NO;
//
//    HXWeakSelf
//    // 长按事件
//    photoManager.configuration.previewRespondsToLongPress = ^(UILongPressGestureRecognizer *longPress, HXPhotoModel *photoModel, HXPhotoManager *manager, HXPhotoPreviewViewController *previewViewController) {
//        HXPhotoBottomViewModel *model = [[HXPhotoBottomViewModel alloc] init];
//        model.title = @"保存";
////        model.subTitle = @"这是一个长按事件";
//        [HXPhotoBottomSelectView showSelectViewWithModels:@[model] headerView:nil cancelTitle:nil selectCompletion:^(NSInteger index, HXPhotoBottomViewModel * _Nonnull model) {
//            if (index == 0) {
//                // 保存，处理...
//                UIImageWriteToSavedPhotosAlbum(photoModel.previewPhoto, nil, nil, nil);
//                TOAST(@"保存成功");
//            }
//        } cancelClick:nil];
////        hx_showAlert(previewViewController, @"提示", @"长按事件", @"确定", nil, nil, nil);
//    };
//
//    // 跳转预览界面时动画起始的view
//    photoManager.configuration.customPreviewFromView = ^UIView *(NSInteger currentIndex) {
////        HXPhotoSubViewCell *viewCell = [weakSelf.photoView collectionViewCellWithIndex:currentIndex];
////        return viewCell;
//        return self.singleImageView;
//    };
//    // 跳转预览界面时展现动画的image
//    photoManager.configuration.customPreviewFromImage = ^UIImage *(NSInteger currentIndex) {
////        HXPhotoSubViewCell *viewCell = [weakSelf.photoView collectionViewCellWithIndex:currentIndex];
////        return viewCell.imageView.image;
//        return nil;
//    };
////    // 退出预览界面时终点view
////    photoManager.configuration.customPreviewToView = ^UIView *(NSInteger currentIndex) {
////        HXPhotoSubViewCell *viewCell = [weakSelf.photoView collectionViewCellWithIndex:currentIndex];
////        return viewCell;
////    };
//
//    [photoManager addCustomAssetModel:assetArray];
//    UIViewController *topVC = [UIViewController topViewController];
//
//    if (!self.isHalf) {
//        [topVC hx_presentPreviewPhotoControllerWithManager:photoManager
//                                              previewStyle:HXPhotoViewPreViewShowStyleDark
//                                              currentIndex:0
//                                                 photoView:nil];
//    } else {
//        [topVC hx_presentPreviewPhotoControllerWithManager:photoManager
//                                              previewStyle:HXPhotoViewPreViewShowStyleDark
//                                     showBottomPageControl:YES
//                                              currentIndex:0
//                                                 photoView:nil
//                                                    height:playerViewHeight()];
//    }
}
@end

