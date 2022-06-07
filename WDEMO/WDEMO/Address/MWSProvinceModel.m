//
//  MWSProvinceModel.m
//  MoWanShang
//
//  Created by rrtv on 2022/5/23.
//

#import "MWSProvinceModel.h"

@implementation MWSProvinceModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ID" : @[@"id"],
    };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"city" : [MWSCityModel class],
    };
}
@end
