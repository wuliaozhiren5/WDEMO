//
//  RRTalkDetailApi.h
//  PPVideo
//
//  Created by rrtv on 2021/12/16.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKRequest.h"
//话题详情model
#import "RRCommunityTalkModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRTalkDetailApi : YTKRequest

@property (nonatomic, copy) NSString *talkId;

+ (void)requestTalkDetailWithTalkId:(NSString *)talkId
                              block:(void(^)(RRCommunityTalkModel *model, NSError *error))block;
@end

NS_ASSUME_NONNULL_END
