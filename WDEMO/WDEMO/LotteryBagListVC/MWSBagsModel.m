//
//  MWSBagsModel.m
//  MoWanShang
//
//  Created by rrtv on 2022/3/31.
//

#import "MWSBagsModel.h"

@implementation MWSBagsModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"good_info" : [MWSLotteryDetailGoodsInfoModel class],
    };
}
@end
