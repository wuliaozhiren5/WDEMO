//
//  MWSCityListApi.m
//  MoWanShang
//
//  Created by rrtv on 2022/5/23.
//

#import "MWSCityListApi.h"

@implementation MWSCityListApi
//- (instancetype)init {
//    if (self = [super init]) {
//    }
//    return self;
//}
//
//- (NSString*)requestUrl {
//    
//    return @"/shipping/city/list";
//}
//
//- (YTKRequestMethod)requestMethod{
//    return YTKRequestMethodGET;
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
////- (id)requestArgument {
////    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
////    dict[@"name"] = _name;
////    dict[@"phone"] = _phone;
////    dict[@"area"] = _area;
////    dict[@"address"] = _address;
////    dict[@"zipCode"] = _zipCode;
////    return dict;
////}
//
//+ (void)requestAddressListWithBlock:(void(^)(NSArray *array, NSError *error))block {
//    
//    MWSCityListApi *api = [[MWSCityListApi alloc] init];
//    [api startWithCompletionBlock:^(MWSJsonModel *result, NSError *error) {
//
//        if (error) {
//            block(nil, error);
//            return;
//        }
//
//        NSArray *array = [NSArray modelArrayWithClass:[MWSProvinceModel class] json:result.data];
//        block(array, nil);
//    }];
//
//}
@end
