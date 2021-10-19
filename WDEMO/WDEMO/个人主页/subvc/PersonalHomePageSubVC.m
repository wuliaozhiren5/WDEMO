//
//  PersonalHomePageSubVC.m
//  WDEMO
//
//  Created by WDEMO on 2021/10/12.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "PersonalHomePageSubVC.h"

@interface PersonalHomePageSubVC ()

@end

@implementation PersonalHomePageSubVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //无视导航的位置
//    self.navigationController.navigationBar.translucent = YES;
 
} 

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titles.count;
}

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


