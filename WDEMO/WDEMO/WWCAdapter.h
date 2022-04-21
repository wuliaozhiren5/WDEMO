//
//  WWCAdapter.h
//  WDEMO
//
//  Created by rrtv on 2022/4/20.
//  Copyright © 2022 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WWCAdapter : NSObject

//没有用到？
@property (nonatomic, assign, getter=isRequested) BOOL requested;
//加载中
@property (nonatomic, assign, getter=isLoading) BOOL loading;
//refreshing：yes是下拉刷新，NO是上拉刷新
@property (nonatomic, assign, getter=isRefreshing) BOOL refreshing;
//无更多数据
@property (nonatomic, assign, getter=isNoMoreData) BOOL noMoreData;
//无数数据
@property (nonatomic, readonly, getter=isNoData) BOOL noData;

//开始页
@property (nonatomic, assign) NSInteger startPage;
//当前页
@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong, readonly) NSMutableArray *dataArray;

@property (nonatomic, strong, nullable) NSError *error;


//- (void)appendArrayWithDatas:(NSArray<ObjectType> *)datas;
//- (void)insertArrayWithDatas:(NSArray<ObjectType> *)datas;
//- (void)removeAllDatas;
//
//- (void)clean;
@end

NS_ASSUME_NONNULL_END
