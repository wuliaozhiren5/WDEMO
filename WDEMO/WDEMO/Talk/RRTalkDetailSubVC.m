//
//  RRTalkDetailSubVC.m
//  PPVideo
//
//  Created by rrtv on 2021/12/14.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRTalkDetailSubVC.h"

@interface RRTalkDetailSubVC ()
@property (nonatomic, copy) NSArray *subTitles;
@property (nonatomic, copy) NSArray *subViewControllers;
@property (nonatomic, assign) NSInteger subSelectedIndex;
@property (nonatomic, assign) NSInteger currentSelectedIndex;
@property (nonatomic, strong) UIViewController *currentViewController;
@end

@implementation RRTalkDetailSubVC

- (instancetype)initWithTitles:(NSArray *)titles viewControllers:(NSArray *)viewControllers selectedIndex:(NSInteger)selectedIndex{
    self = [super init];
    if (self) {
        self.subTitles = titles;
        self.subViewControllers = viewControllers;
        self.subSelectedIndex = selectedIndex;
    }
    return self;
}

- (void)initView {
    [super initView];
    self.segmentView.commonColor = kCOLOR_85888F;
    self.segmentView.selectedColor = kCOLOR_dynamicProvider_222222_E5E7EB;
    self.segmentView.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_1F2126;
    self.segmentView.defaultFont = RR_COMMONFONT(17);
    self.segmentView.selectedFont = RR_BOLDFONT(17);
    self.segmentView.lineViewBottom = 8;
    self.segmentView.titleViewTop = 6;
    self.segmentView.hiddenBottomLineView = NO;
    self.segmentView.bottomLineViewColor = kCOLOR_1890FF;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.customTabbar.hidden = YES;
     
    self.segmentView.selectIndex = self.subSelectedIndex;
    self.viewControllers = self.subViewControllers;
    [self updateSegment];
    self.selectedIndex = self.subSelectedIndex;
    
    UIView *lineView = [self.segmentView createView];
    lineView.backgroundColor = kCOLOR_dynamicProvider_E6E7E8A100_E6E7E8A008;
    lineView.frame = CGRectMake(0, self.segmentView.height-.5f, KWidth, .5f);

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//

//切换tab成功
- (void)showViewControllerIndex:(NSInteger)showIndex {
    self.currentSelectedIndex = showIndex;
    self.currentViewController = [self.subViewControllers objectOrNilAtIndex:showIndex];
}

- (void)umengLoggerUserSelectedIndex:(NSInteger)selectedIndex {
//    //埋点
//    [RRUMengLogger modularClickedWithParams:@{
//        kRRUmengEventKeyButtonName : [self.subTitles objectOrNilAtIndex:selectedIndex] ?: @"",
//        kRRUmengEventKeySourcePage : self.rr_UMemgPageName ?: @"",
//    }];
}

-(UIViewController *)getCurrentVC {
    return self.currentViewController;
}

- (NSArray *)segmentTitles {
    return self.subTitles;
}

- (CGFloat)segmentHeight {
    return 42;
}

//- (NSString *)rr_UMemgPageName {
//    return @"";
//}

- (NSString *)rr_UMemgPageName {
    return [self.parentViewController rr_UMemgPageName];
}

- (NSString *)rr_UMemgChannelName {
    return [self.currentSelectedVC rr_UMemgChannelName];
}

@end
