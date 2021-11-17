//
//  RRAllRankingListModel.h
//  NJVideo
//
//  Created by rrtv on 2021/10/28.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RRSeniorCommentsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRAllRankingTagModel : NSObject

@property (nonatomic, copy) NSString *name;
//是否是特殊标签
@property (nonatomic, assign) BOOL isSpecialTag;
@end


@interface RRAllRankingModel : NSObject
//剧集id
@property (nonatomic, copy) NSString *dramaId;
//剧标题
@property (nonatomic, copy) NSString *title;
//排序值
@property (nonatomic, copy) NSString *sortValue;
//简评
@property (nonatomic, copy) NSString *shortDesc;
//是否关注
@property (nonatomic, assign) BOOL favorite;
//排序类型
//SCORE 评分排序
//HOT 热度排序
//SEARCH 搜索排序
//NORMAL 普通排序
@property (nonatomic, copy) NSString *sortType;
//普通标签
@property (nonatomic, copy) NSArray *normalTagList;
//个性化标签
@property (nonatomic, copy) NSArray *specialTagList;
//图片
@property (nonatomic, copy) NSArray<RRSeniorCommentsImageModel *> *imageList;
//封面
@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSArray *tagList;

@end

@interface RRAllRankingListModel : NSObject

@property (nonatomic, assign) BOOL isEnd;

@property (nonatomic, assign) BOOL end;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, copy) NSArray <RRAllRankingModel *> *content;

@end




NS_ASSUME_NONNULL_END
