//
//  MWSSendOutGoodsApi.h
//  MoWanShang
//
//  Created by rrtv on 2022/5/25.
//

#import <Foundation/Foundation.h>
//#import "YTKRequest.h"
//#import "MWSPayModel.h"
//#import "MWSTradePayApi.h"

NS_ASSUME_NONNULL_BEGIN
@interface MWSSendOutGoodsApi : NSObject

//@interface MWSSendOutGoodsApi : YTKRequest
//
//@property (nonatomic, copy) NSArray *tradeIds;
//
//@property (nonatomic, copy) NSString *userName;
//
//@property (nonatomic, copy) NSString *phone;
//
//@property (nonatomic, copy) NSString *address;
//
//@property (nonatomic, copy) NSString *mark;
////邮费1800
//@property (nonatomic, assign) NSInteger expressFee;
////payMethod  1是微信 2是余额 5是支付宝
////@property (nonatomic, assign) NSInteger payMethod;
//
//@property (nonatomic, assign) MWSPayMethodType payMethodType;
//
////请求状态
//+ (void)requestTradeStatusWithTradeIds:(NSArray *)tradeIds
//                                 block:(void(^)(MWSJsonModel *model, NSError *error))block;
//
////交易/快递/收费
//+ (void)requestTradeExpressChargeWithTradeIds:(NSArray *)tradeIds
//                                     userName:(NSString *)userName
//                                        phone:(NSString *)phone
//                                      address:(NSString *)address
//                                         mark:(NSString *)mark
//                                   expressFee:(NSInteger)expressFee
//                                payMethodType:(MWSPayMethodType)payMethodType
//                                        block:(void(^)(MWSPayModel *model, NSError *error))block;
@end

NS_ASSUME_NONNULL_END
