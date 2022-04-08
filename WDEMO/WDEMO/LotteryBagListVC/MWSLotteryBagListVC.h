//
//  MWSLotteryBagListVC.h
//  MoWanShang
//
//  Created by rrtv on 2022/3/29.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MWSLotteryDetailBagModel.h"
#import "MWSBagsModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol MWSLotteryBagListVCDelegate <NSObject>

- (void)bagListVClickWithBagNo:(NSString *)bagModel;

@end

@interface MWSLotteryBagListVC : BaseViewController

@property (nonatomic, copy) NSString *activeId;

@property (nonatomic, weak) id<MWSLotteryBagListVCDelegate> delegate;

@property (nonatomic, strong) MWSLotteryDetailBagModel *bagModel;

@end

NS_ASSUME_NONNULL_END
