//
//  RRSeasonSeniorCommentsTextImageReplyListCell.h
//  NJVideo
//
//  Created by rrtv on 2021/8/11.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsTextImageCell.h"
#import "RRSeasonSeniorCommentsReplyTableView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickSeniorCommentsTextImageReplyListCell)(RRSeniorCommentsModel * _Nonnull commentModel, RRSeniorCommentsModel * _Nullable replyModel, BOOL isShowMore);//commentModel不可以为空 replyModel可以为空 isShowMore文字是否展开

//一级评论cell，带文字，带图片，带回复列表2行
@interface RRSeasonSeniorCommentsTextImageReplyListCell : RRSeasonSeniorCommentsTextImageCell

//回复列表2行
@property (nonatomic, strong) RRSeasonSeniorCommentsReplyTableView *tableView;

//点击回复列表的cell和footer
@property (nonatomic, copy) ClickSeniorCommentsTextImageReplyListCell clickReplyListCell;
@end

NS_ASSUME_NONNULL_END
