//
//  RRDramaCommentDetailCell.h
//  NJVideo
//
//  Created by rrtv on 2021/8/2.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRDramaCommentDetailScoreView.h"
#import "RRDramaCommentDetailImageScrollView.h"
#import "RRSeniorCommentsModel.h"
#import "RRSeasonSeniorCommentsCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRDramaCommentDetailCell : UITableViewCell
//图片滚动器
@property (nonatomic, strong) RRDramaCommentDetailImageScrollView *imageScrollView;
//内容
@property (nonatomic, strong) YYLabel *yyContentLab;//内容
//评分
@property (nonatomic, strong) RRDramaCommentDetailScoreView *scoreView;//评分
//日期
@property (nonatomic, strong) UILabel *dateLab;//日期

@property (nonatomic, strong) UIControl *seasonView;
@property (nonatomic, strong) UIImageView *seasonViewImgV;
@property (nonatomic, strong) UILabel *seasonViewTitleLab;
@property (nonatomic, strong) UILabel *seasonViewSubtitleLab;
@property (nonatomic, strong) UIButton *seasonViewBtn;

//内容已下架
@property (nonatomic, strong) UILabel *noSeasonViewLab;

@property (nonatomic, strong) UIView *line;//线

@property (nonatomic, assign) BOOL isHalf;          //半屏

@property (nonatomic, copy) ClickSeasonSeniorCommentsCell clickDelete;

@property (nonatomic, copy) ClickSeasonSeniorCommentsCell clickDrama;

@property (nonatomic, strong) RRSeniorCommentsModel *model;

+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model;
//文字top
+ (CGFloat)cellContentLabTopWithModel:(RRSeniorCommentsModel *)model;

@end

NS_ASSUME_NONNULL_END
