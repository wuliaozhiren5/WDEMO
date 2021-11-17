//
//  RRAllRankingListModel.m
//  NJVideo
//
//  Created by rrtv on 2021/10/28.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRAllRankingListModel.h"

@implementation RRAllRankingTagModel

@end

@implementation RRAllRankingModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"imageList" : [RRSeniorCommentsImageModel class],
    };
}

- (NSArray *)tagList {
    if (!_tagList) {
        NSMutableArray *arr = [NSMutableArray array];
        if (_specialTagList && _specialTagList.count > 0) {
            for (NSString *name in _specialTagList) {
                RRAllRankingTagModel *tagModel = [[RRAllRankingTagModel alloc] init];
                tagModel.name = name;
                tagModel.isSpecialTag = YES;
                [arr addObject:tagModel];
            }
        }
        if (_normalTagList && _normalTagList.count > 0) {
            for (NSString *name in _normalTagList) {
                RRAllRankingTagModel *tagModel = [[RRAllRankingTagModel alloc] init];
                tagModel.name = name;
                tagModel.isSpecialTag = NO;
                [arr addObject:tagModel];
            }
        } 
        _tagList = [arr copy];
    }
    return _tagList;
}
@end

@implementation RRAllRankingListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"content" : [RRAllRankingModel class],
    };
}
@end

