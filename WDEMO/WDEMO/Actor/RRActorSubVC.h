//
//  RRActorSubVC.h
//  PUClient
//
//  Created by rrtv on 2021/3/11.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "WMPageController.h"
//#import "WMCustomizedPageController.h"
#import "THeader.h"
NS_ASSUME_NONNULL_BEGIN

@interface RRActorSubVC : WMPageController
//@property (nonatomic, assign) WMMenuViewPosition menuViewPosition;
@property (nonatomic, nullable, copy) NSArray<UIViewController *> *viewControllers;
/**
 *  菜单栏高度
 *  The menu view's height
 */
@property (nonatomic, assign) CGFloat menuHeight;
@end

NS_ASSUME_NONNULL_END
