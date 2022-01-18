//
//  RRTalkDetailApi.m
//  PPVideo
//
//  Created by rrtv on 2021/12/16.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRTalkDetailApi.h"

@implementation RRTalkDetailApi

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (NSString*)requestUrl{
    return @"/community/talk/detail";//话题详情页
}

- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}

- (NSInteger)cacheTimeInSeconds{
    return CacheTime;
}

- (id)requestArgument{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"id"] = _talkId;  
    return dict;
}

+ (void)requestTalkDetailWithTalkId:(NSString *)talkId
                              block:(void(^)(RRCommunityTalkModel *model, NSError *error))block {
    RRTalkDetailApi *api = [[RRTalkDetailApi alloc] init];
    api.talkId = talkId;
    [api startWithCompletionBlock:^(RRJsonModel *result, NSError *error) {
        if (error) {
            block(nil, error);
            return;
        }
        RRCommunityTalkModel *model = [RRCommunityTalkModel modelWithJSON:result.data];
        block(model, nil);
    }];
}


//+ (void)requestAllRankingListWithTopId:(NSString *)topId
//                                  page:(NSInteger)page
//                              pageSize:(NSInteger)pageSize
//                                 block:(void(^)(RRAllRankingListModel *model, NSError *error))block {
////    RRAllRankingListApi *api = [[RRAllRankingListApi alloc] init];
////    api.topId = topId;
////    api.page = page;
////    api.pageSize = pageSize;
////    [api startWithCompletionBlock:^(RRJsonModel *result, NSError *error) {
////        if (error) {
////            block(nil, error);
////            return;
////        }
////        RRAllRankingListModel *model = [RRAllRankingListModel modelWithJSON:result.data];
////        block(model, nil);
////    }];
//}

@end
