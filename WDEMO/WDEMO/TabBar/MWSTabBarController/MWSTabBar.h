//
//  MWSTabBar.h
//  WDEMO
//
//  Created by rrtv on 2022/3/9.
//  Copyright © 2022 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MWSTabBarDelegete;

@interface MWSTabBar : UIView

@property (nonatomic, weak) id<MWSTabBarDelegete> delegete;

@property (nonatomic, strong) NSArray *vcArray;

@property (nonatomic, weak) UIView *tabBarControllerContentView;

@property (nonatomic, assign) NSInteger selectIndex;

@end

@protocol MWSTabBarDelegete <NSObject>

- (void)tabBar:(MWSTabBar *)tabBar didSelectItem:(UIButton *)item;

@end
NS_ASSUME_NONNULL_END
