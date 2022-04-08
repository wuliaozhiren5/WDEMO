//
//  MWSBagListGoodsInfoCell.h
//  MoWanShang
//
//  Created by rrtv on 2022/3/29.
//

#import <UIKit/UIKit.h>
#import "MWSLotteryDetailGoodsInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MWSBagListGoodsInfoCell : UICollectionViewCell
//abcd赏
@property (nonatomic, strong) UILabel *levelLab;
//24/24
@property (nonatomic, strong) UILabel *countLab;

@property (nonatomic, copy)NSString *level;

@property (nonatomic, strong) MWSLotteryDetailGoodsInfoModel *model;
@end

NS_ASSUME_NONNULL_END
