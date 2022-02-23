//
//  RRDramaCommentSubVC.h
//  NJVideo
//
//  Created by WDEMO on 2021/7/31.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "BaseViewController.h"
//#import "RRNavScrollViewControllerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRDramaCommentSubVC : BaseViewController
@property (nonatomic, copy) NSString *seasonId;
@property (nonatomic, assign) NSInteger listCount;
//被限制评论
@property (nonatomic, assign) BOOL commentRestricted;
@property (nonatomic, assign) BOOL isHalf;          //半屏
//@property (nonatomic, weak) UIViewController<RRNavScrollViewControllerDelegate> *fatherVC;
@property (nonatomic, weak) UIViewController *fatherVC;

- (void)refreshWithId:(NSString *)seasonId;
@end

NS_ASSUME_NONNULL_END




