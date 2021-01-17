//
//  UIView+RedPoint.m
//  WDEMO
//
//  Created by rrtv on 2021/1/17.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "UIView+RedPoint.h"

@implementation UIView (RedPoint)

//在View上添加红点
+ (void)createRedViewWith:(CGPoint)point bySuperView:(UIView *)view {
    if ([view viewWithTag:999999]) {
        NSLog(@"都特么加上红点了 还想再加？");
        return;
    }
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(point.x, point.y, 6, 6)];
    NSLog(@"%f  %f ", view.center.x, view.center.y);
    view.layer.cornerRadius = 3.0;
    view.layer.masksToBounds = YES;
    redView.backgroundColor = [UIColor redColor];
    redView.tag = 999999;
    [view addSubview:redView];
}

+ (void)createRedViewWithRect:(CGRect)rect bySuperView:(UIView *)view {
    if ([view viewWithTag:999999]) {
        NSLog(@"都特么加上红点了 还想再加？");
        return;
    }
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)];
    NSLog(@"%f  %f ", view.center.x, view.center.y);
    view.layer.cornerRadius = rect.size.height / 2.0f;
    view.layer.masksToBounds = YES;
    redView.backgroundColor = [UIColor redColor];
    redView.tag = 999999;
    [view addSubview:redView];
}

//在view清除
+ (void)cleanRedViewBySuperView:(UIView *)view
{
    UIView *redView = [view viewWithTag:999999];
    [redView removeFromSuperview];
}
@end
