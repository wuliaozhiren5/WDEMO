//
//  RRSeasonSeniorCommentsNoReplyListCell.h
//  PUClient
//
//  Created by rrtv on 2021/4/29.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRSeasonSeniorCommentsCell.h"

//一级评论cell，不带回复列表
NS_ASSUME_NONNULL_BEGIN

@interface RRSeasonSeniorCommentsNoReplyListCell : RRSeasonSeniorCommentsCell

+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model isShowAll:(BOOL)isShowAll;

@end

NS_ASSUME_NONNULL_END
