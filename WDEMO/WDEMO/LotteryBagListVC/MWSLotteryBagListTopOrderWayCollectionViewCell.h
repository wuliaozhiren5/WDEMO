//
//  MWSLotteryBagListTopOrderWayCollectionViewCell.h
//  MoWanShang
//
//  Created by rrtv on 2022/3/30.
//

#import <UIKit/UIKit.h>
#import "MWSLotteryBagListTopModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MWSLotteryBagListTopOrderWayCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *titleLab;

@property (nonatomic, strong) UIImageView *iconImgV;

@property (nonatomic, assign) BOOL isSelect;

@property (nonatomic, assign) BOOL isOpen;

@property (nonatomic, strong) MWSLotteryBagListTopModel *model;
 
@end

NS_ASSUME_NONNULL_END
