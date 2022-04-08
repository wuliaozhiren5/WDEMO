//
//  MWSLotteryBagListTopOrderWayCollectionView.h
//  MoWanShang
//
//  Created by rrtv on 2022/3/30.
//

#import <UIKit/UIKit.h>
#import "MWSLotteryBagListTopModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol MWSLotteryBagListTopOrderWayCollectionViewDelegate <NSObject>

- (void)orderWayCollectionDidSelectWithIndex:(NSInteger)index
                               orderWayModel:(MWSLotteryBagListTopModel *)orderWayModel;

@end
@interface MWSLotteryBagListTopOrderWayCollectionView : UICollectionView

@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, assign) BOOL open;

@property (nonatomic, copy) NSArray *data;

@property (nonatomic, weak) id<MWSLotteryBagListTopOrderWayCollectionViewDelegate> collectionViewDelegate;

@end

NS_ASSUME_NONNULL_END
