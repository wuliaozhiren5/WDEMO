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
#import "HomePageViewController.h"


static CGFloat const headViewHeight = 256;

@interface PersonalHomepageVC ()<UITableViewDelegate,UITableViewDataSource,WMPageControllerDelegate,scrollDelegate>
//tableview
@property(nonatomic ,strong)MainTouchTableTableView *mainTableView;

@property(nonatomic,strong) UIScrollView * parentScrollView;

/*
 * canScroll= yes : mainTableView 视图可以滚动，parentScrollView 禁止滚动
 */
@property (nonatomic, assign) BOOL canScroll;

@property (nonatomic, assign) BOOL isTopIsCanNotMoveMainTableView;//到顶部不能滚动了

@property (nonatomic, assign) BOOL isTopIsCanNotMoveParentScrollView;//到顶部不能滚动了
@end

@implementation PersonalHomepageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.title = @"PersonalHomepageVC";
    
    [self.view addSubview:self.mainTableView];

//    [self.mainTableView addSubview:self.headImageView];
    //支持下刷新。关闭弹簧效果
//    self.mainTableView.bounces =  NO;
 
    if (@available(iOS 11.0, *)) {
        self.mainTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
//    self.canScroll = YES;
}

#pragma mark -- scrollDelegate
-(void)scrollDidScroll:(UIScrollView *)scrollView {
    
    self.parentScrollView = scrollView;

    CGFloat offsetY = scrollView.contentOffset.y;
//    if (offsetY > headViewHeight) {
//
//    }
    
//    self.parentScrollView.contentOffset = CGPointMake(0, 0);
      
//    if (self.isTopIsCanNotMoveMainTableView) {
//        self.parentScrollView.contentOffset = CGPointMake(0, 0);
//    } else {
//        self.parentScrollView.contentOffset = CGPointMake(0, 0);
//    }
    
//    CGPoint translatedPoint = [scrollView.panGestureRecognizer translationInView:scrollView];
//    if(translatedPoint.y < 0) {
//        NSLog(@"上滑");
//        
//        if (self.isTopIsCanNotMoveMainTableView) {
//            self.isTopIsCanNotMoveParentScrollView = YES;
//        } else {
//            self.parentScrollView.contentOffset = CGPointMake(0, 0);
//        }
//    }
//        
//    if(translatedPoint.y > 0) {
//        NSLog(@"下滑");
//        if (offsetY < 0) {
//            
//        } else {
//            
//        } 
//    }
    
    if (offsetY < 0) {
        //离开顶部 主View 可以滑动
        self.canScroll = YES;
        if (self.isTopIsCanNotMoveMainTableView) {
            //外部到顶了
            //内部未到顶了
            self.isTopIsCanNotMoveParentScrollView = NO;
        } else {
            //外部未到顶了
            //内部不要下拉刷新
            //设置contentOffset
            self.parentScrollView.contentOffset = CGPointMake(0, 0);
        }
    } else {
        if (self.isTopIsCanNotMoveMainTableView) {
            //外部到顶了
            //内部到顶了
            self.isTopIsCanNotMoveParentScrollView = YES;
            
            //未离开顶部 主View 不可滑动
            self.canScroll = NO;
        } else {
            //外部未到顶了
            //设置contentOffset
            self.parentScrollView.contentOffset = CGPointMake(0, 0);
            
            //离开顶部 主View 可以滑动
            self.canScroll = YES;
        }
    }
}

////下
//-(void)scrollViewDown:(UIScrollView *)scrollView {
//
//    self.parentScrollView = scrollView;
//
//    CGFloat offsetY = scrollView.contentOffset.y;
//    if (offsetY < 0) {
//        self.canScroll = YES;
////        self.isTopIsCanNotMoveParentScrollView = YES;
//    }
//
////    self.parentScrollView.contentOffset = CGPointMake(0, 0);
//
////    self.parentScrollView.contentOffset = CGPointMake(0, 0);
////    if (self.isTopIsCanNotMoveMainTableView) {
////        self.parentScrollView.contentOffset = CGPointMake(0, 0);
////    } else {
////        self.parentScrollView.contentOffset = CGPointMake(0, 0);
////    }
//
//    CGPoint translatedPoint = [scrollView.panGestureRecognizer translationInView:scrollView];
//    if(translatedPoint.y < 0) {
//        NSLog(@"上滑2");
//    }
//
//    if(translatedPoint.y > 0) {
//        NSLog(@"下滑2");
//    }
//
//}

//-(void)scrollViewLeaveAtTheTop:(UIScrollView *)scrollView
//{
//    self.parentScrollView = scrollView;
//    
//    //离开顶部 主View 可以滑动
//    self.canScroll = YES;
//}

-(void)scrollViewChangeTab:(UIScrollView *)scrollView
{
    self.parentScrollView = scrollView;
    /*
     * 如果已经离开顶端 切换tab parentScrollView的contentOffset 应该初始化位置
     * 这一规则 仿简书
     */
    if (self.canScroll) {
        self.parentScrollView.contentOffset = CGPointMake(0, 0);
    }
}

#pragma mark -- UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    /*
     *  处理联动事件
     */

    //获取滚动视图y值的偏移量
    CGFloat tabOffsetY = 0;
    CGFloat offsetY = scrollView.contentOffset.y;

    if (offsetY >= headViewHeight) {
        scrollView.contentOffset = CGPointMake(0, tabOffsetY);
        offsetY = tabOffsetY;
    }
     
//    self.isTopIsCanNotMoveParentScrollView = self.isTopIsCanNotMoveMainTableView;
 
    if (!self.isTopIsCanNotMoveParentScrollView) {
        if (offsetY >= tabOffsetY) {
            scrollView.contentOffset = CGPointMake(0, tabOffsetY);
            self.isTopIsCanNotMoveMainTableView = YES;
            
    //        self.canScroll = NO;
        }else{
            self.isTopIsCanNotMoveMainTableView = NO;
//            self.isTopIsCanNotMoveParentScrollView = NO;

    //        self.canScroll = YES;
    //        self.parentScrollView.contentOffset = CGPointMake(0, 0);
        }
    } else {
        scrollView.contentOffset = CGPointMake(0, tabOffsetY);
    }
     
  
//    if (self.isTopIsCanNotMoveMainTableView != self.isTopIsCanNotMoveParentScrollView) {
//        if (!self.isTopIsCanNotMoveParentScrollView && self.isTopIsCanNotMoveMainTableView) {
//            //滑动到顶端
//            self.canScroll = NO;
//        }
//
//        if(self.isTopIsCanNotMoveParentScrollView && !self.isTopIsCanNotMoveMainTableView){
//            //离开顶端
//            if (!self.canScroll) {
//                scrollView.contentOffset = CGPointMake(0, tabOffsetY);
//            }else{
//                self.parentScrollView.contentOffset = CGPointMake(0, tabOffsetY);
//            }
//        }
//    }else
//    {
//        if (!self.canScroll){
//             //支持下刷新,下拉时maintableView 没有滚动到位置 parentScrollView 不进行刷新
//            CGFloat parentScrollViewOffsetY = self.parentScrollView.contentOffset.y;
//            if(parentScrollViewOffsetY >0)
//                self.parentScrollView.contentOffset = CGPointMake(0, 0);
//        }else
//        {
//            self.parentScrollView.contentOffset = CGPointMake(0, 0);
//        }
//    }
    
    
    /**
     * 处理头部视图
     */
//    CGFloat yOffset  = scrollView.contentOffset.y;
//    if(yOffset < -headViewHeight) {
//
//        CGRect f = self.headImageView.frame;
//        f.origin.y= yOffset ;
//        f.size.height=  -yOffset;
//        f.origin.y= yOffset;
//
//        //改变头部视图的fram
//        self.headImageView.frame= f;
//        CGRect avatarF = CGRectMake(f.size.width/2-40, (f.size.height-headViewHeight)+56, 80, 80);
//        _avatarImage.frame = avatarF;
//        _countentLabel.frame = CGRectMake((f.size.width-Main_Screen_Width)/2+40, (f.size.height-headViewHeight)+172, Main_Screen_Width-80, 36);
//    }
}

#pragma mark --tableDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     
    return Screen_Height - 94;//Screen_Height - 94
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
    oneVc.delegate = self;
    SecondViewTableViewController * twoVc  = [SecondViewTableViewController new];
    twoVc.delegate = self;
    ThirdViewCollectionViewController * thirdVc  = [ThirdViewCollectionViewController new];
    thirdVc.delegate = self;
     
    NSArray *viewControllers = @[oneVc,twoVc,thirdVc];
    NSArray *titles = @[@"first",@"second",@"third"];
 
    HomePageViewController *pageVC= [[HomePageViewController alloc] initWithViewControllerClasses:viewControllers andTheirTitles:titles];
    pageVC.viewControllers = viewControllers;
    
    pageVC.selectIndex = 0;
//    pageVC.title = @"首页样式";
    //带下划线
    pageVC.menuViewStyle = WMMenuViewStyleLine;
    ///** 是否自动通过字符串计算 MenuItem 的宽度，默认为 NO. */
    pageVC.automaticallyCalculatesItemWidths = YES;
    //菜单对齐方式
    pageVC.menuViewLayoutMode = WMMenuViewLayoutModeLeft;
    //间隙
    pageVC.itemMargin = 10;
    /** MenuView 内部视图与左右的间距 */
    pageVC.menuViewContentMargin = 10;
    //底部小横线样式，小红线长度
    pageVC.progressViewIsNaughty = YES;
    pageVC.progressWidth = 10;
//        vc.selectIndex = 1;
//        vc.automaticallyCalculatesItemWidths = YES;
//        vc.titleSizeSelected = 16;
    
    return pageVC;
    
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    NSLog(@"%@",viewController);
}

- (MainTouchTableTableView *)mainTableView {
    if (_mainTableView == nil) {
        _mainTableView= [[MainTouchTableTableView alloc]initWithFrame:CGRectMake(0,0, Screen_Width,Screen_Height - 94)];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.contentInset = UIEdgeInsetsMake(headViewHeight,0, 0, 0);
        _mainTableView.backgroundColor = [UIColor redColor];
    }
    return _mainTableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
