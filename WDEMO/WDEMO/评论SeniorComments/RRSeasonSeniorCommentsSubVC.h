//
//  RRSeasonSeniorCommentsSubVC.h
//  PUClient
//
//  Created by rrtv on 2021/3/24.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "BaseViewController.h"
//#import "RRNavScrollViewControllerDelegate.h"

NS_ASSUME_NONNULL_BEGIN
//高级评论 一级页面
@interface RRSeasonSeniorCommentsSubVC : BaseViewController
@property (nonatomic, copy) NSString *seasonId;
//@property (nonatomic, weak) UIViewController<RRNavScrollViewControllerDelegate> *fatherVC;
- (instancetype)initWithIsHalf:(BOOL)isHalf;
- (void)show;
- (void)dismiss;
@end

NS_ASSUME_NONNULL_END
