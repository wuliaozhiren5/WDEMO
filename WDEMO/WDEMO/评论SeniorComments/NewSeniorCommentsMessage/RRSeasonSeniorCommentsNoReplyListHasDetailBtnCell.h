//
//  RRSeasonSeniorCommentsNoReplyListHasDetailBtnCell.h
//  PUClient
//
//  Created by rrtv on 2021/5/28.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsNoReplyListCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRSeasonSeniorCommentsNoReplyListHasDetailBtnCell : RRSeasonSeniorCommentsNoReplyListCell

//查看详情
@property (nonatomic, strong) UIButton *detailBtn;
//点击收起
@property (nonatomic, copy) ClickSeasonSeniorCommentsCell clickDetail;
@end

NS_ASSUME_NONNULL_END
