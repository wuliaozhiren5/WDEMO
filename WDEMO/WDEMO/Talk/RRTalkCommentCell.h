//
//  RRTalkCommentCell.h
//  NJVideo
//
//  Created by rrtv on 2021/12/13.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsTextImageReplyListCell.h"
#import "RRTalkDarmaCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRTalkCommentCell : RRSeasonSeniorCommentsTextImageReplyListCell
//点击（埋点跳转）
@property (nonatomic, copy) ClickSeasonSeniorCommentsCell clickDrama;
//显示（埋点）
@property (nonatomic, copy) ClickSeasonSeniorCommentsCell showDrama;
//剧集卡片
@property (nonatomic, strong) RRTalkDarmaCard *darmaCard; //w=kwidth-61-16 h=51
  
@end

NS_ASSUME_NONNULL_END
