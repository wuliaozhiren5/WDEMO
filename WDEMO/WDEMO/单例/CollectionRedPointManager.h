//
//  CollectionRedPointManager.h
//  WDEMO
//
//  Created by WDEMO on 2020/11/30.
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


////追剧小红点
//- (void)kvoUserSubscriptionRedPointDisplay {
//    @weakify(self);
//    [RACObserve([RRUserSubscriptionRedPointDisplayManager sharedInstance], isShowRedPoint) subscribeNext:^(id x) {
//        @strongify(self);
//        if (x) {
//            UIView *entryView = [self viewWithTag:10086];
//            if ([RRUserSubscriptionRedPointDisplayManager sharedInstance].isShowRedPoint) {
//                CGFloat x = 25;
//                CGFloat y = 10;
//                [RRMJTool createRedTextViewWith:CGPointMake(x, y) bySuperView:entryView];
//            } else {
//                [RRMJTool cleanRedViewBySuperView:entryView];
//            }
//        }
//    }];
//}
