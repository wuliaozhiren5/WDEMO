//
//  RRDramaCommentSubVC.m
//  NJVideo
//
//  Created by rrtv on 2021/7/31.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRDramaCommentSubVC.h"
#import "RRDramaCommentBottomView.h"
//#import "RRCommentService.h"
//#import "RRSeasonSeniorCommentsHearder.h"
//#import "RRSeasonSeniorCommentsHasReplyListCell.h"
#import "RRDramaCommentCell.h"
#import "RRSeasonSeniorCommentsDetailVC.h"
//#import "RRAlertBase.h"
//api model
//#import "RRDramaCommentListApi.h"
#import "RRSeniorCommentsModel.h"
//#import "RRImageGetTokenApi.h"
//#import "RRImageUploadManager.h"
//#import "NSString+ZY.h"
#import "RRDramaCommentDetailVC.h"
//#import "RRCreateFilmReviewViewController.h"

//@interface RRDramaCommentSubVC () <UITableViewDataSource, UITableViewDelegate, RRDramaCommentDetailVCDelegate, RRCreateFilmReviewViewControllerDelegate>

@interface RRDramaCommentSubVC () <UITableViewDataSource, UITableViewDelegate, RRDramaCommentDetailVCDelegate>

//@property (nonatomic, strong) RRCommentService *service;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RRDramaCommentBottomView *bottomView;

//@property (nonatomic, strong) RRDataSource *dataSource;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger rows;

//@property (nonatomic, assign) BOOL spoiler;    //是否剧透  TRUE是全部  FALSE 是过滤剧透
@property (nonatomic, copy) NSString *sort;       //排序:likeCount根据最热排序 createTime

//@property (nonatomic, strong) RRDramaCommentListApi *listApi;

//@property (nonatomic, assign) BOOL isReplying;

@property (nonatomic, copy) NSMutableArray *data;//数据

@end

@implementation RRDramaCommentSubVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.customTabbar.hidden = YES;
//    self.dataSource = [[RRDataSource alloc] init];

//    self.spoiler = YES;
    self.sort = @"likeCount";

    self.page = 1;
    self.rows = 20;
//    self.isReplying = NO;

//    self.loadingView.hidden = NO;
//    self.loadingView.center = CGPointMake(self.view.centerX, self.view.centerY - 99 - appMargin().top);
//    self.noDataView.center = self.loadingView.center;

    [self setupViews];
    [self refreshData];
}

- (void)refreshData {
    
}
//
////- (void)requestData {
////    [self refreshData];
////}
////
////- (void)refreshData {
////    if (self.dataSource.isLoading) {
////        if (!self.dataSource.isRefreshing && self.tableView.mj_header.isRefreshing) {
////            [self.tableView.mj_header endRefreshing];
////        }
////        return;
////    }
////    self.dataSource.isLoading = YES;    //loading中
////    self.dataSource.isRefreshing = YES; //下拉加载
////    [self loadDataWithPage:1];
////}
////
////- (void)loadMoreData {
////    if (self.dataSource.isLoading) {
////        if (self.dataSource.isRefreshing && self.tableView.mj_footer.isRefreshing) {
////            [self.tableView.mj_footer endRefreshing];
////        }
////        return;
////    }
////    self.dataSource.isLoading = YES; //loading中
////    self.dataSource.isRefreshing = NO;//上拉加载
////
////    [self loadDataWithPage:self.page + 1];
////}
////
////- (void)loadDataWithPage:(NSInteger)page {
////    NSString *typeId = self.seasonId;
//////    NSString *typeId = @"333";
////    NSString *type = @"DRAMA_COMMENT";
//////    BOOL spoiler = self.spoiler;
////    NSString *sort = self.sort;
////    NSInteger currentPage = page;
////    NSInteger size = self.rows;
////
////    WS(weakSelf)
////    [self.listApi requestDramaCommentListWithTypeId:typeId
////                                               type:type
//////                                            spoiler:spoiler
////                                               sort:sort
////                                               page:currentPage
////                                           pageSize:size
////                                              block:^(RRSeniorCommentsListModel *_Nonnull model, NSError *_Nonnull error) {
////        //        //测试代码
////        //        error = [[NSError alloc] init];
////        if (error) {
////            if (weakSelf.loadingView) {
////                if (weakSelf.loadingView.isHidden) {
////                    TOAST(@"加载失败");
////                } else {
////                    weakSelf.loadingView.msgType = RRMJLoadingErrorDefault;
////                    weakSelf.dataSource.error = error;
////                }
////            }
////            [weakSelf stopLoading];
////            return;
////        }
////        //        listArray = @[];
////
////        //page
////        weakSelf.page = currentPage;
////
////        weakSelf.loadingView.hidden = YES;
////        [weakSelf.dataSource appendDatas:model.content];
////        weakSelf.dataSource.isLoading = NO;
////        weakSelf.dataSource.isRefreshing = NO;
////        weakSelf.dataSource.noMoreData = model.isEnd;
////        weakSelf.dataSource.error = error;
////
////        if (weakSelf.commentRestricted) {
////            weakSelf.listCount = 0;
////        } else {
////            weakSelf.listCount = model.total;
////        }
////        [weakSelf stopLoading];
////    }];
////}
////
////- (void)stopLoading {
////
////    self.dataSource.isLoading = NO;
////    self.dataSource.isRefreshing = NO;
////
////    [self addHeader];
////    [self addFooter];
////    [self.tableView.mj_footer endRefreshing];
////    [self.tableView.mj_header endRefreshing];
////
////    if (self.dataSource.noMoreData) {
////        [self.tableView.mj_footer endRefreshingWithNoMoreData];
////    } else {
////        [self.tableView.mj_footer resetNoMoreData];
////    }
////
////    //loadingView
////    if (!self.loadingView.isHidden) {
////        self.tableView.hidden = YES;
////        self.bottomView.hidden = YES;
////        return;
////    }
////
////    if (self.commentRestricted) {
////        self.tableView.hidden = YES;
////        self.bottomView.hidden = YES;
////        self.noDataView.hidden = NO;
////        self.noDataView.placeText = @"抱歉，没有找到相关内容";
////    } else {
////
////        if (self.bottomView.isHidden == YES) {
////            //功能曝光
////            NSMutableDictionary *param = [NSMutableDictionary dictionary];
////            param[kRRUmengEventKeyModularName] = @"写影评";
////            param[kRRUmengEventKeyExposurePage] = self.rr_UMemgPageName;//剧集详情页
////            [RRUMengLogger logWithEventName:kRRUMengEventNameModularExposure params:[param copy]];
////        }
////
////        self.tableView.hidden = NO;
////        self.bottomView.hidden = NO;
////        self.noDataView.hidden = !self.dataSource.isNoData;
////        self.noDataView.placeText = @"快来发条影评抢沙发吧！";
////        [self.tableView reloadData];
////    }
////}
////
////- (void)addHeader {
////    if (self.tableView.mj_header) {
////        return;
////    }
////    @weakify(self)
////    MJDIYHeader *header = [MJDIYHeader headerWithRefreshingBlock:^{
////        @strongify(self)
////        [self refreshData];
////    }];
////    self.tableView.mj_header = header;
////}
////
////- (void)removeHeader {
////    if (self.tableView.mj_header) {
////        [self.tableView.mj_header endRefreshing];
////        self.tableView.mj_header = nil;
////    }
////}
////
////- (void)addFooter {
////    if (self.dataSource.dataArray.count <= 0) {
//////        self.tableView.mj_footer = nil;
////        [self removeFooter];
////        return;
////    }
////    if (self.tableView.mj_footer) {
////        return;
////    }
////    @weakify(self)
////    MJDIYFooter *footer = [MJDIYFooter footerWithRefreshingBlock:^{
////        @strongify(self)
////        [self loadMoreData];
////    }];
////    [footer setTitle:@"" forState:MJRefreshStateIdle];
////    [footer setTitle:@"" forState:MJRefreshStateRefreshing];
////    [footer setTitle:@"已经到底啦～" forState:MJRefreshStateNoMoreData];
////    footer.stateLabel.font = [UIFont systemFontOfSize:12];
////    footer.stateLabel.textColor = kCOLOR_85888F;
////    self.tableView.mj_footer = footer;
////}
////
////- (void)removeFooter {
////    if (self.tableView.mj_footer) {
////        [self.tableView.mj_footer endRefreshing];
////        self.tableView.mj_footer = nil;
////    }
////}
//
- (void)setupViews {
    [self createTableView];
    [self createbottomView];
//    [self.view bringSubviewToFront:self.noDataView];
}

- (void)createTableView {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(0));
        make.leading.equalTo(@(0));
        make.trailing.equalTo(@(0));
//        make.bottom.equalTo(@(-53 + appMargin().bottom));
        make.bottom.equalTo(@(0));
    }];
    self.tableView.hidden = YES;
}

- (void)createbottomView {
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(@(-16));
//        make.bottom.equalTo(@(-16 + appMargin().bottom));
        make.bottom.equalTo(@(-16));
        make.width.equalTo(@50);
        make.height.equalTo(@50);

    }];
    self.bottomView.hidden = YES;
}

- (void)clickSendBtn:(UIButton *)btn {
//    NSLog(@"发影评");
//    @weakify(self)
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self)
//        RRCreateFilmReviewViewController *vc = [[RRCreateFilmReviewViewController alloc] init];
//        vc.typeId = self.seasonId;
//        vc.delegate = self;
//        [[RRAppLinkManager sharedManager] pushViewController:vc animated:YES];
//    }];
//
//    //功能点击
//    NSMutableDictionary *parms = [NSMutableDictionary dictionary];
//    parms[kRRUmengEventKeySourcePage] = self.rr_UMemgPageName;//剧集详情页
//    parms[kRRUmengEventKeySourceChannel] = self.rr_UMemgChannelName;//影评
//    parms[kRRUmengEventKeyButtonName] = @"写影评";
//    [RRUMengLogger modularClickedWithParams:parms];
}

#pragma - mark RRCreateFilmReviewViewControllerDelegate
- (void)createFilmReviewViewCallBackModel:(RRSeniorCommentsModel *)model {
//    if (!model) {
//        return;
//    }
//    //逻辑：先移除元素，再插入到数组的第一个
//    RRSeniorCommentsModel *oldModel;
//    NSInteger oldModelIndex = -1;
//    NSInteger n = self.dataSource.dataArray.count;
//    for (NSInteger i = 0; i < n; i++) {
//        RRSeniorCommentsModel *obj = [self.dataSource.dataArray objectOrNilAtIndex:i];
//        if ([obj.ID isEqualToString:model.ID]) {
//            oldModel = obj;
//            oldModelIndex = i;
//            break;
//         }
//    }
//    //列表里已经存在 listCount不变
//    if (oldModel && oldModelIndex >= 0 ) {
//        [self.dataSource.dataArray removeObjectAtIndex:oldModelIndex];
//    } else {
//        //列表里已经不存在 listCount + 1
//        self.listCount = self.listCount + 1;
//    }
//
//    //刷新页面
//    [self.dataSource.dataArray insertObject:model atIndex:0];
//    [self stopLoading];
}

#pragma - mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
//    return self.dataSource.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    RRSeniorCommentsModel *model = [self.data objectOrNilAtIndex:indexPath.row];
    return [RRDramaCommentCell cellHeightWithModel:model isShowAll:NO];
}

//header高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0;
}

//footer高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0;
}

//自定义头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

//自定义脚
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RRDramaCommentCell *cell = (RRDramaCommentCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRDramaCommentCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.isHalf = YES;
    RRSeniorCommentsModel *model = [self.data objectOrNilAtIndex:indexPath.row];
    cell.model = model;
    WS(weakSelf)
//    cell.clickText = ^(RRSeniorCommentsModel *_Nonnull model) {
//        [weakSelf clickCommentWithModel:model];
//    };
    cell.clickDelete = ^(RRSeniorCommentsModel * _Nonnull model) {
        [weakSelf clickDeleteWithModel:model];
    };
//    cell.clickReplyListCell = ^(RRSeniorCommentsModel * _Nonnull commentModel, RRSeniorCommentsModel * _Nullable replyModel) {
//        [weakSelf clickReplyListCellWithCommentModel:commentModel replyModel:replyModel];
//    };

    cell.clickAllCell = ^(RRSeniorCommentsModel * _Nonnull model) {
        [weakSelf clickAllCellWithModel:model];
    };
//    if (!model.rr_contentContext) {
//        RRUmengContentContext *context = [[RRUmengContentContext alloc] init];
////        context.contentName = model.title;
//        context.contentID = model.ID;
//        context.contentType = kRRUmengEventContnetTypeDramaComment;
//        context.page = self.rr_UMemgPageName;
//        context.channel = self.rr_UMemgChannelName;
//        context.location = @(indexPath.row).stringValue;
//        context.seasonId = self.seasonId;
//        model.rr_contentContext = context;
//    }
//    cell.rr_statisticsExposureModel = model;
    return cell;

}

#pragma - mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //点击cell
    RRSeniorCommentsModel *model = [self.data objectOrNilAtIndex:indexPath.row];
    [self clickAllCellWithModel:model];
}

- (void)clickAllCellWithModel:(RRSeniorCommentsModel *)model {
//    RRDramaCommentDetailVC *next = [[RRDramaCommentDetailVC alloc] init];
//    next.dramaCommentId = model.ID;
//    next.passDramaCommentModel = model;
//    next.delegate = self;
//    [[RRAppLinkManager sharedManager] pushViewController:next animated:YES];
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if ([self.fatherVC respondsToSelector:@selector(scrollViewDidScroll:)]) {
//        [self.fatherVC scrollViewDidScroll:scrollView];
//    }
//}

//vc跳转删除
#pragma - mark RRDramaCommentDetailVCDelegate
- (void)dramaCommentDetailVC:(RRDramaCommentDetailVC *)vc deleteModel:(RRSeniorCommentsModel *)deleteModel {
    [self clickDeleteWithModel:deleteModel];
}

- (void)closeDramaCommentDetailVC:(RRDramaCommentDetailVC *)vc {
    if (!self.tableView.isHidden) {
        [self.tableView reloadData];
    }
}

//删除
- (void)clickDeleteWithModel:(RRSeniorCommentsModel *)model {
//    NSMutableArray *tempArr = [[NSMutableArray alloc] init];
//    for (RRSeniorCommentsModel *nowModel in self.dataSource.dataArray) {
//        if (![nowModel.ID isEqualToString:model.ID]) {
//            [tempArr addObject:nowModel];
//        }
//    }
//    [self.dataSource.dataArray removeAllObjects];
//    [self.dataSource appendDatas:tempArr];
//    [self.tableView reloadData];
//    self.listCount = self.listCount - 1;
}

#pragma - mark lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_1F2126;

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
        [_tableView registerClass:[RRDramaCommentCell class] forCellReuseIdentifier:NSStringFromClass([RRDramaCommentCell class])];

    }
    return _tableView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[RRDramaCommentBottomView alloc] initWithFrame:CGRectMake(0, 0, 320, 53)];
        _bottomView.backgroundColor = kCOLOR_1890FF;
        _bottomView.layer.cornerRadius = 25;
//        _bottomView.layer.masksToBounds = YES;
//        _bottomView.clipsToBounds = YES;
        [_bottomView.sendBtn addTarget:self action:@selector(clickSendBtn:) forControlEvents:UIControlEventTouchUpInside];
//        [_bottomView sketchShadowWithBottomBar];

        _bottomView.layer.shadowColor = [kCOLOR_1890FF colorWithAlphaComponent:0.3].CGColor;
        _bottomView.layer.shadowOffset = CGSizeMake(0,4);
        _bottomView.layer.shadowRadius = 15;
        _bottomView.layer.shadowOpacity = 1;
    }
    return _bottomView;
}

//- (RRDramaCommentListApi *)listApi {
//    if (!_listApi) {
//        _listApi = [[RRDramaCommentListApi alloc] init];
//    }
//    return _listApi;
//}

//- (void)setCommentRestricted:(BOOL)commentRestricted {
//    _commentRestricted = commentRestricted;
//    if (self.isViewLoaded && commentRestricted) {
//        _tableView.hidden = YES;
//        _bottomView.hidden = YES;
//        self.noDataView.hidden = NO;
//        self.noDataView.placeText = @"抱歉，没有找到相关内容";
//    }
//}
//
//- (void)refreshWithId:(NSString *)seasonId {
//    if (_seasonId == seasonId) {
//        return;
//    }
//    _seasonId = seasonId;
//    //页面是否已经显示
//    if ([self isViewLoaded]) {
//        //数据初始化
//        self.dataSource = [[RRDataSource alloc] init];
////        self.spoiler = YES;
//        self.sort = @"likeCount";
//        self.page = 1;
//        self.rows = 20;
////        self.isReplying = NO;
//        self.listCount = 0;
//
//        self.listApi = nil;
////        self.service = nil;
//        //页面初始化
//        [self.tableView removeFromSuperview];
//        [self.bottomView removeFromSuperview];
//        self.tableView = nil;
//        self.bottomView = nil;
//
//        [self setupViews];
//        [self refreshData];
//    }
//}

// 当iOS界面环境发生变化时，系统调用该方法。
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    [self.tableView reloadData];
}

- (void)dealloc {
}

- (NSString * _Nullable)rr_UMemgChannelName {
    return @"影评";
}

- (NSString *)rr_UMemgPageName {
    if ([self.seasonId isKindOfClass:[NSString class]] && self.seasonId.length) {
        return [self.seasonId stringByAppendingString:@"#@#剧集详情页"];
    }
    return @"剧集详情页";
}
@end
