//
//  MWSLotteryBagListVC.m
//  MoWanShang
//
//  Created by rrtv on 2022/3/29.
//

#import "MWSLotteryBagListVC.h"
#import "MWSLotteryBagListCell.h"
#import "MWSLotteryBagListTopModel.h"
#import "MWSLotteryBagListTopView.h"
//#import "MWSLotteryBagListApi.h"

@interface MWSLotteryBagListVC () <UITableViewDataSource, UITableViewDelegate, MWSLotteryBagListTopViewDelegate>
@property (nonatomic, strong) MWSLotteryBagListTopView *topView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign)NSInteger pageIndex;
@property (nonatomic, assign)NSInteger orderWayIndex;
@property (nonatomic, assign)NSInteger levelIndex;

@property (nonatomic, strong)NSMutableArray *pageArr;
@property (nonatomic, strong)NSMutableArray *orderWayArr;
@property (nonatomic, strong)NSMutableArray *levelArr;

@property (nonatomic, copy)NSString *page;
@property (nonatomic, copy)NSString *orderWay;
@property (nonatomic, copy)NSString *level;
@property (nonatomic, copy)NSString *sort;

@property (nonatomic, assign)BOOL isOpen;

@end

@implementation MWSLotteryBagListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = kCOLOR_0F0F0F;
    //    self.navigationBarView.hidden = YES;
    //    self.dataSource = [[MWSDataSource alloc] init];
//    self.navigationBarView.titleLabel.text = @"选择赏箱";
    
    self.isOpen = YES;
    
    [self createData];
    
    [self setupViews];
     
//    [self requestData];
}

- (void)createData {
    NSMutableArray *pageArr = [NSMutableArray array];
    {
        //        NSInteger bagTotal = 2000;
        NSInteger bagTotal = self.bagModel.bag_total;
        NSInteger page = bagTotal / 200;
        NSInteger onePage = bagTotal % 200;
        if (onePage > 0) {
            page = page + 1;
        }
        
        for (NSInteger i = 1; i <= page; i++) {
            
            NSString *value = [NSString stringWithFormat:@"%zi", i];
            
            NSInteger star = 1 + 200 * (i - 1);
            NSInteger end = 200 + 200 * (i - 1);
            
            NSString *name = [NSString stringWithFormat:@"%zi～%zi箱", star, end];
            
            MWSLotteryBagListTopModel *model = [[MWSLotteryBagListTopModel alloc] init];
            
            model.name = name;
            model.type = value;
            
            [pageArr addObject:model];
        }
    }
    
    NSMutableArray *orderWayArr = [NSMutableArray array];
    {
        MWSLotteryBagListTopModel *model1 = [[MWSLotteryBagListTopModel alloc] init];
        model1.name = @"余量";
        model1.type = @"remainder";
        model1.sort = @"DESC";
        
        MWSLotteryBagListTopModel *model2 = [[MWSLotteryBagListTopModel alloc] init];
        model2.name = @"箱号";
        model2.type = @"num";
        model2.sort = @"DESC";
        
        MWSLotteryBagListTopModel *model3 = [[MWSLotteryBagListTopModel alloc] init];
        model3.name = @"赏级";
        model3.type = @"level";
        //        model1.sort = nil;
        
        [orderWayArr addObject:model1];
        [orderWayArr addObject:model2];
        [orderWayArr addObject:model3];
    }
    
    NSMutableArray *levelArr = [NSMutableArray array];
    {
        NSArray *arr = @[
            @"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", @"Last"
        ];
//        NSArray *arr = [self.bagModel.good_info valueForKeyPath:@"good_level"];
        
        MWSLotteryBagListTopModel *allModel = [[MWSLotteryBagListTopModel alloc] init];
        allModel.name = @"全部";
        allModel.type = @"all";
        [levelArr addObject:allModel];
        
        for (NSString *str in arr) {
            
            MWSLotteryBagListTopModel *model = [[MWSLotteryBagListTopModel alloc] init];
            model.name = [NSString stringWithFormat:@"%@赏", str];
            model.type = str;
            [levelArr addObject:model];
        }
    }
    
    self.pageArr = pageArr;
    self.orderWayArr = orderWayArr;
    self.levelArr = levelArr;
    
    NSInteger nowPage = self.bagModel.bag_no / 200;
    if (self.bagModel.bag_no % 200 > 0) {
        nowPage = nowPage + 1;
    }
    self.page = [NSString stringWithFormat:@"%zi", nowPage];
    self.orderWay = @"remainder";
    self.level = @"all";
    self.sort = @"DESC"; //DESC降序排列 ACS升序排列
 
    self.pageIndex = self.bagModel.bag_no / 200;
    self.orderWayIndex = 0;
    self.levelIndex = 0;
}

////刷新数据
//- (void)requestData {
//    [self startAnimating];
//    [self.baseAdapter removeAllDatas];
//    [self refreshData];
//
//}
//
//- (void)refreshData {
//    [self loadData];
//}
//
//- (void)loadData {
//
//    NSString *activeId = self.activeId;
//    NSString *page = self.page;
//    NSString *level = self.level;
//    NSString *orderWay = self.orderWay;
//    NSString *sort = self.sort;
//
//    @weakify(self);
//    [MWSLotteryBagListApi requestBagListWithActiveId:activeId
//                                                page:page
//                                               level:level
//                                            orderWay:orderWay
//                                                sort:sort block:^(MWSBagsListModel * _Nonnull model, NSError * _Nonnull error) {
//        @strongify(self);
//        //        //测试代码
//        //        error = [[NSError alloc] init];
//
//        if (error) {
//            self.baseAdapter.error = error;
//            [self stopLoading];
//            return;
//        }
//        //        //        listArray = @[];
//
//        //        [self stopAnimating];
//        //        [self.loadingView removeFromSuperview];
//        //        self.loadingView = nil;
//
//        [self.baseAdapter appendArrayWithDatas:model.bags];
//        self.baseAdapter.loading = NO;
//        self.baseAdapter.refreshing = NO;
//        self.baseAdapter.noMoreData = YES;
//        self.baseAdapter.error = error;
//        //                self.baseAdapter.page = page;
//        [self stopLoading];
//    }];
//}
//
//- (void)stopLoading {
//    //    [self.dataView.mj_header endRefreshing];
//    //    [self.dataView.mj_footer endRefreshing];
//    [self stopAnimating];
//
//    //    [self addHeader];
//    //    [self addFooter];
//
//    self.baseAdapter.loading = NO;
//    self.baseAdapter.refreshing = NO;
//    if (self.baseAdapter.isNoMoreData) {
//        [self.dataView.mj_footer endRefreshingWithNoMoreData];
//    } else {
//        [self.dataView.mj_footer resetNoMoreData];
//    }
//
//    if (self.baseAdapter.isNoData) {
//        self.dataView.mj_footer.hidden = YES;
//    } else {
//        self.dataView.mj_footer.hidden = NO;
//    }
//
//    //    self.noDataView.hidden = !self.dataView.isNoData;
//
//    [self.tableView reloadData];
//
//    //    FIXME: 错误页面展示
//    [self showErrorView];
//}
//
//- (void)showErrorView {
//    if (self.baseAdapter.error) {
//        if (self.baseAdapter.isNoData) {
//            @weakify(self);
//            [self handleError:self.baseAdapter.error showType:MWSErrorShowTypeCover tapAction:^{
//                @strongify(self);
//                [self refreshData];
//            }];
//        } else {
//            TOAST(@"加载失败");
//            //            [self handleError:self.baseAdapter.error showType:MWSErrorShowTypeToast tapAction:nil];
//        }
//    } else {
//        [self hideExceptionHint];
//    }
//}

////刷新数据
//- (void)requestData {
//    [self startAnimating];
//    [self refreshData];
//
//}
//
//- (void)refreshData {
//    self.baseAdapter.startPage = 1;
//    if (self.baseAdapter.isLoading) {
//        if (!self.baseAdapter.isRefreshing &&
//            self.dataView.mj_header.isRefreshing) {
//            [self.dataView.mj_header endRefreshing];
//        }
//        return;
//    }
////    [self startAnimating];
//    self.baseAdapter.refreshing = YES;
//    self.baseAdapter.loading = YES;
//    self.baseAdapter.error = nil;
//    [self loadDataWithPage:self.baseAdapter.startPage];
//}
//
//- (void)loadMoreData {
//    if (self.baseAdapter.isLoading) {
//        if (self.baseAdapter.isRefreshing &&
//            self.dataView.mj_footer.isRefreshing) {
//            [self.dataView.mj_footer endRefreshing];
//        }
//        return;
//    }
//    self.baseAdapter.refreshing = NO;
//    self.baseAdapter.loading = YES;
//    self.baseAdapter.error = nil;
//    [self loadDataWithPage:self.baseAdapter.page + 1];
//}
//
//- (void)loadDataWithPage:(NSInteger)page {
//
////    NSString *activeId = @"30";
////    NSString *bagId = @"2745";
//    NSString *activeId = self.activeId;
//    NSString *bagId = self.bagId;
////    NSInteger page = page;
//    NSInteger rows = 20;
//    @weakify(self);
//
//    [MWSLotteryWinningRecordApi requestLotteryWinningRecordWithActiveId:activeId
//                                                                  bagId:bagId
//                                                                   page:page
//                                                                   rows:rows
//                                                                  block:^(MWSWinningRecordListModel * _Nonnull model, NSError * _Nonnull error) {
//        @strongify(self);
////        //        //测试代码
////        //        error = [[NSError alloc] init];
//        if (error) {
//            self.baseAdapter.error = error;
////            if (self.loadingView) {
//////                @weakify(self);
//////                [self handleError:self.baseAdapter.error showType:MWSErrorShowTypeCover tapAction:^{
//////                    @strongify(self);
//////                    [self refreshData];
//////                }];
////            } else {
////                TOAST(@"加载失败");
////            }
//            [self stopLoading];
//            return;
//        }
////        //        listArray = @[];
//
////        [self stopAnimating];
////        [self.loadingView removeFromSuperview];
////        self.loadingView = nil;
//
//        [self.baseAdapter appendArrayWithDatas:model.content];
//        self.baseAdapter.loading = NO;
//        self.baseAdapter.refreshing = NO;
//        self.baseAdapter.noMoreData = model.isEnd;
//        self.baseAdapter.error = error;
//        self.baseAdapter.page = page;
//        [self stopLoading];
//    }];
//}
//
//- (void)stopLoading {
//    [self.dataView.mj_header endRefreshing];
//    [self.dataView.mj_footer endRefreshing];
//    [self stopAnimating];
//
//    [self addHeader];
//    [self addFooter];
//
//    self.baseAdapter.loading = NO;
//    self.baseAdapter.refreshing = NO;
//    if (self.baseAdapter.isNoMoreData) {
//        [self.dataView.mj_footer endRefreshingWithNoMoreData];
//    } else {
//        [self.dataView.mj_footer resetNoMoreData];
//    }
//
//    if (self.baseAdapter.isNoData) {
//        self.dataView.mj_footer.hidden = YES;
//    } else {
//        self.dataView.mj_footer.hidden = NO;
//    }
//
////    self.noDataView.hidden = !self.dataView.isNoData;
//
//    [self.tableView reloadData];
//
////    FIXME: 错误页面展示
//    [self showErrorView];
//}
//
//- (void)showErrorView {
//    if (self.baseAdapter.error) {
//        if (self.baseAdapter.isNoData) {
//            @weakify(self);
//            [self handleError:self.baseAdapter.error showType:MWSErrorShowTypeCover tapAction:^{
//                    @strongify(self);
//                [self refreshData];
//            }];
//        } else {
//            TOAST(@"加载失败");
////            [self handleError:self.baseAdapter.error showType:MWSErrorShowTypeToast tapAction:nil];
//        }
//    } else {
//        [self hideExceptionHint];
//    }
//}
//
//- (void)addHeader {
//    if (self.tableView.mj_header) {
//        return;
//    }
//    @weakify(self)
//    MJDIYHeader *header = [MJDIYHeader headerWithRefreshingBlock:^{
//        @strongify(self)
//        [self refreshData];
//    }];
//    self.tableView.mj_header = header;
//}
//
//- (void)removeHeader {
//    if (self.tableView.mj_header) {
//        [self.tableView.mj_header endRefreshing];
//        self.tableView.mj_header = nil;
//    }
//}
//
//- (void)addFooter {
//    if (self.baseAdapter.dataArray.count <= 0) {
////        self.tableView.mj_footer = nil;
//        [self removeFooter];
//        return;
//    }
//    if (self.tableView.mj_footer) {
//        return;
//    }
//    @weakify(self)
//    MJDIYFooter *footer = [MJDIYFooter footerWithRefreshingBlock:^{
//        @strongify(self)
//        [self loadMoreData];
//    }];
//    [footer setTitle:@"" forState:MJRefreshStateIdle];
//    [footer setTitle:@"" forState:MJRefreshStateRefreshing];
//    [footer setTitle:@"已经到底啦～" forState:MJRefreshStateNoMoreData];
//    footer.stateLabel.font = [UIFont systemFontOfSize:12];
//    footer.stateLabel.textColor = kCOLOR_85888F;
//    self.tableView.mj_footer = footer;
//}
//
//- (void)removeFooter {
//    if (self.tableView.mj_footer) {
//        [self.tableView.mj_footer endRefreshing];
//        self.tableView.mj_footer = nil;
//    }
//}

- (void)setupViews {
    
    [self.view addSubview:self.topView];
    [self.view addSubview:self.tableView];
    
    self.topView.backgroundColor = [UIColor grayColor];
    if (self.isOpen) {
        [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.navigationBarView.mas_bottom).offset(0);
            make.top.equalTo(@0);
            make.leading.equalTo(@0);
            make.trailing.equalTo(@0);
            make.height.equalTo(@(44 * 3));
            
        }];
    } else {
        [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@0);
            make.leading.equalTo(@0);
            make.trailing.equalTo(@0);
            make.height.equalTo(@(44 * 2));
            
        }];
    }
//    self.tableView.backgroundColor = kCOLOR_0F0F0F;
//    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView.mas_bottom).offset(0);
        make.bottom.equalTo(@0);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
    }];
    self.topView.pageIndex = self.pageIndex;
    self.topView.orderWayIndex = self.orderWayIndex;
    self.topView.levelIndex = self.levelIndex;

    self.topView.pageArr = [self.pageArr copy];
    self.topView.orderWayArr = [self.orderWayArr copy];
    self.topView.levelArr = [self.levelArr copy];
    
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
//    return self.baseAdapter.dataArray.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    //26。  3*2 + 16
    CGFloat cellheight = 84 + 16;
    CGFloat height = 0;

    NSArray *arr = [self.bagModel.good_info valueForKeyPath:@"good_level"];
    NSInteger count = arr.count / 4;
    if (count % 4 > 0) {
        count = count + 1;
    }
    height = (26 * count)+ 3 * 2 + 16;
    if (height > cellheight) {
        cellheight = height;
    }
    return cellheight;
}

////header高度
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 0.0;
//}
//
////footer高度
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 0.0;
//}
//
////自定义头
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    return [[UIView alloc] init];
//}
//
////自定义脚
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    return [[UIView alloc] init];
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MWSLotteryBagListCell *cell = (MWSLotteryBagListCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MWSLotteryBagListCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    MWSBagsModel *model = [self.baseAdapter.dataArray objectOrNilAtIndex:indexPath.item];
//    cell.level = self.level;
//    cell.model = model;
    return cell;
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
//    MWSBagsModel *model = [self.baseAdapter.dataArray objectOrNilAtIndex:indexPath.item];
//    if (self.delegate && [self.delegate respondsToSelector:@selector(bagListVClickWithBagNo:)]) {
//        [self.delegate bagListVClickWithBagNo:[NSString stringWithFormat:@"%zi", model.bag_no]];
//    }
//    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - MWSLotteryBagListTopViewDelegate
- (void)bagListTopViewWithPageModel:(MWSLotteryBagListTopModel *)pageModel {
    NSString *page = pageModel.type;
    self.page = page;
//    [self requestData];

}

- (void)bagListTopViewWithOrderWayModel:(MWSLotteryBagListTopModel *)orderWayModel {
    NSString *orderWay = orderWayModel.type;
    NSString *sort = orderWayModel.sort;
    if ([orderWay isEqualToString:@"level"]) {
        
        self.isOpen = !self.isOpen;
        
        if (self.isOpen) {
            [self.topView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@0);
                make.leading.equalTo(@0);
                make.trailing.equalTo(@0);
                make.height.equalTo(@(44 * 3));
                
            }];
        } else {
            [self.topView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@0);
                make.leading.equalTo(@0);
                make.trailing.equalTo(@0);
                make.height.equalTo(@(44 * 2));
                
            }];
        }
        return;
    } else {
        
        self.orderWay = orderWay;
        self.sort = sort;
//        [self requestData];

    }
    
}

- (void)bagListTopViewWithLevelModel:(MWSLotteryBagListTopModel *)levelModel {
    NSString *level = levelModel.type;
    self.level = level;
//    [self requestData];
}

//lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KHeight) style:UITableViewStylePlain];
        //        _tableView.backgroundColor = kCOLOR_dynamicProvider_F7F8FA_1F2126;
        
        //iOS11
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            //        self.automaticallyAdjustsScrollViewInsets = NO;
        }
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        [_tableView registerClass:[MWSLotteryBagListCell class] forCellReuseIdentifier:NSStringFromClass([MWSLotteryBagListCell class])];
    }
    return _tableView;
}

- (MWSLotteryBagListTopView *)topView {
    if (!_topView) {
        _topView = [[MWSLotteryBagListTopView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KWidth)];
        _topView.delegate = self;
        _topView.clipsToBounds = YES;
    }
    return _topView;
}
@end
