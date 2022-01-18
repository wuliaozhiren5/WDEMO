//
//  RRTalkContentListApi.m
//  PPVideo
//
//  Created by rrtv on 2021/12/16.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRTalkContentListApi.h"

@implementation RRTalkContentListApi

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (NSString*)requestUrl{
    return @"/community/talk/content";//话题讨论区查询
}

- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}

- (NSInteger)cacheTimeInSeconds{
    return CacheTime;
}

- (id)requestArgument{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"talkId"] = _talkId;
    dict[@"orderType"] = _orderType;
    dict[@"page"] = @(_page);
    dict[@"rows"] = @(_rows);
    return dict;
}

+ (void)requestTalkContentListWithTalkId:(NSString *)talkId
                               orderType:(NSString *)orderType
                                    page:(NSInteger)page
                                    rows:(NSInteger)rows
                                   block:(void(^)(RRTalkContentListModel *model, NSError *error))block {
     
    RRTalkContentListApi *api = [[RRTalkContentListApi alloc] init];
    api.talkId = talkId;
    api.orderType = orderType;
    api.page = page;
    api.rows = rows;
    [api startWithCompletionBlock:^(RRJsonModel *result, NSError *error) {
        if (error) {
            block(nil, error);
            return;
        }
        
        RRTalkContentListModel *model = [RRTalkContentListModel modelWithJSON:result.data];
        block(model,nil);
     }];
}

@end
