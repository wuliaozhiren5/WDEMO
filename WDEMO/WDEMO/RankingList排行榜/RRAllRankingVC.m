//
//  RRAllRankingVC.m
//  WDEMO
//
//  Created by WDEMO on 2021/10/19.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "RRAllRankingVC.h"
#import "THeader.h"
#import "MainTouchTableTableView.h"
#import "ParentClassScrollViewController.h"
#import "WMPageController.h"
#import "RRAllRankingSubVC.h"
#import "LZTagSegmentedControl.h"
#import "RRAllRankingListVC.h"
#import "RRAllRankingContainerModel.h"

static CGFloat const headViewHeight = 256;

@interface RRAllRankingVC ()<UITableViewDelegate, UITableViewDataSource, scrollDelegate, WMPageControllerDelegate, LZTagSegmentedControlDelegate>
//tableview
@property(nonatomic ,strong)MainTouchTableTableView *mainTableView;
//scrollView
@property(nonatomic,strong) UIScrollView *parentScrollView;
//header 头
@property(nonatomic,strong)UIImageView *headImageView;//头部图片
@property(nonatomic,strong)UIImageView *avatarImage;
@property(nonatomic,strong)UILabel *countentLabel;
/*
 * canScroll= yes : mainTableView 视图可以滚动，parentScrollView 禁止滚动
 */
@property (nonatomic, assign) BOOL canScroll;

@property (nonatomic, assign) BOOL isTopIsCanNotMoveMainTableView;//到顶部不能滚动了

@property (nonatomic, assign) BOOL isTopIsCanNotMoveParentScrollView;//到顶部不能滚动了

@property(nonatomic,strong)UIImageView *backgroundImageView;//背景图

@property (nonatomic, assign) CGFloat statusbarHeight;

@property (nonatomic, assign) CGFloat navigationbarHeight;

//subVC字典
@property (nonatomic, strong) NSMutableDictionary *subVCDict;

@property (nonatomic, copy) NSArray *tagArr;
@property (nonatomic, copy) NSArray *subTagArr;
//当前index
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, assign) NSInteger containerIndex;
@property (nonatomic, assign) NSInteger contentIndex;

//当前的subVC
@property (nonatomic,strong) UIViewController *currentSubVC;

@property(strong , nonatomic)LZTagSegmentedControl *segmentedControl;

@property (nonatomic, copy) NSArray *topArr;

@end


@implementation RRAllRankingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"新排行榜";
    
    self.navigationController.navigationBar.translucent = YES;//这个必须设置
    
    ////////////////////
    
    NSLog(@"statusbar height: %f", [self getStatusBarHight]); // 高度
    
    //    状态栏高度：20px，导航栏高度：40px，代码如下：
    // (statusbar)
    CGRect rectOfStatusbar = [[UIApplication sharedApplication] statusBarFrame];
    NSLog(@"statusbar height: %f", rectOfStatusbar.size.height); // 高度
    
    //（navigationbar）
    CGRect rectOfNavigationbar = self.navigationController.navigationBar.frame;
    NSLog(@"navigationbar height: %f", rectOfNavigationbar.size.height); // 高度
    
    self.statusbarHeight = [self getStatusBarHight];
    self.navigationbarHeight = self.navigationController.navigationBar.frame.size.height;
    
    /*
    问题：statusbarHeight = 44
    实际却是 = 50，所以很奇怪，
    结果 safeAreaInsets.top = 50
    所以处理了下，代码如下
    */
    CGFloat top = 0;
    if (@available(iOS 11.0, *)) {
        CGFloat a =  [[UIApplication sharedApplication] delegate].window.safeAreaInsets.top;
        NSLog(@"%f",a);
        top = a;
    } else {
        top = 0;
    }
//    self.statusbarHeight = top;//[self getStatusBarHight];
    if (top > 0) {
        self.statusbarHeight = top;
    }
    self.navigationbarHeight = self.navigationController.navigationBar.frame.size.height;
    
    [self createTagData];
    [self createSegmentedControl];
    [self createCurrentSubVC];
    [self createTableView];
    
    [self refreshData];
}

- (void)refreshData {
    
    //iOS 读取本地Json文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"排行榜组件" ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
    NSError *error;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (!jsonData || error) {
        //DLog(@"JSON解码失败");
    } else {
        //DLog(@"JSON解码成功");
    }
    NSDictionary *dic = (NSDictionary *)jsonObj;
    
    NSArray *listArray = [NSArray modelArrayWithClass:[RRAllRankingContainerModel class] json:dic[@"data"]];
//    self.topArr = listArray;
}

//- (void)requestData {
//    [self refreshData];
//}
//
//- (void)refreshData {
//
//    WS(weakSelf)
//    [RRAllRankingApi requestAllRankingWithBlock:^(NSArray * _Nonnull listArray, NSError * _Nonnull error) {
//        if (error) {
//            if (weakSelf.loadingView) {
//                weakSelf.loadingView.msgType = RRMJLoadingErrorDefault;
//                //                weakSelf.dataSource.error = error;
//                [weakSelf stopLoading];
//                return;
//            }
//        }
//        weakSelf.loadingView.hidden = YES;
//        self.topArr = listArray;
//        [weakSelf stopLoading];
//    }];
//}
//
//- (void)stopLoading {
//    if (self.loadingView.isHidden) {
////        self.topArr = @[];
//        if (self.topArr.count > 0) {
//            [self setupViews];
//        } else {
//            self.noDataView.hidden = NO;
//        }
//    } else {
//        self.noDataView.hidden = YES;
//    }
//}

- (void)setupViews {
    [self createTagData];
    [self createBackgroundImageView];
    [self createSegmentedControl];
    [self createCurrentSubVC];
    [self createTableView];
}

- (void)createBackgroundImageView {
    [self.view addSubview:self.backgroundImageView];
    [self.view sendSubviewToBack:self.backgroundImageView];
}

- (void)createCurrentSubVC {
    //不存在创建
    //存在直接返回
    NSString *key = @(self.selectIndex).stringValue;
    UIViewController *showSubVC = self.subVCDict[key];
    if (!showSubVC) {
        showSubVC = [self createSubVC];
        NSString *key = @(self.selectIndex).stringValue;
        self.subVCDict[key] = showSubVC;
    }
    self.currentSubVC = showSubVC;
    
}

- (void)removeCurrentSubVC {
    if (self.currentSubVC) {
        [self.currentSubVC.view removeFromSuperview];
    }
}

- (void)createTableView {
    [self.view addSubview:self.mainTableView];
    [self.mainTableView addSubview:self.headImageView];
    //支持下刷新。关闭弹簧效果
    //bounces = YES;外部支持下拉刷新
    //bounces = NO;内部支持下拉刷新
    self.mainTableView.bounces = NO;
}

- (void)createTagData {
    NSArray *tagArr = @[
        @"总榜",
        @"评分榜",
        @"热门榜",
        @"搜索榜",
        @"口碑榜",
    ];
    _tagArr = tagArr;
    
    NSArray *subTagArr0 = @[
        @"全部",
        @"美剧总",
        @"日剧总",
        @"韩剧总",
        @"泰剧总",
        @"英剧总",
        @"动画总",
    ];
    NSArray *subTagArr1 = @[
        @"全部",
        @"美剧评分",
        @"日剧评分",
        @"韩剧评分",
        @"泰剧评分",
        @"英剧评分",
        @"动画评分",
    ];
    NSArray *subTagArr2 = @[
        @"全部",
        @"美剧热门",
        @"日剧热门",
        @"韩剧热门",
        @"泰剧热门",
        @"英剧热门",
        @"动画热门",
    ];
    NSArray *subTagArr3 = @[
        @"全部",
        @"美剧搜索",
        @"日剧搜索",
        @"韩剧搜索",
        @"泰剧搜索",
        @"英剧搜索",
        @"动画搜索",
    ];
    NSArray *subTagArr4 = @[
        @"全部",
        @"美剧口碑",
        @"日剧口碑",
        @"韩剧口碑",
        @"泰剧口碑",
        @"英剧口碑",
        @"动画口碑",
    ];
    _subTagArr = @[
        subTagArr0,
        subTagArr1,
        subTagArr2,
        subTagArr3,
        subTagArr4,
    ];
}

- (void)createSegmentedControl {
    LZTagSegmentedControl *segmentedControl = [[LZTagSegmentedControl alloc]initWithFrame:CGRectMake(0, headViewHeight - 40 - 10, SCREEN_WIDTH, 40)];
    segmentedControl.backgroundColor = [UIColor yellowColor];
    segmentedControl.delegate = self;
    
    NSArray *tagArr = _tagArr;
    segmentedControl.tagArr = tagArr;
    segmentedControl.index = self.selectIndex;
    [self.headImageView addSubview:segmentedControl];
    _segmentedControl = segmentedControl;
}

- (UIViewController *)createSubVC {
    NSArray *tagArr = _subTagArr[self.selectIndex];
    NSMutableArray *viewControllers = [NSMutableArray array];
    for (NSString *title in tagArr) {
        RRAllRankingListVC *oneVc  = [RRAllRankingListVC new];
        oneVc.delegate = self;
        oneVc.title = title;
        [viewControllers addObject:oneVc];
    }
    NSArray *titles = tagArr;
    
    RRAllRankingSubVC *pageVC= [[RRAllRankingSubVC alloc] initWithViewControllerClasses:viewControllers andTheirTitles:titles];
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
    
    pageVC.titleSizeNormal = 15.0;
    pageVC.titleSizeSelected = 20.0;
    
    [self addChildViewController:pageVC];
    [pageVC didMoveToParentViewController:self];
    return pageVC;
    
}

//iOS 10、设置导航栏全透明
//https://www.jianshu.com/p/e97086eb1f15
//iOS轻松实现导航栏透明渐变
//https://www.cnblogs.com/Lovexiaohuzi/p/6866351.html
//iOS轻松实现导航栏透明渐变
//https://www.jb51.net/article/103964.htm
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    self.navigationController.navigationBar.translucent = YES;//这个必须设置
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //    如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

- (CGFloat)getStatusBarHight {
    float statusBarHeight = 0;
    if (@available(iOS 13.0, *)) {
        UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;
        statusBarHeight = statusBarManager.statusBarFrame.size.height;
    }
    else {
        statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    }
    return statusBarHeight;
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
            //self.parentScrollView.contentOffset = CGPointMake(0, 0);
            
            //支持下刷新。关闭弹簧效果
            BOOL bounces = self.mainTableView.bounces;
            if (!bounces) {
                if (self.mainTableView.contentOffset.y <= -headViewHeight) {
                    
                } else {
                    self.parentScrollView.contentOffset = CGPointMake(0, 0);
                }
            } else {
                self.parentScrollView.contentOffset = CGPointMake(0, 0);
            }
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
    CGFloat tabOffsetY = - self.navigationbarHeight - self.statusbarHeight;
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
    
    
    //导航栏
    CGFloat minAlphaOffset = self.navigationbarHeight + self.statusbarHeight;
    CGFloat maxAlphaOffset = headViewHeight;
    CGFloat offset = scrollView.contentOffset.y;
    CGFloat alpha = 1 + (offset + minAlphaOffset) / (maxAlphaOffset - minAlphaOffset);
    
    //滑动渐变颜色
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithBgColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:alpha]] forBarMetrics:UIBarMetricsDefault];// 颜色自己设置 渐变开始的位置自己算
    
    /**
     * 处理头部视图
     */
    CGFloat yOffset  = scrollView.contentOffset.y;
    if(yOffset < -headViewHeight) {
        
        CGRect f = self.headImageView.frame;
        f.origin.y= yOffset ;
        f.size.height=  -yOffset;
        f.origin.y= yOffset;
        
        //改变头部视图的fram
        self.headImageView.frame= f;
        CGRect avatarF = CGRectMake(f.size.width/2-40, (f.size.height-headViewHeight)+56, 80, 80);
        _avatarImage.frame = avatarF;
        _countentLabel.frame = CGRectMake((f.size.width-Screen_Width)/2+40, (f.size.height-headViewHeight)+172, Screen_Width-80, 36);
    }
    //    else无用
    //    else {
    //        CGFloat minAlphaOffset = self.navigationbarHeight + self.statusbarHeight;
    //        CGFloat maxAlphaOffset = headViewHeight;
    //        CGFloat offset = scrollView.contentOffset.y;
    //        CGFloat alpha = (-offset) / (maxAlphaOffset - minAlphaOffset);
    //        _headImageView.alpha = alpha;
    
    
    
    //        CGFloat height = headViewHeight - self.navigationbarHeight - self.statusbarHeight;
    //透明度
    //        CGFloat alpha = -yOffset/height;
    //        self.headImageView.alpha = alpha;
    
    //        _headImageView.frame=CGRectMake(0, -headViewHeight, Screen_Width, headViewHeight);
    
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
    
    return Screen_Height - self.navigationbarHeight - self.statusbarHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    /* 添加pageView
     * 这里可以任意替换你喜欢的pageView
     *作者这里使用一款github较多人使用的 WMPageController 地址https://github.com/wangmchn/WMPageController
     */
    
    //删除所有子View
    //    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //删除老的
    [self removeCurrentSubVC];
    //创建新的
    [self createCurrentSubVC];
    
    UIViewController *showVC = self.currentSubVC;
    UIView *view = showVC.view;
    [cell.contentView addSubview:view];
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(cell.contentView);
//    }];
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

#pragma mark - WMPageControllerDelegate
- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    NSLog(@"%@",viewController);
}

#pragma mark - LZTagSegmentedControlDelegate
- (void)tagSegmentedControl:(LZTagSegmentedControl *)tagSegmentedControl
       didSelectItemAtIndex:(NSInteger)index {
    self.selectIndex = index;
    [self.mainTableView reloadData];
}

#pragma mark -- lazy 懒加载
-(UIImageView *)headImageView
{
    if (_headImageView == nil)
    {
        _headImageView= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg.jpg"]];
        _headImageView.frame=CGRectMake(0, -headViewHeight ,Screen_Width,headViewHeight);
        _headImageView.userInteractionEnabled = YES;
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
        _headImageView.clipsToBounds = YES;
        
        _avatarImage = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_Width/2-40, 56, 80, 80)];
        [_headImageView addSubview:_avatarImage];
        _avatarImage.userInteractionEnabled = YES;
        _avatarImage.layer.masksToBounds = YES;
        _avatarImage.layer.borderWidth = 1;
        _avatarImage.layer.borderColor =[[UIColor colorWithRed:255/255. green:253/255. blue:253/255. alpha:1.] CGColor];
        _avatarImage.layer.cornerRadius = 40;
        _avatarImage.image = [UIImage imageNamed:@"avatar.jpg"];
        
        
        _countentLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 150, Screen_Width-80, 30)];
        _countentLabel.font = [UIFont systemFontOfSize:12.];
        _countentLabel.textColor = [UIColor colorWithRed:255/255. green:255/255. blue:255/255. alpha:1.];
        _countentLabel.textAlignment = NSTextAlignmentCenter;
        _countentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _countentLabel.numberOfLines = 0;
        _countentLabel.text = @"我的名字叫Anna";
        [_headImageView addSubview:_countentLabel];
    }
    return _headImageView;
}

- (MainTouchTableTableView *)mainTableView {
    if (_mainTableView == nil) {
        _mainTableView= [[MainTouchTableTableView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
        if (@available(iOS 11.0, *)) {
            self.mainTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.contentInset = UIEdgeInsetsMake(headViewHeight,0, 0, 0);
        _mainTableView.backgroundColor = [UIColor redColor];
    }
    return _mainTableView;
}

- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        UIImage *img = [UIImage imageNamed:@"ranking_BackGround"];
        _backgroundImageView.image = img;
        //大小375/171
        _backgroundImageView.frame = CGRectMake(0, 0, KWidth, KWidth * 171 / 375);
        //        _backgroundImageView.userInteractionEnabled = YES;
        _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
        //        _backgroundImageView.clipsToBounds = YES;
        
        _backgroundImageView.backgroundColor = [UIColor blackColor];
    }
    return _backgroundImageView;
}

- (NSMutableDictionary *)subVCDict {
    if (!_subVCDict) {
        _subVCDict = [NSMutableDictionary dictionary];
    }
    return _subVCDict;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)imageWithBgColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
