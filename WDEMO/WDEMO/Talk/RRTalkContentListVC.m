//
//  RRTalkContentListVC.m
//  PPVideo
//
//  Created by rrtv on 2021/12/14.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRTalkContentListVC.h"
#import "RRTalkCommentCell.h"
#import "RRTalkContentListApi.h"
#import "RRTalkCommentDetailVC.h"

@interface RRTalkContentListVC () <UITableViewDataSource, UITableViewDelegate, RRTalkCommentDetailVCDelegate>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) RRDataSource *dataSource;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger rows;

//@property (nonatomic, assign) BOOL spoiler;    //是否剧透  TRUE是全部  FALSE 是过滤剧透
@property (nonatomic, copy) NSString *sort;       //排序:likeCount根据最热排序 createTime

@property (nonatomic, strong) NSObject *listApi;

//@property (nonatomic, assign) BOOL isReplying;
@end

@implementation RRTalkContentListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.customTabbar.hidden = YES;
    self.dataSource = [[RRDataSource alloc] init];
    
//    //    self.spoiler = YES;
//    self.sort = @"likeCount";
//
//    self.page = 1;
//    self.rows = 10;
//    //    self.isReplying = NO;
//
//    self.loadingView.hidden = NO;
//    self.loadingView.center = CGPointMake(self.view.centerX, self.view.centerY - 99 - appMargin().top);
//    self.noDataView.center = self.loadingView.center;
    
    self.loadingView.hidden = NO;
    self.loadingView.frame = CGRectMake(self.loadingView.frame.origin.x, 60, self.loadingView.frame.size.width, self.loadingView.frame.size.height);
    self.noDataView.frame =  self.loadingView.frame;
    
    [self setupViews];
    [self refreshData];
}

- (void)requestData {
    [self refreshData];
}

- (void)refreshData {
    if (self.dataSource.isLoading) {
        if (!self.dataSource.isRefreshing && self.tableView.mj_header.isRefreshing) {
            [self.tableView.mj_header endRefreshing];
        }
        return;
    }
    self.dataSource.isLoading = YES;    //loading中
    self.dataSource.isRefreshing = YES; //下拉加载
    [self loadDataWithPage:1];
}

- (void)loadMoreData {
    if (self.dataSource.isLoading) {
        if (self.dataSource.isRefreshing && self.tableView.mj_footer.isRefreshing) {
            [self.tableView.mj_footer endRefreshing];
        }
        return;
    }
    self.dataSource.isLoading = YES; //loading中
    self.dataSource.isRefreshing = NO;//上拉加载
    
    [self loadDataWithPage:self.page + 1];
}

- (void)loadDataWithPage:(NSInteger)page {
    
    NSString *talkId = self.talkId;
    NSString *orderType = self.orderType;
    NSInteger currentPage = page;
    NSInteger rows = 10;
    WS(weakSelf) 
    [RRTalkContentListApi requestTalkContentListWithTalkId:talkId
                                                 orderType:orderType
                                                      page:currentPage
                                                      rows:rows
                                                     block:^(RRTalkContentListModel * _Nonnull model, NSError * _Nonnull error) {
        //        //测试代码
        //        error = [[NSError alloc] init];
        if (error) {
            if (weakSelf.loadingView) {
                if (weakSelf.loadingView.isHidden) {
                    TOAST(@"加载失败");
                } else {
                    weakSelf.loadingView.msgType = RRMJLoadingErrorDefault;
                    weakSelf.dataSource.error = error;
                }
            }
            [weakSelf stopLoading];
            return;
        }
        //        listArray = @[];
//        model.content = @[];
//        model.isEnd = YES;
        
        //page
        weakSelf.page = currentPage;

        weakSelf.loadingView.hidden = YES;
        [weakSelf.dataSource appendDatas:model.content];
        weakSelf.dataSource.isLoading = NO;
        weakSelf.dataSource.isRefreshing = NO;
        weakSelf.dataSource.noMoreData = model.isEnd;
        weakSelf.dataSource.error = error;

//        if (weakSelf.commentRestricted) {
//            weakSelf.listCount = 0;
//        } else {
//            weakSelf.listCount = model.total;
//        }
        [weakSelf stopLoading];
       
    }];
 
}

- (void)stopLoading {
    
        self.dataSource.isLoading = NO;
        self.dataSource.isRefreshing = NO;
    
        [self addHeader];
        [self addFooter];
        [self.tableView.mj_footer endRefreshing];
        [self.tableView.mj_header endRefreshing];
    
        if (self.dataSource.noMoreData) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        } else {
            [self.tableView.mj_footer resetNoMoreData];
        }
    
//        //loadingView
//        if (!self.loadingView.isHidden) {
//            self.tableView.hidden = YES;
//            self.bottomView.hidden = YES;
//            return;
//        }
    
//        if (self.commentRestricted) {
//            self.tableView.hidden = YES;
//            self.bottomView.hidden = YES;
//            self.noDataView.hidden = NO;
//            self.noDataView.imageName = @"img_empty_states_comment_close";
//            self.noDataView.placeText = @"抱歉，没有找到相关影评";
//        } else {
//
//            if (self.bottomView.isHidden == YES) {
//                //功能曝光
//                NSMutableDictionary *param = [NSMutableDictionary dictionary];
//                param[kRRUmengEventKeyModularName] = @"写影评";
//                param[kRRUmengEventKeyExposurePage] = self.rr_UMemgPageName;//剧集详情页
//                [RRUMengLogger logWithEventName:kRRUMengEventNameModularExposure params:[param copy]];
//            }
    
//            self.tableView.hidden = NO;
//            self.bottomView.hidden = NO;
            self.noDataView.hidden = !self.dataSource.isNoData;
            self.noDataView.imageName = @"img_empty_states_no_comment";
            self.noDataView.placeText = @"请描述你的观点，让我们一起来讨论吧";
            [self.tableView reloadData];
     
//        }
}

- (void)addHeader {
    if (self.tableView.mj_header) {
        return;
    }
    @weakify(self)
    MJDIYHeader *header = [MJDIYHeader headerWithRefreshingBlock:^{
        @strongify(self)
        [self refreshData];
    }];
    self.tableView.mj_header = header;
}

- (void)removeHeader {
    if (self.tableView.mj_header) {
        [self.tableView.mj_header endRefreshing];
        self.tableView.mj_header = nil;
    }
}

- (void)addFooter {
    if (self.dataSource.dataArray.count <= 0) {
        //        self.tableView.mj_footer = nil;
        [self removeFooter];
        return;
    }
    if (self.tableView.mj_footer) {
        return;
    }
    @weakify(self)
    MJDIYFooter *footer = [MJDIYFooter footerWithRefreshingBlock:^{
        @strongify(self)
        [self loadMoreData];
    }];
    [footer setTitle:@"" forState:MJRefreshStateIdle];
    [footer setTitle:@"" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"已经到底啦～" forState:MJRefreshStateNoMoreData];
    footer.stateLabel.font = [UIFont systemFontOfSize:12];
    footer.stateLabel.textColor = kCOLOR_85888F;
    self.tableView.mj_footer = footer;
}

- (void)removeFooter {
    if (self.tableView.mj_footer) {
        [self.tableView.mj_footer endRefreshing];
        self.tableView.mj_footer = nil;
    }
}

- (void)setupViews {
    [self createTableView];
//    [self createbottomView];
    [self.view bringSubviewToFront:self.noDataView];
    [self.view bringSubviewToFront:self.loadingView];

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
    self.tableView.hidden = NO;
    
    self.scrollView = self.tableView;
}

//- (void)createbottomView {
//    [self.view addSubview:self.bottomView];
//    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.trailing.equalTo(@(-16));
//        //        make.bottom.equalTo(@(-16 + appMargin().bottom));
//        make.bottom.equalTo(@(-16));
//        make.width.equalTo(@50);
//        make.height.equalTo(@50);
//
//    }];
//    self.bottomView.hidden = YES;
//}

//- (void)clickSendBtn:(UIButton *)btn {
//    NSLog(@"发影评");
//    [[RRAppLinkManager sharedManager] goFilmReviewWithSeasonId:self.seasonId model:nil delegate:self toRoot:NO];
//    //功能点击
//    NSMutableDictionary *parms = [NSMutableDictionary dictionary];
//    parms[kRRUmengEventKeySourcePage] = self.rr_UMemgPageName;//剧集详情页
//    parms[kRRUmengEventKeySourceChannel] = self.rr_UMemgChannelName;//影评
//    parms[kRRUmengEventKeyButtonName] = @"写影评";
//    [RRUMengLogger modularClickedWithParams:parms];
//}

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
//        }
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

- (void)createTalkContentModel:(RRTalkContentModel *)model {
    
    if (self.dataSource.dataArray) {
        //刷新页面
        [self.dataSource.dataArray insertObject:model atIndex:0];
        [self stopLoading];
    }
  
}
 
#pragma - mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    RRTalkContentModel *talkContentModel = [self.dataSource.dataArray objectOrNilAtIndex:indexPath.row];
    RRSeniorCommentsModel *model = talkContentModel.contentInfo;
    return [RRTalkCommentCell cellHeightWithModel:model isShowAll:NO];
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
    RRTalkContentModel *talkContentModel = [self.dataSource.dataArray objectOrNilAtIndex:indexPath.row];
    RRSeniorCommentsModel *model = talkContentModel.contentInfo;
    RRTalkCommentCell *cell = (RRTalkCommentCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRTalkCommentCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.isHalf = NO;
    cell.model = model;
    WS(weakSelf)
    //    cell.clickText = ^(RRSeniorCommentsModel *_Nonnull model) {
    //        [weakSelf clickCommentWithModel:model];
    //    };
    cell.clickDelete = ^(RRSeniorCommentsModel * _Nonnull model) {
        [weakSelf clickDeleteWithModel:model];
    };
    cell.clickFullText = ^(RRSeniorCommentsModel * _Nonnull model) {
        [weakSelf clickAllCellWithModel:model];
    };
    cell.clickPraise = ^(RRSeniorCommentsModel * _Nonnull model) {
        [weakSelf clickPraiseWithModel:model];
    };
    cell.showDrama = ^(RRSeniorCommentsModel * _Nonnull model) {
        [weakSelf showDramaWithModel:model];
    };
    cell.clickDrama = ^(RRSeniorCommentsModel * _Nonnull model) {
        [weakSelf clickDramaWithModel:model];
    };
    //评论曝光：UM_Event_CommentExposure（只爆一级评论）
    NSMutableDictionary *parms = [NSMutableDictionary dictionary];
    parms[kRRUmengEventKeyCommentID] = model.ID;
    parms[kRRUmengEventKeyContentType] = kRRUmengEventContnetTypeTalkComment;
    parms[kRRUmengEventKeySourcePage] = self.rr_UMemgPageName;
    parms[kRRUmengEventKeySourceChannel] = self.rr_UMemgChannelName;
    parms[kRRUmengEventKeyPublisherID] = model.author.ID;
    [RRUMengLogger modularCommentExposureWithParams:parms];
    
    return cell;
    
}

#pragma - mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //点击cell
    RRTalkContentModel *talkContentModel = [self.dataSource.dataArray objectOrNilAtIndex:indexPath.row];
    RRSeniorCommentsModel *model = talkContentModel.contentInfo; 
    [self clickAllCellWithModel:model];
 
}

#pragma - mark RRTalkCommentDetailVCDelegate
- (void)talkCommentDetailVC:(RRTalkCommentDetailVC *)vc deleteModel:(RRSeniorCommentsModel *)deleteModel {
    [self clickDeleteWithModel:deleteModel];
}

- (void)closeTalkCommentDetailVC:(RRTalkCommentDetailVC *)vc {
    if (!self.tableView.isHidden) {
        [self.tableView reloadData];
    }
}

//点击整个cell
- (void)clickAllCellWithModel:(RRSeniorCommentsModel *)model {
    //    RRDramaCommentDetailVC *next = [[RRDramaCommentDetailVC alloc] init];
    //    next.dramaCommentId = model.ID;
    //    next.passDramaCommentModel = model;
    //    next.delegate = self;
    //    [[RRAppLinkManager sharedManager] pushViewController:next animated:YES];
     
    RRTalkCommentDetailVC *next = [[RRTalkCommentDetailVC alloc] init];
    next.commentModel = model;
    next.delegate = self;
    next.orderType = self.orderType; 
    [self pushViewController:next animated:YES];
}

//删除
- (void)clickDeleteWithModel:(RRSeniorCommentsModel *)model {
    NSMutableArray *tempArr = [[NSMutableArray alloc] init];
    for (RRTalkContentModel *talkContentModel in self.dataSource.dataArray) {
        RRSeniorCommentsModel *nowModel = talkContentModel.contentInfo;
        if (![nowModel.ID isEqualToString:model.ID]) {
            [tempArr addObject:talkContentModel];
        }
    }
    [self.dataSource.dataArray removeAllObjects];
    [self.dataSource appendDatas:tempArr];
//    self.listCount = self.listCount - 1;
    [self.tableView reloadData];
    [self stopLoading];
}

//点赞
- (void)clickPraiseWithModel:(RRSeniorCommentsModel *)model {
    //内容点赞
    NSMutableDictionary *parms = [NSMutableDictionary dictionary];
    parms[kRRUmengEventKeySourcePage] = self.rr_UMemgPageName;
    parms[kRRUmengEventKeySourceChannel] = self.rr_UMemgChannelName;
    parms[kRRUmengEventKeyCommentID] = model.ID;
    parms[kRRUmengEventKeyLikeType] = kRRUmengEventContnetTypeTalkComment;
    parms[kRRUmengEventKeyPublisherID] = model.author.ID;
    [RRUMengLogger modularContentLikeWithParams:parms];
}
 
//显示卡片
- (void)showDramaWithModel:(RRSeniorCommentsModel *)model {
    
    if (model.drama.enable) {
        //内容曝光
        NSMutableDictionary *paramDict = [NSMutableDictionary dictionary];
        paramDict[kRRUmengEventKeyContentName] = model.drama.title;
//        paramDict[kRRUmengEventKeyContentID] =  model.drama.dramaId;
        //讨论ID#@#剧集ID
        paramDict[kRRUmengEventKeyContentID] =  [NSString stringWithFormat:@"%@#@#%@", model.ID, model.drama.dramaId];
        paramDict[kRRUmengEventKeyContentType] = kRRUmengEventVideoTypeValueLongVideo;
        paramDict[kRRUmengEventKeyExposurePage] = self.rr_UMemgPageName;
        paramDict[kRRUmengEventKeyExposureChannel] = self.rr_UMemgChannelName;
//        paramDict[kRRUmengEventKeyRecSource] = self.recSource;
        [RRUMengLogger logWithEventName:kRRUMengEventNameContentExposure params:paramDict];
    }
}

//点击卡片
- (void)clickDramaWithModel:(RRSeniorCommentsModel *)model {
    
    BOOL enable = model.drama.enable;
    if (enable) {
        NSString *dramaId = model.drama.dramaId;
        [[RRAppLinkManager sharedManager] goSeasonDetail:dramaId title:nil isMovie:NO toRoot:NO];
    }
    
    if (model.drama.enable) {
        //内容点击
        NSMutableDictionary *paramDict = [NSMutableDictionary dictionary];
        paramDict[kRRUmengEventKeyContentName] = model.drama.title;
//        paramDict[kRRUmengEventKeyContentID] =  model.drama.dramaId;
        //讨论ID#@#剧集ID
        paramDict[kRRUmengEventKeyContentID] =  [NSString stringWithFormat:@"%@#@#%@", model.ID, model.drama.dramaId];
        paramDict[kRRUmengEventKeyContentType] = kRRUmengEventVideoTypeValueLongVideo;
        paramDict[kRRUmengEventKeySourcePage] = self.rr_UMemgPageName;
        paramDict[kRRUmengEventKeySourceChannel] = self.rr_UMemgChannelName;
        //        paramDict[kRRUmengEventKeyRecSource] = self.recSource;
        [RRUMengLogger logWithEventName:kRRUMengEventNameContentClick params:paramDict];
    }
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
        [_tableView registerClass:[RRTalkCommentCell class] forCellReuseIdentifier:NSStringFromClass([RRTalkCommentCell class])];
 
    }
    return _tableView;
}

// 当iOS界面环境发生变化时，系统调用该方法。
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    [self.tableView reloadData];
}

- (void)dealloc {
}

- (NSString *)rr_UMemgChannelName {
    if ([self.orderType isEqualToString:@"hot"]) {
        return @"热门";
    } else if ([self.orderType isEqualToString:@"new"]) {
        return @"最新";
    } else {
        return @"";
    }
}

- (NSString *)rr_UMemgPageName {
    if ([self.talkId isKindOfClass:[NSString class]] && self.talkId.length) {
        return [NSString stringWithFormat:@"%@#@#话题详情页", self.talkId];
    }
    return @"话题详情页";
}
@end


