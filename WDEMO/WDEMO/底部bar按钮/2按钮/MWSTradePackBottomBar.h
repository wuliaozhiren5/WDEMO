//
//  MWSTradePackBottomBar.h
//  MoWanShang
//
//  Created by aimeiju on 2022/6/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MWSTradePackBottomBar : UIView

@property (nonatomic, strong) UIButton *nextBtn;

@property (nonatomic, strong) UIButton *detailBtn;

@property (nonatomic, strong) UILabel *tipsLab;

@property (nonatomic, strong) UIView *tipsLabBackgroundView;

@property (nonatomic, assign) NSInteger count;

//@property (nonatomic, assign) BOOL isTrade;

//'交易类型: 1-一口价 2-换一换 3-竞拍 4-打擂 5-求购',
@property (nonatomic, assign) NSInteger tradeType;
@property (nonatomic, assign) NSInteger selectMaxCount;
@end

NS_ASSUME_NONNULL_END
