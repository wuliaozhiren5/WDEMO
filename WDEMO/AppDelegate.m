//
//  AppDelegate.m
//  WDEMO
//
//  Created by xxx on 2017/11/13.
//  Copyright © 2017年 wwc. All rights reserved.
//

#import "AppDelegate.h"
#import "CJAppUncaughtExceptionHandler.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    UIApplicationShortcutItem * item = [[UIApplicationShortcutItem alloc]initWithType:@"two" localizedTitle:@"标签2" localizedSubtitle:@"222" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove] userInfo:nil];
    
    UIApplicationShortcutItem * itemTwo = [[UIApplicationShortcutItem alloc]initWithType:@"two" localizedTitle:@"标签3" localizedSubtitle:@"333" icon:[UIApplicationShortcutIcon iconWithTemplateImageName:@"jieri"] userInfo:nil];
    
    UIApplicationShortcutItem * itemThird = [[UIApplicationShortcutItem alloc]initWithType:@"two" localizedTitle:@"标签4" localizedSubtitle:@"444" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch] userInfo:nil];
    
    [UIApplication sharedApplication].shortcutItems = @[item, itemTwo, itemThird];
    
    
    //code...
    //调用自定义类中的收集崩溃信息的方法
    [CJAppUncaughtExceptionHandler InstallUncaughtExceptionHandler];
    //code...
    
    return YES;
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler{
    
    //判断先前我们设置的唯一标识
    
    if([shortcutItem.localizedTitle isEqualToString:@"标签1"]){
        
        NSArray *arr = @[@"hello 3D Touch"];
        
        UIActivityViewController *vc = [[UIActivityViewController alloc]initWithActivityItems:arr applicationActivities:nil];
        
        //设置当前的VC 为rootVC
        
        [self.window.rootViewController presentViewController:vc animated:YES completion:^{
            
        }];
        
    }
    
    if ([shortcutItem.localizedTitle isEqual: @"标签2"]) {
        
        // 点击标签2时，显示提示框
        
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"OPPS!" message:@"啦啦啦" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertC addAction:alert];
        
        [self.window.rootViewController presentViewController:alertC animated:YES completion:^{
            
        }];
        
        return;
        
    }
    
}
 

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
