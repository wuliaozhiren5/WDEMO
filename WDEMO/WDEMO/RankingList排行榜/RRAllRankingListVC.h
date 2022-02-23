//
//  RRAllRankingListVC.h
//  WDEMO
//
//  Created by WDEMO on 2021/10/20.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "ParentClassScrollViewController.h"
#import "RRAllRankingContentModel.h"
#import "RRAllRankingContainerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRAllRankingListVC : ParentClassScrollViewController
//内容
@property(nonatomic,strong) RRAllRankingContentModel *rankingContentModel;
//容器
@property(nonatomic,strong) RRAllRankingContainerModel *rankingContainerModel;

@end

NS_ASSUME_NONNULL_END

