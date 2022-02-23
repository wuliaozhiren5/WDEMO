//
//  RRAllRankingHomeModel.m
//  NJVideo
//
//  Created by WDEMO on 2021/11/26.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRAllRankingHomeModel.h"

@implementation RRAllRankingHomeModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"containerList" : [RRAllRankingContainerModel class],
    };
}

@end
