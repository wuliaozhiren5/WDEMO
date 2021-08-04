//
//  RRSeasonSeniorCommentsCell.h
//  PUClient
//
//  Created by rrtv on 2021/3/25.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYKit.h"
#import "RRSeniorCommentsModel.h"
#import "RRSeasonSeniorCommentsPhotoCollectionView.h"

//一级评论cell，带剧透图标，带文字，不带图
NS_ASSUME_NONNULL_BEGIN
typedef void(^ClickSeasonSeniorCommentsCell)(RRSeniorCommentsModel * _Nonnull model);//不可以为空

@interface RRSeasonSeniorCommentsCell : UITableViewCell

//头像
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UIImageView *avatarVipIconImageView;
//昵称
@property (nonatomic, strong) UILabel *nicknamelab;//昵称
@property (nonatomic, strong) UIView *nicknameLevelView;//昵称等级
@property (nonatomic, strong) UILabel *nicknameLevelLab;//昵称等级
@property (nonatomic, strong) UIImageView *nicknameVipIconImageView;//昵称vip

//剧透
@property (nonatomic, strong) UIView *firstView;//剧透
@property (nonatomic, strong) UILabel *firstLab;//剧透

//内容
//@property (nonatomic, strong) UILabel *contentLab; //内容
@property (nonatomic, strong) YYLabel *yyContentLab;//内容

//底部的View
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UILabel *dateLab; //日期
@property (nonatomic, strong) UIButton *praiseBtn;
@property (nonatomic, strong) UILabel *praiseBtnLab;

@property (nonatomic, assign) BOOL isShowMore;//是否显示更多数据 默认NO
//@property (nonatomic, assign) BOOL isFirst;//是否是剧透

//@property (nonatomic, copy) ClickSeasonSeniorCommentsCell clickText;
 
//@property (nonatomic, copy) ClickSeasonSeniorCommentsCell clickCopy;

@property (nonatomic, copy) ClickSeasonSeniorCommentsCell clickDelete;

//@property (nonatomic, copy) ClickSeasonSeniorCommentsCell clickReport;

//@property (nonatomic, copy) ClickSeasonSeniorCommentsCell clickImage;

//点击查看全文
@property (nonatomic, copy) ClickSeasonSeniorCommentsCell clickFullText;

//点击收起
@property (nonatomic, copy) ClickSeasonSeniorCommentsCell clickCutText;

@property (nonatomic, strong) RRSeniorCommentsModel *model;

@property (nonatomic, assign) BOOL isHalf;          //半屏

+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model;

- (void)setupViews;
//- (void)clickTextBtn;
@end

NS_ASSUME_NONNULL_END



 
 
