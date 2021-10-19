//
//  RRActorSubVC.m
//  PUClient
//
//  Created by WDEMO on 2021/3/11.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRActorSubVC.h"

@interface RRActorSubVC ()

@end

@implementation RRActorSubVC
 
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBar.translucent = YES;

    // Do any additional setup after loading the view.
//    if (self.menuViewStyle == WMMenuViewStyleTriangle) {
//        [self.view addSubview:self.redView];
//    }
}
//
//- (void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
//    self.redView.frame = CGRectMake(0, CGRectGetMaxY(self.menuView.frame), self.view.frame.size.width, 2.0);
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
//    switch (self.menuViewStyle) {
//        case WMMenuViewStyleFlood: return 3;
//        case WMMenuViewStyleSegmented: return 3;
//        default: return 10;
//    }
//}
//
//- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
//    switch (index % 3) {
//        case 0: return @"LIST";
//        case 1: return @"INTRODUCTION";
//        case 2: return @"IMAGES";
//    }
//    return @"NONE";
//}
//
//- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
////    switch (index % 3) {
////        case 0: return [[WMTableViewController alloc] init];
////        case 1: return [[WMViewController alloc] init];
////        case 2: return [[WMCollectionViewController alloc] init];
////    }
//    return [[UIViewController alloc] init];
//}
//
//- (CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index {
//    CGFloat width = [super menuView:menu widthForItemAtIndex:index];
//    return width + 20;
//}
//
//- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
//    if (self.menuViewPosition == WMMenuViewPositionBottom) {
//        menuView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
//        return CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44);
//    }
//    CGFloat leftMargin = self.showOnNavigationBar ? 50 : 0;
//    CGFloat originY = self.showOnNavigationBar ? 0 : CGRectGetMaxY(self.navigationController.navigationBar.frame);
//    return CGRectMake(leftMargin, originY, self.view.frame.size.width - 2*leftMargin, 44);
//}
//
//- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
//    if (self.menuViewPosition == WMMenuViewPositionBottom) {
//        return CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 44);
//    }
//    CGFloat originY = CGRectGetMaxY([self pageController:pageController preferredFrameForMenuView:self.menuView]);
//    if (self.menuViewStyle == WMMenuViewStyleTriangle) {
//        originY += self.redView.frame.size.height;
//    }
//    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height - originY);
//}
//

//titles
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titles.count;
}

//viewControllers
- (__kindof UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    return self.viewControllers[index];
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}

//内容
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    
    CGFloat top = 0;
    if (@available(iOS 11.0, *)) {
        CGFloat a =  [[UIApplication sharedApplication] delegate].window.safeAreaInsets.top;
        NSLog(@"%f",a);
        top = a;
    } else {
        top = 0;
    }
    
    CGFloat menuHeight = self.menuHeight > 0 ? self.menuHeight : 44;
    return CGRectMake(0, menuHeight, Screen_Width, Screen_Height - top - 44 - menuHeight - 1); //64 = 导航栏 + 状态栏
}

//菜单，头
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    CGFloat menuHeight = self.menuHeight > 0 ? self.menuHeight : 44;
    return CGRectMake(0, 0, Screen_Width, menuHeight);
}
@end


/*
 
 iOS判断刘海屏幕机型
 https://www.jianshu.com/p/392489853d92

 
if (@available(iOS 11.0, *)) {
        CGFloat a =  [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom;
        NSLog(@"%f",a);
    } else {
        // Fallback on earlier versions
    }
 
 
 #define IPHONE_X \
 ({BOOL isPhoneX = NO;\
 if (@available(iOS 11.0, *)) {\
 isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
 }\
 (isPhoneX);})
 
 
 
 
 #define isIphoneX ({\
 BOOL isPhoneX = NO;\
 if (@available(iOS 11.0, *)) {\
     if (!UIEdgeInsetsEqualToEdgeInsets([UIApplication sharedApplication].delegate.window.safeAreaInsets, UIEdgeInsetsZero)) {\
     isPhoneX = YES;\
     }\
 }\
 isPhoneX;\
 })
 
 
 
 
 func isiPhoneXScreen() -> Bool {
         guard #available(iOS 11.0, *) else {
             return false
         }
  
         return UIApplication.shared.windows[0].safeAreaInsets != UIEdgeInsets.zero
 }

*/

 
