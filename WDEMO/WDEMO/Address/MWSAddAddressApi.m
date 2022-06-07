//
//  MWSAddAddressApi.m
//  MoWanShang
//
//  Created by rrtv on 2022/5/23.
//

#import "MWSAddAddressApi.h"

@implementation MWSAddAddressApi

//- (instancetype)init {
//    if (self = [super init]) {
//    }
//    return self;
//}
//
//- (NSString*)requestUrl {
//    
//    return @"/shipping/address/save";
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
//    dict[@"name"] = _name;
//    dict[@"phone"] = _phone;
//    dict[@"area"] = _area;
//    dict[@"address"] = _address;
//    dict[@"zipCode"] = _zipCode;
//    return dict;
//}
//
//+ (void)requestAddAddressWithName:(NSString *)name
//                            phone:(NSString *)phone
//                             area:(NSString *)area
//                          address:(NSString *)address
//                          zipCode:(NSString *)zipCode
//                            block:(void(^)(BOOL success, NSError *error))block {
//    
//    MWSAddAddressApi *api = [[MWSAddAddressApi alloc] init];
//    api.name = name;
//    api.phone = phone;
//    api.area = area;
//    api.address = address;
//    api.zipCode = zipCode;
//    
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
//      
////        NSArray *array = [NSArray modelArrayWithClass:[MWSRewardDetailModel class] json:result.data];
////        block(array, nil);
//    }];
//    
//}

@end




