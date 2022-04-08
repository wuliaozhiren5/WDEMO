//
//  MWSLotteryDetailBagModel.m
//  MoWanShang
//
//  Created by rrtv on 2022/3/16.
//

#import "MWSLotteryDetailBagModel.h"

@implementation MWSLotteryDetailBagModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"good_info" : [MWSLotteryDetailGoodsInfoModel class],
    };
}

@end
 
