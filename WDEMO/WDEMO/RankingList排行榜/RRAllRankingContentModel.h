//
//  RRAllRankingContentModel.h
//  NJVideo
//
//  Created by WDEMO on 2021/10/27.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RRAllRankingContentModel : NSObject
//榜单id
@property (nonatomic, copy) NSString *ID;
//榜单名字
@property (nonatomic, copy) NSString *name;
//榜单类型
//SCORE 评分排序
//HOT 热度排序
//SEARCH 搜索排序
//NORMAL 普通排序
@property (nonatomic, copy) NSString *type;
//榜单显示排序规则
@property (nonatomic, copy) NSString *showRules;

@end

NS_ASSUME_NONNULL_END
