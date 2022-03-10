//
//  MWSTabBarController.m
//  WDEMO
//
//  Created by rrtv on 2022/3/9.
//  Copyright © 2022 wwc. All rights reserved.
//

#import "MWSTabBarController.h"
#import "MWSTabBar.h"
#import "ViewController.h"

@interface MWSTabBarController () <MWSTabBarDelegete>

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) MWSTabBar *tabBar;

@property (nonatomic, assign) CGFloat contentViewHeight;

@property (nonatomic, assign) CGFloat tabBarHeight;

@property (nonatomic, assign) NSInteger selectIndex;

@end

@implementation MWSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarHeight = 66.5;
    
    CGFloat bottom = 0;
    if (@available(iOS 11.0, *)) {
        CGFloat a =  [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom;
        NSLog(@"%f",a);
        bottom = a;
    } else {
        bottom = 0;
    }
    self.tabBarHeight = 66.5 + bottom;
    self.contentViewHeight = self.view.height - self.tabBarHeight;
    [self setupViews];
 
//    self.tabBarHeight = 106.0 / 2.0;

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setupViews {
    [self.view addSubview:self.contentView];
    [self.view addSubview:self.tabBar];

//    self.tabBar.frame = CGRectMake(0, self.contentViewHeight, self.view.width, self.tabBarHeight);
//    self.contentView.frame = CGRectMake(0, 0, self.view.width, self.contentViewHeight);
//    self.tabBar.backgroundColor = [UIColor redColor];
    self.contentView.backgroundColor = [UIColor grayColor];
 
    [self setUpAllChildVc];
    self.tabBar.vcArray = self.childViewControllers;
    self.tabBar.tabBarControllerContentView = self.contentView;
    self.tabBar.selectIndex = self.selectIndex;
}

- (void)setUpAllChildVc {
    
    ViewController *HomeVC = [[ViewController alloc] init];
    HomeVC.title = @"首页";
    [self setUpOneChildVcWithVc:HomeVC Image:@"home_normal" selectedImage:@"home_highlight" title:@"首页"];
    
    UIViewController *FishVC = [[UIViewController alloc] init];
    FishVC.title = @"鱼塘";
    [self setUpOneChildVcWithVc:FishVC Image:@"fish_normal" selectedImage:@"fish_highlight" title:@"鱼塘"];
    
    UIViewController *MessageVC = [[UIViewController alloc] init];
    MessageVC.title = @"消息";
    [self setUpOneChildVcWithVc:MessageVC Image:@"message_normal" selectedImage:@"message_highlight" title:@"消息"];
    
    UIViewController *MineVC = [[UIViewController alloc] init];
    MineVC.title = @"我的";
    [self setUpOneChildVcWithVc:MineVC Image:@"account_normal" selectedImage:@"account_highlight" title:@"我的"]; 
}

- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title {
   
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:Vc];
  
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;

    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    Vc.tabBarItem.selectedImage = mySelectedImage;
//
//    Vc.tabBarItem.title = title;
//
//    Vc.navigationItem.title = title;

    [self addChildViewController:nav]; 
}
 
#pragma mark - MWSTabBarDelegete
- (void)tabBar:(MWSTabBar *)tabBar didSelectItem:(UIButton *)item {
    
}
 
#pragma mark - lazy
- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.contentViewHeight + 13)];
    }
    return _contentView;
}

- (MWSTabBar *)tabBar {
    if (!_tabBar) {
        _tabBar = [[MWSTabBar alloc] initWithFrame:CGRectMake(0, self.contentViewHeight, self.view.width, self.tabBarHeight)];
        _tabBar.backgroundColor = [UIColor clearColor];
        _tabBar.delegete = self;
        
    }
    return _tabBar;
}
@end
