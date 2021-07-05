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
//    return YES;
    
    // 首先判断otherGestureRecognizer是不是系统横画ScrollView手势（UIScrollView可以自定义一个，这里没有自定义）
//    if ([otherGestureRecognizer.view isMemberOfClass:NSClassFromString(@"UIScrollView")]) {
    if ([otherGestureRecognizer.view isMemberOfClass:NSClassFromString(@"WMScrollView")]) {
        // 再判断系统手势的state是began还是fail，同时判断scrollView的位置是不是正好在最左边
        if (otherGestureRecognizer.state == UIGestureRecognizerStateBegan) {
            return NO;
        }
    }
    return YES;
}
@end
