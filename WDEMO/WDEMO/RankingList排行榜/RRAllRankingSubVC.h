//
//  RRAllRankingSubVC.h
//  WDEMO
//
//  Created by WDEMO on 2021/10/19.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "WMPageController.h"
//#import "WMCustomizedPageController.h"
#import "THeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRAllRankingSubVC : WMPageController
//@property (nonatomic, assign) WMMenuViewPosition menuViewPosition;
@property (nonatomic, nullable, copy) NSArray<UIViewController *> *viewControllers;
/**
 *  菜单栏高度
 *  The menu view's height
 */
@property (nonatomic, assign) CGFloat menuHeight;
@end

NS_ASSUME_NONNULL_END
