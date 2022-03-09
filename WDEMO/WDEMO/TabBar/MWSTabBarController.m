//
//  MWSTabBarController.m
//  WDEMO
//
//  Created by rrtv on 2022/3/9.
//  Copyright © 2022 wwc. All rights reserved.
//

#import "MWSTabBarController.h"
#import "MWSTabBar.h"

@interface MWSTabBarController ()

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) MWSTabBar *tabBar ;

@end

@implementation MWSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViews];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setupViews {
    [self.view addSubview:self.tabBar];
    [self.view addSubview:self.contentView];

}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        
    }
    return _contentView;
}

- (MWSTabBar *)tabBar {
    if (!_tabBar) {
        _tabBar = [[MWSTabBar alloc] init];
        
    }
    return _tabBar;
}
@end
