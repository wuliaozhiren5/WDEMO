//
//  MWSPackBottomBar.h
//  MoWanShang
//
//  Created by rrtv on 2022/5/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MWSPackBottomBar : UIView

@property (nonatomic, strong) UIButton *nextBtn;

@property (nonatomic, strong) UIButton *detailBtn;

@property (nonatomic, strong) UILabel *tipsLab;

@property (nonatomic, strong) UIView *tipsLabBackgroundView;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) BOOL isTrade;

@end

NS_ASSUME_NONNULL_END

