//
//  MWSLotteryBagListTopPageCollectionView.h
//  MoWanShang
//
//  Created by rrtv on 2022/3/30.
//

#import <UIKit/UIKit.h>
#import "MWSLotteryBagListTopModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol MWSLotteryBagListTopPageCollectionViewDelegate <NSObject>

- (void)pageCollectionViewDidSelectWithIndex:(NSInteger)index
                                   pageModel:(MWSLotteryBagListTopModel *)pageModel;
@end

@interface MWSLotteryBagListTopPageCollectionView : UICollectionView

@property (nonatomic, assign) NSInteger selectIndex;

@property (nonatomic, copy) NSArray *data;

@property (nonatomic, weak) id<MWSLotteryBagListTopPageCollectionViewDelegate> collectionViewDelegate;
@end

NS_ASSUME_NONNULL_END

