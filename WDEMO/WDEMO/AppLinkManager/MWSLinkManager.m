//
//  MWSLinkManager.m
//  WDEMO
//
//  Created by rrtv on 2022/6/1.
//  Copyright © 2022 wwc. All rights reserved.
//

#import "MWSLinkManager.h"

static NSString *const kQuerySeparator  = @"&";
static NSString *const kQueryDivider    = @"=";
static NSString *const MWSLinkType    = @"visionminiapp";

typedef NS_ENUM (NSInteger, MWSLinkManagerType) {
    MWSLinkManagerDefault = 0,
    
};

@interface MWSLinkManager ()
@property (nonatomic, copy) MWSLoginStatusBlock loginStatusBlock;
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> *navigationMap;

@end

@implementation MWSLinkManager

+ (instancetype)sharedManager {
    static MWSLinkManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MWSLinkManager alloc] init];
    });
    return manager;
}
//- (NSDictionary *)parameterDictFromUrl:(NSString *)urlStr {
//    NSArray<NSString *> *urlStrArray = [urlStr componentsSeparatedByString:@"?"];
//    if ([urlStrArray count] < 2) {
//        return [NSDictionary dictionary];
//    } else {
//        return [self uq_URLQueryDictionary:urlStrArray[1]];
//    }
//}
//#pragma mark - navigation map
//
//- (NSDictionary *)navigationMap {
//    if (!_navigationMap) {
//        _navigationMap = @{
//        };
//    }
//    return _navigationMap;
//}
//
//
//- (BOOL)goLink:(NSString *)linkUrl toRoot:(BOOL)toRoot isInWebView:(BOOL)isInWebView redirectInfo:(NSDictionary **)redirctInfo clickParamDict:(NSMutableDictionary *)clickParams deeplinkFailUrl:(NSString *)deeplinkFailUrl {
//    DLog(@"ParseLink: %@", linkUrl);
//    NSURL *url = [NSURL URLWithString:linkUrl];
//    NSString *scheme = url.scheme;
//    NSString *host = url.host;
//    if ([scheme isEqualToString:MWSLinkType]) {
//        NSDictionary *paramDict = [self parameterDictFromUrl:url.absoluteString];
//        NSInteger naviType = [self.navigationMap integerValueForKey:host default:MWSLinkManagerDefault];
//        switch (naviType) {
//            case MWSLinkManagerDefault: {
//                return YES;
//            }
//            default: {
//                NSString *redirectUrl = [paramDict stringValueForKey:@"redirectUrl" default:nil];
//                if ([redirectUrl hasPrefix:@"http"]) {
//                    //[self goWebDetail:redirectUrl title:nil isImmersive:NO isH5:NO showBackInmmersive:YES toRoot:toRoot];
//                    return YES;
//                }
//                return NO;
//            }
//
//        }
//    } else if (!isInWebView) {
//        if ([scheme isEqualToString:@"https"] || [scheme isEqualToString:@"http"]) {
//            //[self goWebDetail:url.absoluteString title:nil isImmersive:NO isH5:NO showBackInmmersive:YES toRoot:toRoot];
//            //[clickParams setObject:@"webview" forKey:kRRStatisticsExternResultType];
//        } else {
//            // webView中 没有deeplinkFailUrl，而且webview会自己处理deeplink
//            //deeplink 跳转
//            //[self goBrowserDetail:linkUrl deeplinkFailUrl:deeplinkFailUrl toRoot:toRoot];
//            //[clickParams setObject:@"deeplink" forKey:kRRStatisticsExternResultType];
//        }
//        return YES;
//    }
//    return NO;
//}
//
//
//#pragma mark - navigation Jump
//
//- (void)goLoginToRoot:(BOOL)toRoot {
//    if ([self currentShowLoginPage]) {
//        return;
//    }
//    MWSLoginViewController *next = [[MWSLoginViewController alloc] init];
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (BOOL)currentShowLoginPage {
//    MWSBaseNaigationViewController *navigationController = [self currentTopNavigationController];
//    if (navigationController) {
//        for (UIViewController *vc in navigationController.viewControllers) {
//            if ([vc isMemberOfClass:[MWSLoginViewController class]]) {
//                //正在登录中
//                return YES;
//            }
//        }
//    }
//    return NO;
//}
 
//#pragma mark - public apis
//- (MWSBaseNaigationViewController *)currentTopNavigationController {
//    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    UIViewController *topViewController = (UINavigationController *)appDelegate.window.rootViewController;
//    while (topViewController.presentedViewController)
//        topViewController = topViewController.presentedViewController;
//    if ([topViewController isKindOfClass:[MWSBaseNaigationViewController class]]) {
//        return (MWSBaseNaigationViewController *)topViewController;
//    }
//    return nil;
//}
//
//- (UIViewController *)currentTopController {
//    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    UIViewController *topViewController = (UINavigationController *)appDelegate.window.rootViewController;
//    while (topViewController.presentedViewController)
//        topViewController = topViewController.presentedViewController;
//    if ([topViewController isKindOfClass:[UINavigationController class]]) {
//        return ((UINavigationController *)topViewController).topViewController;
//    }
//    return topViewController;
//}
//
//- (MWSBaseNaigationViewController *)currentBaseNavigationController {
//    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    MWSBaseNaigationViewController *currentNavigation = (MWSBaseNaigationViewController *)appDelegate.window.rootViewController;
//    if (![currentNavigation isKindOfClass:[MWSBaseNaigationViewController class]]) {
//        return nil;
//    }
//    return currentNavigation;
//}
//
//- (NSDictionary *)uq_URLQueryDictionary:(NSString *)string {
//    NSMutableDictionary *mute = @{}.mutableCopy;
//    for (NSString *query in [string componentsSeparatedByString:kQuerySeparator]) {
//        NSArray *components = [query componentsSeparatedByString:kQueryDivider];
//        if (components.count == 0) {
//            continue;
//        }
//        NSString *key = [components[0] stringByRemovingPercentEncoding];
//        id value = nil;
//        if (components.count == 1) {
//            // key with no value
//            value = [NSNull null];
//        }
//        if (components.count == 2) {
//            value = [components[1] stringByRemovingPercentEncoding];
//            // cover case where there is a separator, but no actual value
//            value = [value length] ? value : [NSNull null];
//        }
//        if (components.count > 2) {
//            // invalid - ignore this pair. is this best, though?
//            value = [query substringFromIndex:key.length + 1];
//            value = [value length] ? value : [NSNull null];
//            continue;
//        }
//        mute[key] = value ?: [NSNull null];
//    }
//    return mute.count ? mute.copy : nil;
//}
//
//- (void)goNextViewController:(UIViewController *)next toRoot:(BOOL)toRoot  {
//    if (![NSThread currentThread].isMainThread) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self goNextViewController:next toRoot:toRoot];
//        });
//        return;
//    }
//    if (toRoot) {
//        NSMutableArray *vcs = [self popedRootViewControllers];
//        [vcs addObject:next];
//        [[self currentBaseNavigationController] setViewControllers:vcs animated:YES];
//    } else {
//        [self pushViewController:next animated:YES];
//    }
//}
//
//- (void)gotoHomeViewController {
//    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    MWSBaseNaigationViewController *currentNavigation = (MWSBaseNaigationViewController *)appDelegate.window.rootViewController;
//    if (![currentNavigation isKindOfClass:[MWSBaseNaigationViewController class]]) {
//        return;
//    }
//    MWSTabBarController *tabBarVC = (MWSTabBarController *)[currentNavigation.viewControllers objectOrNilAtIndex:0];
//    if (![tabBarVC isKindOfClass:[MWSTabBarController class]]) {
//        return;
//    }
//    [tabBarVC setSelectedIndex:0];
//    [currentNavigation setViewControllers:[self popedRootViewControllers] animated:YES];
//
//}
//
//- (void)pushViewController:(UIViewController *)next animated:(BOOL)animated {
//    if (![NSThread currentThread].isMainThread) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self pushViewController:next animated:animated];
//        });
//        return;
//    }
////    //不影响之前的逻辑
//    MWSBaseNaigationViewController *navigationController = [self currentTopNavigationController];
//    UIViewController *topVC = navigationController.topViewController;
//    if ([topVC isKindOfClass:[MWSBaseViewController class]]) {
//        MWSBaseViewController *baseVC = (MWSBaseViewController *)topVC;
//        [baseVC pushViewController:next animated:animated];
//    } else {
//        [navigationController pushViewController:next animated:animated];
//    }
//}
//
//- (void)pushViewController:(UIViewController *)next animated:(BOOL)animated loginFinish:(MWSLoginStatusBlock)loginStatusBlock {
//    if (![NSThread currentThread].isMainThread) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self pushViewController:next animated:animated];
//        });
//        return;
//    }
//
//    //不影响之前的逻辑
//    MWSBaseNaigationViewController *navigationController = [self currentTopNavigationController];
//    UIViewController *topVC = navigationController.topViewController;
//    if ([topVC isKindOfClass:[MWSBaseViewController class]]) {
//        MWSBaseViewController *baseVC = (MWSBaseViewController *)topVC;
//        [baseVC pushViewController:next animated:animated];
//    } else {
//        [navigationController pushViewController:next animated:animated];
//    }
//}
//
//
//- (void)popViewControllerAnimated:(BOOL)animated {
//    if (![NSThread currentThread].isMainThread) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self popViewControllerAnimated:animated];
//        });
//        return;
//    }
//    MWSBaseNaigationViewController *navigationController = [self currentTopNavigationController];
//    if (navigationController.childViewControllers.count > 0) {
//        [navigationController popViewControllerAnimated:animated];
//    }
//}
//
//- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
//    if (![viewControllerToPresent isKindOfClass:[UINavigationController class]]) {
//        if ([viewControllerToPresent isKindOfClass:[MWSBaseViewController class]]) {
//            viewControllerToPresent = [[MWSBaseNaigationViewController alloc] initWithRootViewController:viewControllerToPresent];
//            viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
//        }
//    }
//    UIViewController *topViewController = [self currentTopNavigationController];
//    if (!topViewController) {
//        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//        topViewController = (UINavigationController *)appDelegate.window.rootViewController;
//        while (topViewController.presentedViewController)
//            topViewController = topViewController.presentedViewController;
//    }
//    [topViewController presentViewController:viewControllerToPresent animated:flag completion:completion];
//}
//#pragma mark - private apis
//
//- (void)popToRootViewController {
//    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    MWSBaseNaigationViewController *currentNavigation = (MWSBaseNaigationViewController *)appDelegate.window.rootViewController;
//    if (![currentNavigation isKindOfClass:[MWSBaseNaigationViewController class]]) {
//        return;
//    }
//    [currentNavigation setViewControllers:[self popedRootViewControllers]];
//}
//
//- (NSMutableArray *)popedRootViewControllers {
//    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    MWSBaseNaigationViewController *currentNavigation = (MWSBaseNaigationViewController *)appDelegate.window.rootViewController;
//    if (![currentNavigation isKindOfClass:[MWSBaseNaigationViewController class]]) {
//        return nil;
//    }
//    UIViewController *topVC = currentNavigation.topViewController;
//    [self dismissViewControllerTo:topVC completion:nil];
//    return @[currentNavigation.viewControllers[0]].mutableCopy;
//}
//
//- (void)dismissViewControllerTo:(UIViewController *)topVC completion:(void (^__nullable)(void))completion {
//    if (!topVC.presentedViewController) {
//        return;
//    }
//    [self dismissViewControllerTo:topVC.presentedViewController completion:^{
//        [topVC.presentedViewController dismissViewControllerAnimated:YES completion:^{
//            if (completion) {
//                completion();
//            }
//        }];
//    }];
//}



@end
