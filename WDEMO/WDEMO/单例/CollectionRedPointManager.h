//
//  CollectionRedPointManager.h
//  WDEMO
//
//  Created by rrtv on 2020/11/30.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionRedPointManager : NSObject
//是否显示小红点
@property (nonatomic, assign) BOOL isShowRedPoint;
//单例
+ (instancetype)sharedInstance;
//清除小红点
- (void)cleanRedPoint;
//显示小红点
- (void)showRedPoint;
@end

NS_ASSUME_NONNULL_END
