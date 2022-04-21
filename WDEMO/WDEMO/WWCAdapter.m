//
//  WWCAdapter.m
//  WDEMO
//
//  Created by rrtv on 2022/4/20.
//  Copyright © 2022 wwc. All rights reserved.
//

#import "WWCAdapter.h"
@interface WWCAdapter ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation WWCAdapter

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.startPage = 1;
    }
    return self;
}

- (BOOL)isNoData {
//    return self.dataArray.count == 0 && self.noMoreData;
    return self.dataArray.count == 0;
}

- (void)appendArrayWithDatas:(NSArray *)datas {
    self.noMoreData = datas.count == 0;
    NSArray *redundantArray = nil;
    if (!self.isRefreshing) {
        redundantArray = [self redundantWithOriginalArray:datas];
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

- (void)insertArrayWithDatas:(NSArray *)datas {
    NSArray *redundantArray = [self redundantWithOriginalArray:datas];
    if (redundantArray.count) {
        NSMutableArray *arrayToInsert = [datas mutableCopy];
        [arrayToInsert removeObjectsInArray:redundantArray];
        [self.dataArray insertObjects:arrayToInsert
                            atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, arrayToInsert.count)]];
        return;
    }
    [self.dataArray insertObjects:datas
                        atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, datas.count)]];
}

- (void)removeAllDatas {
    [self.dataArray removeAllObjects];
    self.error = nil;
}

- (NSArray *)redundantWithOriginalArray:(NSArray *)originalArray {
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

- (void)clean {
    _requested = NO;
    _dataArray = nil;
    _page = 0;
    _loading = NO;
    _refreshing = NO;
    _noMoreData = NO;
}

@end

