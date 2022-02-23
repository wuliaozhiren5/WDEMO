//
//  RRDramaCommentCell.h
//  NJVideo
//
//  Created by WDEMO on 2021/8/2.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRSeasonSeniorCommentsTextImageReplyListCell.h"

#import "RRDramaCommentScoreView.h"
NS_ASSUME_NONNULL_BEGIN

@interface RRDramaCommentCell : RRSeasonSeniorCommentsTextImageReplyListCell
//评分View
@property (nonatomic, strong) RRDramaCommentScoreView *scoreView;

//+ (CGFloat)getScoreViewTop;

@end
NS_ASSUME_NONNULL_END

