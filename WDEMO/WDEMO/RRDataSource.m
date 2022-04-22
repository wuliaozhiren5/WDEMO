//
//  RRDataSource.m
//  WDEMO
//
//  Created by rrtv on 2022/4/20.
//  Copyright © 2022 wwc. All rights reserved.
//

#import "RRDataSource.h"

@interface RRDataSource () {
    NSMutableArray *_dataArray;
}

@end

@implementation RRDataSource

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (BOOL)isNoData {
    return self.dataArray.count == 0 && self.noMoreData;
}

- (void)appendDatas:(NSArray *)datas {
    self.noMoreData = datas.count == 0;
    NSArray *redundantArray = nil;
    if ((self.calculateRefreshCount && self.isRefreshing) || !self.isRefreshing) {
        redundantArray = [self redundantArrayWithOriginalArray:datas];
        if (self.calculateRefreshCount && self.isRefreshing) {
            self.refereshCount = datas.count - redundantArray.count;
        }
    }
    if (self.isRefreshing) {
        [self.dataArray removeAllObjects];
    } else {
        if (redundantArray.count) {
            NSMutableArray *arrayToInset = [datas mutableCopy];
            [arrayToInset removeObjectsInArray:redundantArray];
            [self.dataArray addObjectsFromArray:arrayToInset];
            return;
        }
    }
    [self.dataArray addObjectsFromArray:datas];
    
}

- (void)insertDatas:(NSArray *)datas {
    NSArray *redundantArray = [self redundantArrayWithOriginalArray:datas];
    if (self.calculateRefreshCount) {
        self.refereshCount = datas.count - redundantArray.count;
    }
    if (redundantArray.count) {
        NSMutableArray *arrayToInsert = [datas mutableCopy];
        [arrayToInsert removeObjectsInArray:redundantArray];
        [self.dataArray insertObjects:arrayToInsert atIndex:0];
        return;
    }
    [self.dataArray insertObjects:datas atIndex:0];
}

- (NSArray *)redundantArrayWithOriginalArray:(NSArray *)originalArray {
    if (originalArray.count == 0 || self.dataArray.count == 0) {
        return nil;
    }
    NSMutableArray *redundantArray = [NSMutableArray array];
    [originalArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.dataArray enumerateObjectsUsingBlock:^(id  _Nonnull existedObj, NSUInteger subidx, BOOL * _Nonnull substop) {
            if ([obj isEqual:existedObj]) {
                [redundantArray addObject:obj];
                *substop = YES;
            }
        }];
    }];
    return [redundantArray copy];
}

- (void)cleanData {
    _isRequested = NO;
    _dataArray = nil;
    _page = 0;
    _isLoading = NO;
    _isRefreshing = NO;
    _noMoreData = NO;
    _refereshCount = 0;
}

@end
