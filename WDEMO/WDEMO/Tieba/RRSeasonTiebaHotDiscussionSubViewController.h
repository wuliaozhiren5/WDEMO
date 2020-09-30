//
//  RRSeasonTiebaHotDiscussionSubViewController.h
//  PUClient
//
//  Created by rrtv on 2020/9/29.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import "BaseViewController.h"
#import "RRNavScrollViewControllerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRSeasonTiebaHotDiscussionSubViewController : BaseViewController

@property (nonatomic, copy) NSString *seasonId;
@property (nonatomic, weak) UIViewController<RRNavScrollViewControllerDelegate> *fatherVC;
@end

NS_ASSUME_NONNULL_END
