//
//  XXLoadingView.h
//  WDEMO
//
//  Created by WDEMO on 2021/6/30.
//  Copyright © 2021 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LoadingViewState) {
    LoadingViewStateNone = 0,
    LoadingViewStateLoading,  //加载中
    LoadingViewStateSuccess,  //加载成功
    LoadingViewStateFailure,  //加载失败，服务器错误
    LoadingViewStateNoData,   //加载成功，无数据
    LoadingViewStateNoNetwork,//加载失败，无网络
};

@interface XXLoadingView : UIView
 
@property (nonatomic, strong) UIImageView *loadingView;//动图
@property (nonatomic, strong) UILabel *tipsLab;//提示文字
@property (nonatomic, strong) UIButton *retryBtn;//重试按钮
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, assign) LoadingViewState state;//状态

@end

NS_ASSUME_NONNULL_END
