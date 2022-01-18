//
//  RRTalkContentListApi.h
//  PPVideo
//
//  Created by rrtv on 2021/12/16.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKRequest.h"
#import "RRTalkContentListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRTalkContentListApi : YTKRequest
//话题id
@property (nonatomic, copy) NSString *talkId;
//hot--最热排序  new--最新排序
@property (nonatomic, copy) NSString *orderType;

@property (nonatomic, assign) NSInteger page;
 
@property (nonatomic, assign) NSInteger rows;//10条

+ (void)requestTalkContentListWithTalkId:(NSString *)talkId
                               orderType:(NSString *)orderType
                                    page:(NSInteger)page
                                    rows:(NSInteger)rows
                                   block:(void(^)(RRTalkContentListModel *model, NSError *error))block;

@end

NS_ASSUME_NONNULL_END
