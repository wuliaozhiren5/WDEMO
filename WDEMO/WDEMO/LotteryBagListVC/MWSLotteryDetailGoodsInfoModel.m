//
//  MWSLotteryDetailGoodsInfoModel.m
//  MoWanShang
//
//  Created by rrtv on 2022/3/16.
//

#import "MWSLotteryDetailGoodsInfoModel.h"

@implementation MWSLotteryDetailGoodsInfoModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"good_level" : @[@"good_level", @"goods_level"],
             @"good_left": @[@"good_left", @"goods_left"],
             @"good_total": @[@"good_total", @"goods_total"],
    };
}

@end
