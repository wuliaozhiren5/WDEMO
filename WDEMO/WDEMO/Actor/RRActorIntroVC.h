//
//  RRActorIntroVC.h
//  PUClient
//
//  Created by rrtv on 2021/3/9.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
//演员简介
@interface RRActorIntroVC : BaseViewController

- (instancetype)initWithIsHalf:(BOOL)isHalf; 
- (void)show;
- (void)dismiss;
@end


//RRActorIntroVC *vc = [[RRActorIntroVC alloc] initWithIsHalf:YES];
//UIViewController *topVC = [UIViewController topViewController];
//[topVC addChildViewController:vc];
//[vc didMoveToParentViewController:topVC];
//[topVC.view addSubview:vc.view];
//[vc show];
NS_ASSUME_NONNULL_END
