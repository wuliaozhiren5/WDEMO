//
//  PopView.h
//  WDEMO
//
//  Created by aimeiju on 2022/7/21.
//  Copyright © 2022 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PopView : UIView
//点击事件
@property (nonatomic, strong) UIControl *control;
//容器
@property (nonatomic, strong) UIView *container;

- (void)showInView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
