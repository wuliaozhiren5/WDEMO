//
//  PersonalHomepageVC.m
//  WDEMO
//
//  Created by rrtv on 2021/2/19.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "PersonalHomepageVC.h"
#import "THeader.h"
#import "OneViewTableTableViewController.h"
#import "SecondViewTableViewController.h"
#import "ThirdViewCollectionViewController.h"
#import "MainTouchTableTableView.h"
#import "ParentClassScrollViewController.h" 
#import "WMPageController.h"


static CGFloat const headViewHeight = 256;

@interface PersonalHomepageVC ()<UITableViewDelegate,UITableViewDataSource,WMPageControllerDelegate>
//tableview
@property(nonatomic ,strong)MainTouchTableTableView *mainTableView;

@end

@implementation PersonalHomepageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.title = @"PersonalHomepageVC";
    
    [self.view addSubview:self.mainTableView];

//    [self.mainTableView addSubview:self.headImageView];
    //支持下刷新。关闭弹簧效果
    self.mainTableView.bounces =  NO;
 
    if (@available(iOS 11.0, *)) {
        self.mainTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

//    self.canScroll = YES;
    
}

#pragma mark --tableDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return Screen_Height - 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    /* 添加pageView
     * 这里可以任意替换你喜欢的pageView
     *作者这里使用一款github较多人使用的 WMPageController 地址https://github.com/wangmchn/WMPageController
     */
    [cell.contentView addSubview:self.setPageViewControllers];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark -- setter/getter

-(UIView *)setPageViewControllers
{
    WMPageController *pageController = [self p_defaultController];
    pageController.title = @"Line";
    pageController.menuViewStyle = WMMenuViewStyleLine;
    pageController.titleSizeSelected = 15;
    
    [self addChildViewController:pageController];
    [pageController didMoveToParentViewController:self];
    return pageController.view;
}

- (WMPageController *)p_defaultController {
    OneViewTableTableViewController * oneVc  = [OneViewTableTableViewController new];
//    oneVc.delegate = self;
    SecondViewTableViewController * twoVc  = [SecondViewTableViewController new];
//    twoVc.delegate = self;
    ThirdViewCollectionViewController * thirdVc  = [ThirdViewCollectionViewController new];
//    thirdVc.delegate = self;
    
    
    
    
    NSArray *viewControllers = @[oneVc,twoVc,thirdVc];
    NSArray *titles = @[@"first",@"second",@"third"];
    WMPageController *pageVC = [[WMPageController alloc] initWithViewControllerClasses:viewControllers andTheirTitles:titles];
//    [pageVC setViewFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
//    pageVC.delegate = self;
//    pageVC.menuItemWidth = 85;
//    pageVC.menuHeight = 44;
//    pageVC.postNotification = YES;
//    pageVC.bounces = YES;
    return pageVC;
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    NSLog(@"%@",viewController);
}

- (MainTouchTableTableView *)mainTableView {
    if (_mainTableView == nil) {
        _mainTableView= [[MainTouchTableTableView alloc]initWithFrame:CGRectMake(0,0, Screen_Width,Screen_Height - 64)];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.contentInset = UIEdgeInsetsMake(headViewHeight,0, 0, 0);
        _mainTableView.backgroundColor = [UIColor clearColor];
    }
    return _mainTableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
