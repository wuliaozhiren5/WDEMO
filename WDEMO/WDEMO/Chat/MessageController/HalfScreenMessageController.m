//
//  HalfScreenMessageController.m
//  PUClient
//
//  Created by rrtv on 2020/9/7.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import "HalfScreenMessageController.h"

@interface HalfScreenMessageController ()
////渐变效果
//@property (nonatomic, strong) CAGradientLayer *gradient;
@end

@implementation HalfScreenMessageController
 
//- (void)viewDidLoad {
//    [super viewDidLoad];
//}
//
//- (void)setupViews {
//    self.isFull = NO;
//    self.messageListCellWidth = HalfScreenChatViewWidth;
//    [super setupViews];
//    [self addTableViewHeaderAndFooter];
//}
//
//- (void)addTableViewHeaderAndFooter {
//    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 54)];
//    self.tableView.tableHeaderView = headerView;
//
//    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 24)];
//    self.tableView.tableFooterView = footerView;
//    [self creatColorView];
//}
//
//- (void)creatColorView {
//    CGFloat startPoint = 60.0 / self.tableView.superview.bounds.size.height;
//    CGFloat endPoint = 120 / self.tableView.superview.bounds.size.height;
//    //渐变背景
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    gradient.frame = self.tableView.superview.bounds;
//    gradient.colors = @[(id)[UIColor clearColor].CGColor,(id)[UIColor blackColor].CGColor];
//    gradient.startPoint = CGPointMake(0, startPoint);
//    gradient.endPoint = CGPointMake(0, endPoint);
//    _gradient = gradient;
//
//    [self addGradient];
//}
//
//- (void)addGradient {
//   self.tableView.superview.layer.mask = _gradient;
//}
//
//- (void)removeGradient {
//   self.tableView.superview.layer.mask = nil;
//}
//
//-(void)setHiddenHeader:(BOOL)hiddenHeader {
//    _hiddenHeader = hiddenHeader;
//    if (!_hiddenHeader) {
//        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 54)];
//        self.tableView.tableHeaderView = headerView;
//        [self addGradient];
//    } else {
//        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
//        self.tableView.tableHeaderView = headerView;
//        [self removeGradient];
//    }
//}

@end
