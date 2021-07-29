//
//  MyTabBarController.m
//  WDEMO
//
//  Created by rrtv on 2021/7/29.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "MyTabBarController.h"
#import "BaseNavigationController.h"
#import "BaseTabBarController.h"
#import "ViewController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 添加子控制器
//    UIViewController * VC01 = [[UIViewController alloc]init];
    ViewController * VC01 = [[ViewController alloc]init];
    // 设置标题
    VC01.title = @"精华";
    // 添加子导航控制器
    BaseNavigationController * NavVC01 = [[BaseNavigationController alloc]initWithRootViewController:VC01];
//    // 设置标题
//    NavVC01.tabBarItem.title = @"精华";
    // 设置默认图片
    NavVC01.tabBarItem.image = [UIImage imageNamed:@"ic_bottombar_home_n"];
    // 设置选中图片
    NavVC01.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_bottombar_home_h"];
    NavVC01.view.backgroundColor = [UIColor yellowColor];
    [self addChildViewController:NavVC01];
    
    UIViewController * VC02 = [[UIViewController alloc]init];
    VC02.title = @"新帖";
    BaseNavigationController * NavVC02 = [[BaseNavigationController alloc]initWithRootViewController:VC02];
//    NavVC02.tabBarItem.title = @"新帖";
    NavVC02.tabBarItem.image = [UIImage imageNamed:@"ic_bottombar_kuaikan_n"];
    NavVC02.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_bottombar_kuaikan_h"];
    
    NavVC02.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:NavVC02];
    
    UIViewController * VC03 = [[UIViewController alloc]init];
    VC03.title = @"关注";
    BaseNavigationController * NavVC03 = [[BaseNavigationController alloc]initWithRootViewController:VC03];
//    NavVC03.tabBarItem.title = @"关注";
    NavVC03.tabBarItem.image = [UIImage imageNamed:@"ic_bottombar_kuaikan_n"];
    NavVC03.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_bottombar_kuaikan_h"];
    
    NavVC03.view.backgroundColor = [UIColor blueColor];
    [self addChildViewController:NavVC03];
    
    UIViewController * VC04 = [[UIViewController alloc]init];
    VC04.title = @"我";
    BaseNavigationController * NavVC04 = [[BaseNavigationController alloc]initWithRootViewController:VC04];
//    NavVC04.tabBarItem.title = @"我";
    NavVC04.tabBarItem.image = [UIImage imageNamed:@"ic_bottombar_vip_n"];
    NavVC04.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_bottombar_vip_h"];
    
    NavVC04.view.backgroundColor = [UIColor greenColor];
    [self addChildViewController:NavVC04];
    
}
@end
