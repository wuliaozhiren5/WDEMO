//
//  MJDIYLoadingView.h
//  MoWanShang
//
//  Created by rrtv on 2022/3/28.
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

@protocol MJDIYLoadingViewDelegate;

@interface MJDIYLoadingView : UIView
 
@property (nonatomic, strong) UIImageView *loadingView;//动图
@property (nonatomic, strong) UILabel *tipsLab;//提示文字
@property (nonatomic, strong) UIButton *retryBtn;//重试按钮
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, assign) LoadingViewState state;//状态

@property (nonatomic, weak) id<MJDIYLoadingViewDelegate> delegate;

@end

@protocol MJDIYLoadingViewDelegate <NSObject>

- (void)clickDIYLoadingView:(MJDIYLoadingView *)view;

@end
NS_ASSUME_NONNULL_END
