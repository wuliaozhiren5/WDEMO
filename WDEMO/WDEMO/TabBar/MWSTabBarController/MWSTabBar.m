//
//  MWSTabBar.m
//  WDEMO
//
//  Created by rrtv on 2022/3/9.
//  Copyright © 2022 wwc. All rights reserved.
//

#import "MWSTabBar.h"
#import "MWSTabBarButton.h"

@interface MWSTabBar ()

@property (nonatomic, strong) UIView *topView;

@property (nonatomic, strong) UIView *middleView;

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, assign) CGFloat topViewHeight;
 
@property (nonatomic, assign) CGFloat middleViewHeight;

@property (nonatomic, assign) CGFloat bottomViewHeight;

@end

@implementation MWSTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.topViewHeight =  13;
        CGFloat bottom = 0;
        if (@available(iOS 11.0, *)) {
            CGFloat a =  [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom;
            NSLog(@"%f",a);
            bottom = a;
        } else {
            bottom = 0;
        }
        self.bottomViewHeight = bottom;
        self.middleViewHeight = frame.size.height - self.topViewHeight - self.bottomViewHeight;
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self addSubview:self.topView];
    [self addSubview:self.middleView];
    [self addSubview:self.bottomView];

    self.topView.backgroundColor = [UIColor clearColor];
    self.middleView.backgroundColor = [UIColor greenColor];
    self.bottomView.backgroundColor = [UIColor blueColor];
  
}

- (void )clickTabBtn:(UIButton *)btn {
    NSLog(@"%zi",btn.tag);
    self.selectIndex = btn.tag;
    if (self.delegete && [self.delegete respondsToSelector:@selector(tabBar:didSelectItem:)]) {
        [self.delegete tabBar:self didSelectItem:btn];
    }
}

- (void)setVcArray:(NSArray *)vcArray {
    if (!(vcArray.count > 0)) {
        return;
    }
    _vcArray = vcArray;
    NSInteger n = vcArray.count;
    CGFloat w = self.frame.size.width / n;
    CGFloat h = self.topViewHeight + self.middleViewHeight;
    for (NSInteger i = 0; i < n; i++) {
        UIViewController *vc = vcArray[i];
        MWSTabBarButton *btn = [[MWSTabBarButton alloc] initWithFrame:CGRectMake(w * i, 0, w, h)];
        btn.tag = i;
        [btn addTarget:self action:@selector(clickTabBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:vc.title forState:UIControlStateNormal];
        btn.selectedImage = vc.tabBarItem.selectedImage;
        btn.normalImage = vc.tabBarItem.image;
        [self addSubview:btn];
       
    }
}

- (void)setSelectIndex:(NSInteger)selectIndex {
    if (selectIndex < 0 && self.vcArray.count <= selectIndex) {
        return;
    }
    _selectIndex = selectIndex;
    [self.tabBarControllerContentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIViewController *vc = self.vcArray[selectIndex];
    [self.tabBarControllerContentView addSubview:vc.view];
    vc.view.frame = self.tabBarControllerContentView.frame;
}

- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.topViewHeight)];
    }
    return _topView;
}

- (UIView *)middleView {
    if (!_middleView) {
        _middleView = [[UIView alloc] initWithFrame:CGRectMake(0, self.topViewHeight, self.width, self.middleViewHeight)];
    }
    return _middleView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.topViewHeight + self.middleViewHeight, self.width, self.bottomViewHeight)];
    }
    return _bottomView;
}

//- (NSArray *)tabBtnArray {
//    if (!_tabBtnArray) {
//        _tabBtnArray = [NSArray array];
//    }
//    return _tabBtnArray;
//}
@end
