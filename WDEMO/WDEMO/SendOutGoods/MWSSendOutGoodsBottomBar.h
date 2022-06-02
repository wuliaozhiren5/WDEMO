//
//  MWSSendOutGoodsBottomBar.h
//  MoWanShang
//
//  Created by rrtv on 2022/5/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MWSSendOutGoodsBottomBar : UIView

@property (nonatomic, strong) UIButton *confirmBtn;

@property (nonatomic, strong) UIButton *cancelBtn;

@property (nonatomic, strong) YYLabel *tipsLab;

@property (nonatomic, strong) UIView *tipsLabBackgroundView;
@end

NS_ASSUME_NONNULL_END
