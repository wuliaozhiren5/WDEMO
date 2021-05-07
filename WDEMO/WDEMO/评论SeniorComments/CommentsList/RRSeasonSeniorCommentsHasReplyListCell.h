//
//  RRSeasonSeniorCommentsHasReplyListCell.h
//  PUClient
//
//  Created by rrtv on 2021/4/12.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsCell.h"
#import "RRSeasonSeniorCommentsNoReplyListCell.h"
//一级评论cell，带回复列表
NS_ASSUME_NONNULL_BEGIN
//typedef void(^ClickSeasonSeniorCommentsText)(RRSeniorCommentsModel * _Nonnull model);//不可以为空

@interface RRSeasonSeniorCommentsHasReplyListCell : RRSeasonSeniorCommentsNoReplyListCell
 
//@property (nonatomic, strong) RRSeniorCommentsModel *model;
 
//+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model;
 
@end

NS_ASSUME_NONNULL_END

