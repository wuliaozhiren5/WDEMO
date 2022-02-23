//
//  RRAllRankingContentModel.m
//  NJVideo
//
//  Created by WDEMO on 2021/10/27.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRAllRankingContentModel.h"

@implementation RRAllRankingContentModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"ID" : @"id",
    };
}

- (NSString *)name {
    return _name ?: @"";
}

- (NSString *)showRules {
    return _showRules ?: @"";

}
@end
