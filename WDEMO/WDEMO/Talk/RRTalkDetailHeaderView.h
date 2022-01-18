//
//  RRTalkDetailHeaderView.h
//  PPVideo
//
//  Created by rrtv on 2021/12/14.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRTalkContentTextView.h"
#import "RRCommunityTalkModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol RRTalkDetailHeaderViewDelegate <NSObject>
//大小变化
- (void)talkDetailHeaderViewFrameChange;
@end

@interface RRTalkDetailHeaderView : UIView
//容器
@property (nonatomic, strong) UIView *container;

@property (nonatomic, assign) CGFloat headerHeight;//高度

@property (nonatomic, strong) RRCommunityTalkModel *model;

@property (nonatomic, weak) id<RRTalkDetailHeaderViewDelegate> delegate;

- (void)addGradientLayer;
@end

NS_ASSUME_NONNULL_END

