//
//  RRSeasonSeniorCommentsCell.h
//  PUClient
//
//  Created by WDEMO on 2021/3/25.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYKit.h"
#import "RRSeniorCommentsModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickSeasonSeniorCommentsCell)(RRSeniorCommentsModel * _Nonnull model);//不可以为空

//一级评论cell，BaseCell
@interface RRSeasonSeniorCommentsCell : UITableViewCell

//头像
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UIImageView *avatarVipIconImageView;
//昵称
@property (nonatomic, strong) UILabel *nicknameLab;//昵称
@property (nonatomic, strong) UIView *nicknameLevelView;//昵称等级
@property (nonatomic, strong) UILabel *nicknameLevelLab;//昵称等级
@property (nonatomic, strong) UIImageView *nicknameVipIconImageView;//昵称vip

//底部的View
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIView *bottomViewLine;//底部黑线
@property (nonatomic, strong) UILabel *dateLab; //日期
@property (nonatomic, strong) UIButton *praiseBtn;
@property (nonatomic, strong) UILabel *praiseBtnLab;

//置顶的View
@property (nonatomic, strong) UIView *toppingTagView;
//@property (nonatomic, strong) UILabel *toppingTagLab;//置顶

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

//点击cell 点击整个cell
@property (nonatomic, copy) ClickSeasonSeniorCommentsCell clickAllCell;

//点击赞
@property (nonatomic, copy) ClickSeasonSeniorCommentsCell clickPraise;

@property (nonatomic, strong) RRSeniorCommentsModel *model;

@property (nonatomic, assign) BOOL isHalf;//半屏

+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model;

+ (CGFloat)getAvatarImageViewTop;//头像距离顶部top = 12

+ (CGFloat)getNicknameLabTop;//昵称距离顶部top = 10

+ (CGFloat)getContentLabTop;//内容文字顶部top = 34

+ (CGFloat)getSpacing;//间距 = 8

+ (CGFloat)getBottomViewHeight;//底部View = 36

+ (CGFloat)padding;//内边距左边距右边距 = 16

+ (CGFloat)textLeading;//文本左边距 = 61

- (void)setupViews;
@end

NS_ASSUME_NONNULL_END



 
 
