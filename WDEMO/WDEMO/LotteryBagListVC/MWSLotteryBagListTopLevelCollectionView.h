//
//  MWSLotteryBagListTopLevelCollectionView.h
//  MoWanShang
//
//  Created by rrtv on 2022/3/30.
//

#import <UIKit/UIKit.h>
#import "MWSLotteryBagListTopModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol MWSLotteryBagListTopLevelCollectionViewDelegate <NSObject>

- (void)levelCollectionDidSelectWithIndex:(NSInteger)index
                               levelModel:(MWSLotteryBagListTopModel *)levelModel;

@end

@interface MWSLotteryBagListTopLevelCollectionView : UICollectionView

@property (nonatomic, assign) NSInteger selectIndex;

@property (nonatomic, copy) NSArray *data;

@property (nonatomic, weak) id<MWSLotteryBagListTopLevelCollectionViewDelegate> collectionViewDelegate;@end

NS_ASSUME_NONNULL_END
