//
//  RRSeasonSeniorCommentsTextCell.h
//  NJVideo
//
//  Created by rrtv on 2021/8/11.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsCell.h"
 
NS_ASSUME_NONNULL_BEGIN

//一级评论cell，带文字
@interface RRSeasonSeniorCommentsTextCell : RRSeasonSeniorCommentsCell
//剧透
@property (nonatomic, strong) UIView *firstView;//剧透
@property (nonatomic, strong) UILabel *firstLab;//剧透
//内容
//@property (nonatomic, strong) UILabel *contentLab; //内容
@property (nonatomic, strong) YYLabel *yyContentLab;//内容

+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model isShowAll:(BOOL)isShowAll;
@end

NS_ASSUME_NONNULL_END
