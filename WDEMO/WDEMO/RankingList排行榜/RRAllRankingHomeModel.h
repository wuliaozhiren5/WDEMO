//
//  RRAllRankingHomeModel.h
//  NJVideo
//
//  Created by rrtv on 2021/11/26.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RRAllRankingContainerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRAllRankingHomeModel : NSObject

//容器列表
@property (nonatomic, copy) NSArray<RRAllRankingContainerModel *> *containerList;
//榜单容器ID  通过传入的榜单id查询到的容器Id
@property (nonatomic, copy) NSString *containerId;
//榜单ID 传入的榜单ID
@property (nonatomic, copy) NSString *topId;
 
@end

NS_ASSUME_NONNULL_END
