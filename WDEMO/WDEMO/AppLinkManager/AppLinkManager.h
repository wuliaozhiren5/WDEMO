//
//  AppLinkManager.h
//  WDEMO
//
//  Created by rrtv on 2022/6/1.
//  Copyright © 2022 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppLinkManager : NSObject
+ (instancetype)sharedManager;

//@property (nonatomic, readonly) MWSBaseNaigationViewController *currentTopNavigationController;
//@property (nonatomic, readonly) UIViewController *currentTopController;
//
//- (void)pushViewController:(UIViewController *)next animated:(BOOL)animated;
//
////登录
//- (void)goLoginToRoot:(BOOL)toRoot;
//
//- (void)gotoHomeViewController;
@end

NS_ASSUME_NONNULL_END
