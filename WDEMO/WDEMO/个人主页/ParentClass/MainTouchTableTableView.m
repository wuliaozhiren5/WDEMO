//
//  MainTouchTableTableView.m
//  WDEMO
//
//  Created by rrtv on 2021/2/19.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "MainTouchTableTableView.h"

@implementation MainTouchTableTableView
//是否支持多时候触发，返回YES，则可以多个手势一起触发方法，返回NO则为互斥
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
@end
