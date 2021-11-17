//
//  RRAllRankingContainerModel.h
//  NJVideo
//
//  Created by rrtv on 2021/10/27.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RRAllRankingContentModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRAllRankingContainerModel : NSObject
//榜单合集容器id
@property (nonatomic, copy) NSString *ID;
//榜单合集容器名称
@property (nonatomic, copy) NSString *name;
//包含榜单内容
@property (nonatomic, copy) NSArray<RRAllRankingContentModel *> *topList;

@end

NS_ASSUME_NONNULL_END
