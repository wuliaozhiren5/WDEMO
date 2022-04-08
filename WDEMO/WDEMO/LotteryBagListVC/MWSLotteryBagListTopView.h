//
//  MWSLotteryBagListTopView.h
//  MoWanShang
//
//  Created by rrtv on 2022/3/30.
//

#import <UIKit/UIKit.h>
#import "MWSLotteryBagListTopPageCollectionView.h"
#import "MWSLotteryBagListTopOrderWayCollectionView.h"
#import "MWSLotteryBagListTopLevelCollectionView.h"
#import "MWSLotteryBagListTopModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol MWSLotteryBagListTopViewDelegate <NSObject>

- (void)bagListTopViewWithPageModel:(MWSLotteryBagListTopModel *)pageModel;
- (void)bagListTopViewWithOrderWayModel:(MWSLotteryBagListTopModel *)orderWayModel;
- (void)bagListTopViewWithLevelModel:(MWSLotteryBagListTopModel *)levelModel;

@end

@interface MWSLotteryBagListTopView : UIView

@property (nonatomic, strong) MWSLotteryBagListTopPageCollectionView *pageCollectionView;
@property (nonatomic, strong) MWSLotteryBagListTopOrderWayCollectionView *orderWayCollectionView;
@property (nonatomic, strong) MWSLotteryBagListTopLevelCollectionView *levelCollectionView;

@property (nonatomic, assign)NSInteger pageIndex;
@property (nonatomic, assign)NSInteger orderWayIndex;
@property (nonatomic, assign)NSInteger levelIndex;

@property (nonatomic, copy)NSArray *pageArr;
@property (nonatomic, copy)NSArray *orderWayArr;
@property (nonatomic, copy)NSArray *levelArr;

@property (nonatomic, weak) id<MWSLotteryBagListTopViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
