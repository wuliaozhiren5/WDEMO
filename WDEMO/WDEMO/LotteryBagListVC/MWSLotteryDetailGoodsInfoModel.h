//
//  MWSLotteryDetailGoodsInfoModel.h
//  MoWanShang
//
//  Created by rrtv on 2022/3/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MWSLotteryDetailGoodsInfoModel : NSObject
/*
{
    "box_id": 27160,
    "good_image": "https://cdn.juquanquanapp.com/fe-vision-static/prod/mKAd5oRjceahd6Nm4xmgDgFgYnjG6yOr.1637317345909.jpg",
    "good_left": 0,
    "good_level": "A",
    "goods_type": "",
    "good_id": 27160,
    "good_name": "艾米莉亚半身像",
    "good_title": "零售价：78元",
    "good_image_mini": "https://cdn.juquanquanapp.com/fe-vision-static/prod/H8rt9DpVWyVb9LNe4uuuNZ2JUpBFEmqe.1637317343513.jpg",
    "good_total": 2
},
 */

@property (nonatomic, copy) NSString *box_id;

@property (nonatomic, copy) NSString *good_image;

@property (nonatomic, copy) NSString *good_image_mini;

@property (nonatomic, copy) NSString *good_level;

@property (nonatomic, copy) NSString *goods_type;

@property (nonatomic, copy) NSString *good_id;

@property (nonatomic, copy) NSString *good_name;

@property (nonatomic, copy) NSString *good_title;

//剩余数量
@property (nonatomic, assign) NSInteger good_left;
//总数
@property (nonatomic, assign) NSInteger good_total;

@end

NS_ASSUME_NONNULL_END
