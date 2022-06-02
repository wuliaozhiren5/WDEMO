//
//  MWSSendOutGoodsApi.m
//  MoWanShang
//
//  Created by rrtv on 2022/5/25.
//

#import "MWSSendOutGoodsApi.h"

@implementation MWSSendOutGoodsApi

//- (instancetype)init {
//    if (self = [super init]) {
//    }
//    return self;
//}
//
//- (NSString*)requestUrl {
//    
//    //交易/快递/收费
//    return @"/trade/express/charge";
//}
//
//- (YTKRequestMethod)requestMethod{
//    return YTKRequestMethodPOST;
//}
//
//- (YTKRequestSerializerType)requestSerializerType {
//    return YTKRequestSerializerTypeJSON;
//}
//
////- (NSInteger)cacheTimeInSeconds{
////    return CacheTime;
////}
//
//- (id)requestArgument {
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    dict[@"tradeIds"] = _tradeIds;
//    dict[@"userName"] = _userName;
//    dict[@"phone"] = _phone;
//    dict[@"address"] = _address;
//    dict[@"mark"] = _mark;
//    
//    dict[@"expressFee"] = @(_expressFee);
//    switch (_payMethodType) {
//        case MWSPayMethodTypeWeChat:
//            dict[@"payMethod"] = @(1);
//            break;
//        case MWSPayMethodTypeBalance:
//            dict[@"payMethod"] = @(2);
//            break;
//        case MWSPayMethodTypezhifubao:
//            dict[@"payMethod"] = @(5);
//            break;
//        default:
//            break;
//    }
//    
//    return dict;
//}
//
//+ (void)requestTradeStatusWithTradeIds:(NSArray *)tradeIds
//                                 block:(void(^)(MWSJsonModel *model, NSError *error))block {
//    
//    MWSSendOutGoodsApi *api = [[MWSSendOutGoodsApi alloc] init];
//    api.tradeIds = tradeIds;
//  
//    [api startWithCompletionBlock:^(MWSJsonModel *result, NSError *error) {
//        
//        if (error) {
//            block(nil, error);
//            return;
//        }
////
////        if (result.code == 0) {
////            block(YES, nil);
////        } else {
////            block(NO, nil);
////        }
//      
////        NSArray *array = [NSArray modelArrayWithClass:[MWSRewardDetailModel class] json:result.data];
//        block(result, nil);
//    }];
//    
//}
//
//
////交易/快递/收费
//+ (void)requestTradeExpressChargeWithTradeIds:(NSArray *)tradeIds
//                                     userName:(NSString *)userName
//                                        phone:(NSString *)phone
//                                      address:(NSString *)address
//                                         mark:(NSString *)mark
//                                   expressFee:(NSInteger)expressFee
//                                payMethodType:(MWSPayMethodType)payMethodType
//                                        block:(void(^)(MWSPayModel *model, NSError *error))block;{
//   
//    MWSSendOutGoodsApi *api = [[MWSSendOutGoodsApi alloc] init];
//    api.tradeIds = tradeIds;
//    api.userName = userName;
//    api.phone = phone;
//    api.address = address;
//    api.mark = mark;
//    api.expressFee = expressFee;
//    api.payMethodType = payMethodType;
//
//    [api startWithCompletionBlock:^(MWSJsonModel *result, NSError *error) {
//        if (error) {
//            block(nil, error);
//            return;
//        }
//        MWSPayModel *model = [MWSPayModel modelWithJSON:result.data];
//        block(model, nil);
//    }];
//}
@end
