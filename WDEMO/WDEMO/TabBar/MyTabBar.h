//
//  MyTabBar.h
//  WDEMO
//
//  Created by rrtv on 2021/7/29.
//  Copyright © 2021 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MyTabBar;

//MyTabBar的代理必须实现addButtonClick，以响应中间“+”按钮的点击事件
@protocol MyTabBarDelegate <NSObject>

-(void)addButtonClick:(MyTabBar *)tabBar;

@end

@interface MyTabBar : UITabBar

//指向MyTabBar的代理
@property (nonatomic,weak) id<MyTabBarDelegate> myTabBarDelegate;

@end

NS_ASSUME_NONNULL_END
