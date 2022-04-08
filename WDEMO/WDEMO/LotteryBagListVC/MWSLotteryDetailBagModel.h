//
//  MWSLotteryDetailBagModel.h
//  MoWanShang
//
//  Created by rrtv on 2022/3/16.
//

#import <Foundation/Foundation.h>
#import "MWSLotteryDetailGoodsInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MWSLotteryDetailBagModel : NSObject
/*
{
    "code": "0000",
    "msg": "ok",
    "data": {
        "bag_id": 2610,
        "haveData": 1,
        "goods_left": 31,
        "bag_total": 25,
        "goods_total": 70,
        "bag_no": 12,
        "good_info": [
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
            {
                "box_id": 27161,
                "good_image": "https://cdn.juquanquanapp.com/fe-vision-static/prod/GZTEhXmJkYuwZaAspVmKeuCSZduqYgHL.1637317380345.jpg",
                "good_left": 1,
                "good_level": "B",
                "goods_type": "",
                "good_id": 27161,
                "good_name": "艾姬多娜手办",
                "good_title": "零售价：78元",
                "good_image_mini": "https://cdn.juquanquanapp.com/fe-vision-static/prod/ATAv8wwSfXnGl1DEFSjKfYC2inZIEMhQ.1637317377066.jpg",
                "good_total": 2
            },
            {
                "box_id": 27162,
                "good_image": "https://cdn.juquanquanapp.com/fe-vision-static/prod/HhctcS2j0Jgpm8ytF2JZKzVpArW0qrju.1637317397113.jpg",
                "good_left": 2,
                "good_level": "C",
                "goods_type": "",
                "good_id": 27162,
                "good_name": "蕾姆手办",
                "good_title": "零售价：78元",
                "good_image_mini": "https://cdn.juquanquanapp.com/fe-vision-static/prod/n1qLJtymyl6OWJHfIdNu7dqxnDHTl3wn.1637317394807.jpg",
                "good_total": 2
            },
            {
                "box_id": 27163,
                "good_image": "https://cdn.juquanquanapp.com/fe-vision-static/prod/O8yYhm6L8BO3DgeXsjkKz2AhjWxCmXJP.1637317412724.jpg",
                "good_left": 0,
                "good_level": "D",
                "goods_type": "",
                "good_id": 27163,
                "good_name": "毛巾",
                "good_title": "零售价：78元",
                "good_image_mini": "https://cdn.juquanquanapp.com/fe-vision-static/prod/uNNW2cnPpLHFWcHozYeozJaanLK5nX02.1637317411000.jpg",
                "good_total": 1
            },
            {
                "box_id": 27164,
                "good_image": "https://cdn.juquanquanapp.com/fe-vision-static/prod/bi3z2REg9M89rlqAN0VXbFdymWyaaPWR.1637317425768.jpg",
                "good_left": 10,
                "good_level": "E",
                "goods_type": "",
                "good_id": 27164,
                "good_name": "装饰画",
                "good_title": "零售价：78元",
                "good_image_mini": "https://cdn.juquanquanapp.com/fe-vision-static/prod/ZNbpfhklqMMEBgiBnMenCJAxjfdykfmn.1637317423044.jpg",
                "good_total": 20
            },
            {
                "box_id": 27165,
                "good_image": "https://cdn.juquanquanapp.com/fe-vision-static/prod/GP3xpwrzVzwf6OPfkXMzQ9P4fcCxyibm.1637317449637.jpg",
                "good_left": 10,
                "good_level": "F",
                "goods_type": "",
                "good_id": 27165,
                "good_name": "亚克力挂饰",
                "good_title": "零售价：78元",
                "good_image_mini": "https://cdn.juquanquanapp.com/fe-vision-static/prod/FAHqySyMeCyhbH0x6N4dxURqGMOoNFBp.1637317447748.jpg",
                "good_total": 21
            },
            {
                "box_id": 27166,
                "good_image": "https://cdn.juquanquanapp.com/fe-vision-static/prod/KCH44tFXTlseXpMNO9wTOqXlIe3gFFVj.1637317470655.jpg",
                "good_left": 8,
                "good_level": "G",
                "goods_type": "",
                "good_id": 27166,
                "good_name": "Q版公仔盲盒",
                "good_title": "零售价：78元",
                "good_image_mini": "https://cdn.juquanquanapp.com/fe-vision-static/prod/fsOz7ahomIBzh1pLDQDjrjPaNvcgk8gf.1637317468828.jpg",
                "good_total": 22
            },
            {
                "box_id": 27167,
                "good_image": "https://cdn.juquanquanapp.com/fe-vision-static/prod/fza4vAgopsFUobMe7ijdLr4c6LCBU1bO.1637317487529.jpg",
                "good_left": 1,
                "good_level": "Last",
                "goods_type": "",
                "good_id": 27167,
                "good_name": "最终赏：蕾姆半身像（害羞表情版）",
                "good_title": "只赠送不售卖",
                "good_image_mini": "https://cdn.juquanquanapp.com/fe-vision-static/prod/URmmvtIbdk9gM7WBaaQ5IKFOxbG6o0lV.1637317485189.jpg",
                "good_total": 1
            }
        ]
    }
}
*/

@property (nonatomic, copy) NSString *bag_id;

@property (nonatomic, assign) NSInteger haveData;
//还剩几个
@property (nonatomic, assign) NSInteger goods_left;
//箱子总数
@property (nonatomic, assign) NSInteger bag_total;
//货物总数
@property (nonatomic, assign) NSInteger goods_total;
//第几箱
@property (nonatomic, assign) NSInteger bag_no;

@property (nonatomic, copy) NSArray<MWSLotteryDetailGoodsInfoModel *> *good_info;
 
@end

NS_ASSUME_NONNULL_END
