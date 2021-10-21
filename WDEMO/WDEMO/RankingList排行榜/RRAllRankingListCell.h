//
//  RRAllRankingListCell.h
//  WDEMO
//
//  Created by rrtv on 2021/10/20.
//  Copyright © 2021 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICollectionViewLeftAlignedLayout.h"
#import "WCollectionViewCell.h"
#import "NewLXHBanner.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRAllRankingListCell : UICollectionViewCell
//封面
@property(nonatomic ,strong)UIImageView *coverImgV;
//追剧按钮
@property(nonatomic ,strong)UIButton *followBtn;
//剧照多图滚动图
@property(nonatomic ,strong)UIView *photoView; //view要改
@property(nonatomic ,strong)NewLXHBanner *banner;

//1，2，3，---------50（top50）背景图
@property(nonatomic ,strong)UIImageView *numberIconImgV;
//1，2，3，---------50（top50）
@property(nonatomic ,strong)UILabel *numberLab;
//标题
@property(nonatomic ,strong)UILabel *titleLab;
//热门榜，口碑榜，热搜榜
@property(nonatomic ,strong)UIImageView *countIconImgV;
//热门榜，口碑榜，热搜榜的数量
@property(nonatomic ,strong)UILabel *countLab;
//标签
@property(nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, copy) NSArray *titleArr;
//评论
@property(nonatomic, strong)UILabel *commentLab;
//线底部的线
@property(nonatomic, strong)UIView *line;

@end

NS_ASSUME_NONNULL_END
