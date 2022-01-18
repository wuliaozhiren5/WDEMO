//
//  RRTalkDetailSubVC.h
//  PPVideo
//
//  Created by rrtv on 2021/12/14.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRBaseSegmentVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRTalkDetailSubVC : RRBaseSegmentVC
- (instancetype)initWithTitles:(NSArray *)titles viewControllers:(NSArray *)viewControllers selectedIndex:(NSInteger)selectedIndex;

- (UIViewController *)getCurrentVC;
@end

NS_ASSUME_NONNULL_END
