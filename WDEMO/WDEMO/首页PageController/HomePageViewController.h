//
//  HomePageViewController.h
//  WDEMO
//
//  Created by rrtv on 2021/1/11.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "WMPageController.h"
#import "WMCustomizedPageController.h"
#import "THeader.h"

@interface HomePageViewController : WMPageController
//@property (nonatomic, assign) WMMenuViewPosition menuViewPosition; 
@property (nonatomic, nullable, copy) NSArray<UIViewController *> *viewControllers;
/**
 *  菜单栏高度
 *  The menu view's height
 */
@property (nonatomic, assign) CGFloat menuHeight;
@end

