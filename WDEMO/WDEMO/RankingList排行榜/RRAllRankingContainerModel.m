//
//  RRAllRankingContainerModel.m
//  NJVideo
//
//  Created by rrtv on 2021/10/27.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRAllRankingContainerModel.h"

@implementation RRAllRankingContainerModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"ID" : @"id",
    };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"topList" : [RRAllRankingContentModel class], 
    };
}

- (NSString *)name {
    return _name ?: @"";
}
@end

