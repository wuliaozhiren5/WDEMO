//
//  XXLoadingView.h
//  WDEMO
//
//  Created by rrtv on 2021/6/30.
//  Copyright © 2021 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LoadingViewState) {
    MJLoadingViewStateNone = 0,
    MJLoadingViewStateLoading,
    MJLoadingViewStateSuccess,
    MJLoadingViewStateFailure,
    MJLoadingViewStateNoData,
    MJLoadingViewStateNoNetwork,
};

@interface XXLoadingView : UIView
 
@property (nonatomic, strong) UIImageView *loadingView;//动图
@property (nonatomic, strong) UILabel *tipsLab;//提示文字
@property (nonatomic, strong) UIButton *retryBtn;//重试按钮
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, assign) LoadingViewState state;//状态

@end

NS_ASSUME_NONNULL_END
