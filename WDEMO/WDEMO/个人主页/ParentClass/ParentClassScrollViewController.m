//
//  ParentClassScrollViewController.m
//  WDEMO
//
//  Created by rrtv on 2021/2/19.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "ParentClassScrollViewController.h"

@interface ParentClassScrollViewController ()<UIGestureRecognizerDelegate>
@end

@implementation ParentClassScrollViewController

-(void)viewWillAppear:(BOOL)animated {
    if(self.delegate && [self.delegate respondsToSelector:@selector(scrollViewChangeTab:)]) {
        [self.delegate scrollViewChangeTab:self.scrollView];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
     
//    CGPoint translatedPoint = [scrollView.panGestureRecognizer translationInView:scrollView];
//    if(translatedPoint.y < 0) {
//        NSLog(@"上滑");
//    }
//    if(translatedPoint.y > 0) {
//        NSLog(@"下滑");
//    }
     
    if (self.delegate && [self.delegate respondsToSelector:@selector(scrollDidScroll:)]) {
        [self.delegate scrollDidScroll:scrollView]; 
    }
    return;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    // 首先判断otherGestureRecognizer是不是系统pop手势
    if ([otherGestureRecognizer.view isKindOfClass:NSClassFromString(@"UILayoutContainerView")]) {
        // 再判断系统手势的state是began还是fail，同时判断scrollView的位置是不是正好在最左边
        if (otherGestureRecognizer.state == UIGestureRecognizerStateBegan && self.scrollView.contentOffset.x == 0) {
            return YES;
        }
    } 
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

