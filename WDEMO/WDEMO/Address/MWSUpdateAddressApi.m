//
//  MWSUpdateAddressApi.m
//  MoWanShang
//
//  Created by rrtv on 2022/5/23.
//

#import "MWSUpdateAddressApi.h"

@implementation MWSUpdateAddressApi

//- (instancetype)init {
//    if (self = [super init]) {
//    }
//    return self;
//}
//
//- (NSString*)requestUrl {
//
//    return @"/shipping/update/address";
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
//    dict[@"id"] = _ID;
//    dict[@"name"] = _name;
//    dict[@"phone"] = _phone;
//    dict[@"area"] = _area;
//    dict[@"address"] = _address;
//    dict[@"zipCode"] = _zipCode;
//    dict[@"deleted"] = @(_deleted);
//    return dict;
//}
//
//+ (void)requestDeleteAddressWithID:(NSString *)ID
//                             block:(void(^)(BOOL success, NSError *error))block {
//
//
//    MWSUpdateAddressApi *api = [[MWSUpdateAddressApi alloc] init];
//    api.ID = ID;
//    api.deleted = 1;
//    [api startWithCompletionBlock:^(MWSJsonModel *result, NSError *error) {
//
//        if (error) {
//            block(NO, error);
//            return;
//        }
//
//        if (result.code == 0) {
//            block(YES, nil);
//        } else {
//            block(NO, nil);
//        }
////        NSArray *array = [NSArray modelArrayWithClass:[MWSRewardDetailModel class] json:result.data];
////        block(array, nil);
//    }];
//
//}

@end

