//
//  LBTabBarController.m
//  XianYu
//
//  Created by li  bo on 16/5/28.
//  Copyright © 2016年 li  bo. All rights reserved.
//

#import "LBTabBarController.h"
#import "LBNavigationController.h"
#import "ViewController.h"
#import "LBTabBar.h"
#import "UIImage+Image.h"
#import "LBpostViewController.h"

@interface LBTabBarController ()<UITabBarControllerDelegate, LBTabBarDelegate>

@property(nonatomic, strong)UIImageView *tabBarBackgroundImgV;

@end

@implementation LBTabBarController

#pragma mark - 第一次使用当前类的时候对设置UITabBarItem的主题
+ (void)initialize
{
    //    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    //
    //    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
    //    dictNormal[NSForegroundColorAttributeName] = [UIColor blueColor];
    //    dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    //
    //    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    //    dictSelected[NSForegroundColorAttributeName] = [UIColor redColor];
    //    dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    //
    //    [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    //    [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
}

//- (void)viewDidLayoutSubviews{
//    [super viewDidLayoutSubviews];
//    CGRect frame = self.tabBar.frame;
//    frame.size.height = self.tabBar.frame.size.height + 50;
//    frame.origin.y = self.view.frame.size.height - frame.size.height;
//    self.tabBar.frame = frame;
//}
 
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpAllChildVc];
    
    //创建自己的tabbar，然后用kvc将自己的tabbar和系统的tabBar替换下
    LBTabBar *tabbar = [[LBTabBar alloc] init];
    tabbar.myDelegate = self;
    //kvc实质是修改了系统的_tabBar
    [self setValue:tabbar forKeyPath:@"tabBar"];
    
    self.delegate = self;
    
    //    [[UITabBar appearance] setTintColor:[UIColor redColor]];
 
    
    //解决ios 13 UITabBarItem选中时的文字颜色，有时有效，有时无效
    if (@available(iOS 13.0, *)) {
            // iOS 13以上
            self.tabBar.tintColor = [UIColor redColor];
            self.tabBar.unselectedItemTintColor = [UIColor blackColor];
            UITabBarItem *item = [UITabBarItem appearance];
            [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
            [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateSelected];
        } else {
            // iOS 13以下
            UITabBarItem *item = [UITabBarItem appearance];
            [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
            [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
        }
    
    //UITabBar添加背景图片
    //[[UITabBar appearance] setBackgroundImage:[[UIImage imageNamed:@“tabbarBack”] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];//此种方法改变背景,但是图片变短重复铺
    UIImageView *ima = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_bg_1"]];
    //tabbar高度：49 83
    //判断刘海屏
    ima.frame = CGRectMake(0,0,self.view.frame.size.width, 49);
    BOOL isPhoneX = NO;
    if (@available(iOS 11.0, *)) {
        isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;
    }
    if (isPhoneX) {
        ima.frame = CGRectMake(0,0,self.view.frame.size.width, 83);
    }

//    ima.frame = CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height);
    ima.contentMode = UIViewContentModeScaleAspectFill;
//    ima.backgroundColor = [UIColor redColor];
//    self.tabBar.opaque = YES;
    [self.tabBar insertSubview:ima atIndex:0];

    self.tabBarBackgroundImgV = ima;
    
    //去黑线
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
//    [UITabBar appearance].layer.borderWidth = 0.0f;
//    [UITabBar appearance].clipsToBounds = YES;
}

#pragma mark - UITabBarControllerDelegate
//这个是UITabBarController的代理方法
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    //    // 判断哪个界面要需要再次点击刷新，这里以第一个VC为例
    //    if ([tabBarController.selectedViewController isEqual:[tabBarController.viewControllers firstObject]]) {
    // 判断再次选中的是否为当前的控制器
    if ([viewController isEqual:tabBarController.selectedViewController]) {
        // 执行操作
        NSLog(@"刷新界面");
        
        // 再次点击tab
        UINavigationController *selectVc = [self.viewControllers objectAtIndex:self.selectedIndex];
        if ([selectVc.topViewController respondsToSelector:@selector(doubleClickTab)]) {
            [selectVc.topViewController performSelectorOnMainThread:@selector(doubleClickTab) withObject:nil waitUntilDone:NO];
        }
        
        return NO;
    }
    //    }
    
    return YES;
    
}

#pragma mark - ------------------------------------------------------------------
#pragma mark - 初始化tabBar上除了中间按钮之外所有的按钮

- (void)setUpAllChildVc
{
    
//    UIViewController *HomeVC = [[UIViewController alloc] init];
//    [self setUpOneChildVcWithVc:HomeVC Image:@"home_normal" selectedImage:@"home_highlight" title:@"首页"];
//
    ViewController *HomeVC = [[ViewController alloc] init];
    [self setUpOneChildVcWithVc:HomeVC Image:@"home_normal" selectedImage:@"home_highlight" title:@"首页"];
    
//    ViewController *HomeVC = [[ViewController alloc] init];
//    [self setUpOneChildVcWithVc:HomeVC Image:@"home_normal" selectedImage:@"home_highlight" title:@"首页"];
    
    UIViewController *FishVC = [[UIViewController alloc] init];
    [self setUpOneChildVcWithVc:FishVC Image:@"fish_normal" selectedImage:@"fish_highlight" title:@"鱼塘"];
    
    UIViewController *MessageVC = [[UIViewController alloc] init];
    [self setUpOneChildVcWithVc:MessageVC Image:@"message_normal" selectedImage:@"message_highlight" title:@"消息"];
    
    UIViewController *MineVC = [[UIViewController alloc] init];
    [self setUpOneChildVcWithVc:MineVC Image:@"account_normal" selectedImage:@"account_highlight" title:@"我的"];
    
    
}

#pragma mark - 初始化设置tabBar上面单个按钮的方法

/**
 *  @author li bo, 16/05/10
 *
 *  设置单个tabBarButton
 *
 *  @param Vc            每一个按钮对应的控制器
 *  @param image         每一个按钮对应的普通状态下图片
 *  @param selectedImage 每一个按钮对应的选中状态下的图片
 *  @param title         每一个按钮对应的标题
 */
- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    LBNavigationController *nav = [[LBNavigationController alloc] initWithRootViewController:Vc];

    Vc.view.backgroundColor = [self randomColor];
//    Vc.view.backgroundColor = [UIColor redColor];

    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    Vc.tabBarItem.selectedImage = mySelectedImage;
    
    Vc.tabBarItem.title = title;
    
    Vc.navigationItem.title = title;
    
    [self addChildViewController:nav];
    
}

#pragma mark - ------------------------------------------------------------------
#pragma mark - LBTabBarDelegate
//点击中间按钮的代理方法
- (void)tabBarPlusBtnClick:(LBTabBar *)tabBar
{
    
    LBpostViewController *plusVC = [[LBpostViewController alloc] init];
    plusVC.view.backgroundColor = [self randomColor];
    
    LBNavigationController *navVc = [[LBNavigationController alloc] initWithRootViewController:plusVC];
    
    [self presentViewController:navVc animated:YES completion:nil];
    
}

- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
//    return;
    NSInteger index = [self.tabBar.items indexOfObject:item];
    //执行动画
    NSMutableArray *arry = [NSMutableArray array];
    for (UIView *btn in self.tabBar.subviews) {
        if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [arry addObject:btn];
        }
    }
    //添加动画　　　　 //---将下面的代码块直接拷贝到此即可---
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //速度控制函数，控制动画运行的节奏
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 0.2;       //执行时间
    animation.repeatCount = 1;      //执行次数
    animation.autoreverses = YES;    //完成动画后会回到执行动画之前的状态
    animation.fromValue = [NSNumber numberWithFloat:0.7];   //初始伸缩倍数
    animation.toValue = [NSNumber numberWithFloat:1.3];     //结束伸缩倍数
    [[arry[index] layer] addAnimation:animation forKey:nil];

//    //？？？
//    for (UIViewController *vc in self.viewControllers) {
//
//            UIImage *myImage = [UIImage imageNamed:@"ic_lottery_n"];
//            myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//
//            //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
//        vc.tabBarItem.image = myImage;
//
//            UIImage *mySelectedImage = [UIImage imageNamed:@"ic_lottery_h"];
//            mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//
//
//        vc.tabBarItem.selectedImage = mySelectedImage;
//
//    }
    
    
    
//    NSInteger n = self.viewControllers.count;
//    NSArray *nn = @[@"ic_lottery_n",@"home_normal",@"home_normal",@"home_normal"];
//    NSArray *hh = @[@"ic_lottery_h",@"home_normal",@"home_normal",@"home_normal"];
//    for (NSInteger i = 0; i < n; i++) {
//
//            UIViewController *vc = self.viewControllers[i];
//
//            UIImage *myImage = [UIImage imageNamed:nn[i]];
//            myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//
//            //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
//        vc.tabBarItem.image = myImage;
//
//        UIImage *mySelectedImage = [UIImage imageNamed:hh[i]];
//            mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//
//
//        vc.tabBarItem.selectedImage = mySelectedImage;
//
//    }

    if (index == 1) {
        self.tabBarBackgroundImgV.image = [UIImage imageNamed:@"tabbar_bg_2"];
    } else {
        self.tabBarBackgroundImgV.image = [UIImage imageNamed:@"tabbar_bg_1"];
    }
    
}
@end
