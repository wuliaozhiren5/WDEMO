//
//  RRSeasonSeniorCommentsSubVC.h
//  PUClient
//
//  Created by WDEMO on 2021/3/24.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "BaseViewController.h"
//#import "RRNavScrollViewControllerDelegate.h"

NS_ASSUME_NONNULL_BEGIN
//高级评论 一级页面
@interface RRSeasonSeniorCommentsSubVC : BaseViewController
@property (nonatomic, copy) NSString *seasonId;
@property (nonatomic, assign) NSInteger listCount;
//被限制评论
@property (nonatomic, assign) BOOL commentRestricted;
@property (nonatomic, assign) BOOL isHalf;          //半屏
//@property (nonatomic, weak) UIViewController<RRNavScrollViewControllerDelegate> *fatherVC;
- (instancetype)initWithIsHalf:(BOOL)isHalf;
- (void)show;
- (void)dismiss;
@end

NS_ASSUME_NONNULL_END
