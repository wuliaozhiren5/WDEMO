//
//  RRSeasonSeniorCommentsPraiseBtnInputBar.m
//  PUClient
//
//  Created by WDEMO on 2021/4/12.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsPraiseBtnInputBar.h"
//#import "PriseDynamicApi.h"
@implementation RRSeasonSeniorCommentsPraiseBtnInputBar

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
        make.trailing.equalTo(@-16);
        //        make.height.equalTo(@45);
        //        make.width.equalTo(@100);
//        make.leading.equalTo(self.praiseBtnLab);
        make.centerY.equalTo(self.iconImageView);
//        make.width.equalTo(@33);
    }];
    
    [self.praiseBtnLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@12);
        make.leading.equalTo(@30);
        make.trailing.equalTo(@0);
        make.bottom.equalTo(@-8);
    }];

    [self.textBoxBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@33);
        make.leading.equalTo(@15);
        make.trailing.equalTo(self.praiseBtn.mas_leading).offset(-13);
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
//    self.praiseBtnLab.text = @"333";

}

- (void)setCommentModel:(RRSeniorCommentsModel *)commentModel {
    _commentModel = commentModel;
    self.praiseBtn.selected = commentModel.liked;
    self.praiseBtnLab.text = [NSString transformCountWithString:commentModel.likeCount];
}

//#pragma mark - 点赞
//- (void)clickPraiseBtn:(UIButton *)btn {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            NSString *typeId = self.commentModel.ID;
//            BOOL liked = self.commentModel.liked;
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
//                            self.commentModel.liked = YES;
//                            self.commentModel.likeCount = self.commentModel.likeCount + 1;
//        //                    self.praiseBtnLab.text = @(self.model.likeCount).stringValue;
//                            self.praiseBtnLab.text = [NSString transformCountWithString:self.commentModel.likeCount];
//                            self.praiseBtn.selected = YES;
//                        } else {
//                            TOAST(result.msg);
//                        }
//                    } else {
//                        if (result.code == 0 || result.code == 3002) {//"code": "3001", "msg": "已经添加过收藏",
//                            TOAST(@"取消点赞");
//                            self.commentModel.liked = NO;
//                            self.commentModel.likeCount = self.commentModel.likeCount - 1;
//        //                    self.praiseBtnLab.text = @(self.model.likeCount).stringValue;
//                            self.praiseBtnLab.text = [NSString transformCountWithString:self.commentModel.likeCount];
//                            self.praiseBtn.selected = NO;
//         
//                        } else {
//                            TOAST(result.msg);
//                        }
//                    }
//                }
//            }];
//        }
//    }];
//}

- (UIButton *)praiseBtn {
    if (!_praiseBtn) {
        _praiseBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 45)];
        [_praiseBtn setImage:IMAGENAME(@"ic_common_like_n_44") forState:UIControlStateNormal];
        [_praiseBtn setImage:IMAGENAME(@"ic_common_like_h_44") forState: UIControlStateHighlighted | UIControlStateSelected];
        [_praiseBtn setImage:IMAGENAME(@"ic_common_like_h_44") forState:UIControlStateSelected];
//        _praiseBtn.selected = YES;
        _praiseBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _praiseBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);

//        [_praiseBtn addTarget:self action:@selector(clickPraiseBtn:) forControlEvents:UIControlEventTouchUpInside];
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
