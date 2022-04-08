//
//  MWSBagsModel.h
//  MoWanShang
//
//  Created by rrtv on 2022/3/31.
//

#import <Foundation/Foundation.h>
#import "MWSLotteryDetailGoodsInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MWSBagsModel : NSObject
//id
@property (nonatomic, copy) NSString *bag_id;
//一共80
@property (nonatomic, assign) NSInteger bag_total;
//第几箱
@property (nonatomic, assign) NSInteger bag_no;

@property (nonatomic, assign) NSInteger haveData;
//还剩几个
@property (nonatomic, assign) NSInteger bag_left;

@property (nonatomic, copy) NSArray<MWSLotteryDetailGoodsInfoModel *> *good_info;
 
@end

NS_ASSUME_NONNULL_END
