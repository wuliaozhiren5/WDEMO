//
//  RRSeasonSeniorCommentsTextImageDetailBtnCell.h
//  NJVideo
//
//  Created by WDEMO on 2021/8/11.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsTextImageCell.h"

NS_ASSUME_NONNULL_BEGIN

//一级评论cell，带文字，带图片，带查看详情按钮
@interface RRSeasonSeniorCommentsTextImageDetailBtnCell : RRSeasonSeniorCommentsTextImageCell
//查看详情
@property (nonatomic, strong) UIButton *detailBtn;
//点击收起
@property (nonatomic, copy) ClickSeasonSeniorCommentsCell clickDetail;
@end

NS_ASSUME_NONNULL_END
