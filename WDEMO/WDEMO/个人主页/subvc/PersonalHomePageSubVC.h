//
//  PersonalHomePageSubVC.h
//  WDEMO
//
//  Created by rrtv on 2021/10/12.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "WMPageController.h"
#import "WMCustomizedPageController.h"
#import "THeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface PersonalHomePageSubVC : WMPageController

//@property (nonatomic, assign) WMMenuViewPosition menuViewPosition;
@property (nonatomic, nullable, copy) NSArray<UIViewController *> *viewControllers;
/**
 *  菜单栏高度
 *  The menu view's height
 */
@property (nonatomic, assign) CGFloat menuHeight;

@end

NS_ASSUME_NONNULL_END
