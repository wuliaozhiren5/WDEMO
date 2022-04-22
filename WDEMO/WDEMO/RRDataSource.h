//
//  RRDataSource.h
//  WDEMO
//
//  Created by rrtv on 2022/4/20.
//  Copyright © 2022 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RRDataSource<ObjectType> : NSObject

@property (nonatomic, assign) BOOL isRequested;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) BOOL isLoading;
@property (nonatomic, assign) BOOL isRefreshing;
@property (nonatomic, assign) BOOL noMoreData;

//更新数量
@property (nonatomic, assign) BOOL calculateRefreshCount;
@property (nonatomic, assign) NSInteger refereshCount;
@property (nonatomic, readonly, getter=isNoData) BOOL noData;

@property (nonatomic, strong, readonly) NSMutableArray<ObjectType> *dataArray;
@property (nonatomic, strong) NSError *error;

- (void)appendDatas:(NSArray<ObjectType> *)datas;
- (void)insertDatas:(NSArray<ObjectType> *)datas;

- (void)cleanData;

@end
