//
//  RRMessageSeasonCommentPositionListVC.m
//  PUClient
//
//  Created by WDEMO on 2021/6/1.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRMessageSeasonCommentPositionListVC.h"
#import "RRSeasonSeniorCommentsTextImageDetailBtnCell.h"
#import "RRSeasonSeniorCommentsReplyTextImageCell.h"
//#import "RRQuicklookPushViewController.h"
//#import "PriseDynamicApi.h"

@interface RRMessageSeasonCommentPositionListVC () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,copy)NSString *sendType; //类型
@end

@implementation RRMessageSeasonCommentPositionListVC

//- (instancetype)initWithIsHalf:(BOOL)isHalf {
//    self = [super init];
//    if (self) {
//        _service = [[RRCommentService alloc] init];
//    }
//    return self;
//}

- (instancetype)init {
    self = [super init];
    if (self) {
//        _service = [[RRCommentService alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.customTabbar.hidden = NO;
//    self.customTabbar.navTitle.text = @"回复详情";
//    self.dataSource = [[RRDataSource alloc] init];
//    self.page = 0;
//    self.rows = 20;
//    self.isShowMore = NO;
//    //发送消息的type
//    if ([self.targetType isEqualToString:@"season"]) {
//        self.sendType = @"SEASON";
//    } else if ([self.targetType isEqualToString:@"video"]) {
//        self.sendType = @"VIDEO";
//    } else {
//        self.sendType = @"";
//    }
//
//    self.loadingView.hidden = NO;
////    self.loadingView.center = CGPointMake(self.view.centerX, self.view.centerY - 99 - appMargin().top);
////    self.noDataView.center = self.loadingView.center;
//    [self setupViews];
//    [self.view bringSubviewToFront:self.loadingView];
//    [self.view bringSubviewToFront:self.noDataView];
//    [self refreshData];
    
    [self setupViews];
    [self refreshData];
}

- (void)refreshData {
    
    //iOS 读取本地Json文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"消息回复详情" ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
    NSError *error;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (!jsonData || error) {
        //DLog(@"JSON解码失败");
    } else {
        //DLog(@"JSON解码成功");
    }
    NSDictionary *dic = (NSDictionary *)jsonObj;
    RRCommentPositionListModel *model = [RRCommentPositionListModel modelWithJSON:dic[@"data"]];
    self.commentModel = model.parentCommentView;
    self.data = [NSMutableArray arrayWithArray:model.pageView.content];
    [self.tableView reloadData];
    
}

//- (void)requestData {
//    [self refreshData];
//}
//
//- (void)refreshData {
//    if (self.dataSource.isLoading) {
//        if (!self.dataSource.isRefreshing && self.tableView.mj_header.isRefreshing) {
//            [self.tableView.mj_header endRefreshing];
//        }
//        return;
//    }
//    self.dataSource.isLoading = YES;    //loading中
//    self.dataSource.isRefreshing = YES; //下拉加载
//    [self loadDataWithPage:0];
//}
//
//- (void)loadMoreData {
//    if (self.dataSource.isLoading) {
//        if (self.dataSource.isRefreshing && self.tableView.mj_footer.isRefreshing) {
//            [self.tableView.mj_footer endRefreshing];
//        }
//        return;
//    }
//    self.dataSource.isLoading = YES;
//    self.dataSource.isRefreshing = NO;
//
//    [self loadDataWithPage:self.page + 1];
//}
//
//- (void)loadDataWithPage:(NSInteger)page {
//
//    NSString *commentId = self.commentId;
//    NSString *replyId = self.replyId;
//    NSInteger currentPage = page;
//    NSInteger size = self.rows;
//    BOOL isNew = self.isNew;
//    BOOL parentCommentDisplay = NO;
//    if (!self.commentModel) {
//        parentCommentDisplay = YES;
//    }
//    @weakify(self)
//    [RRCommentPositionListApi requestCommentPositionListWithParentId:commentId
//                                                           commentId:replyId
//                                                parentCommentDisplay:parentCommentDisplay
//                                                               isNew:isNew
//                                                                page:currentPage
//                                                                rows:size
//                                                               block:^(RRCommentPositionListModel * _Nonnull model, NSError * _Nonnull error) {
//        @strongify(self)
//        //        //测试代码
//        //        error = [[NSError alloc] init];
//        if (error) {
//            self.loadingView.msgType = RRMJLoadingErrorDefault;
//            self.dataSource.error = error;
//            [self stopLoading];
//            self.noDataView.hidden = YES;
//            return;
//        }
//        //        listArray = @[];
//
//        self.loadingView.hidden = YES;
//
//        if (!self.commentModel) {
//            if (model.parentCommentView) {
//                self.commentModel = model.parentCommentView;
//                //显示
//                self.bottomView.hidden = NO;
//                self.bottomView.commentModel = self.commentModel;
//            } else {
//                //没有model.parentCommentView，说明主评论被删除了，所以手动把回复列表删除
//                model.pageView.content = @[];
//            }
//        }
//        [self.dataSource appendDatas:model.pageView.content];
//        self.page = model.currentPage;
//
//        self.dataSource.noMoreData = model.pageView.content.count < size ? YES : NO;
//        self.dataSource.isLoading = NO;
//        self.dataSource.isRefreshing = NO;
//        [self addHeader];
//        [self addFooter];
//        [self stopLoading];
//    }];
//}
//
//- (void)stopLoading {
//    [self.tableView.mj_footer endRefreshing];
//    [self.tableView.mj_header endRefreshing];
//
//    self.dataSource.isLoading = NO;
//    self.dataSource.isRefreshing = NO;
//    if (self.dataSource.noMoreData) {
//        [self.tableView.mj_footer endRefreshingWithNoMoreData];
//    } else {
//        [self.tableView.mj_footer resetNoMoreData];
//    }
//    if (!self.commentModel) {
//        self.noDataView.hidden = NO;
//    } else {
////        self.noDataView.hidden = !self.dataSource.isNoData;
//        self.noDataView.hidden = YES;
//    }
//    //    self.noDataView.placeText = @"抱歉，没有找到相关内容";
//    self.noDataView.placeText = @"原评论已删除";
//    self.noDataView.imageName = @"ic_reply_delete";
//    [self.tableView reloadData];
//    [self tableViewLocation];
//}
//
//- (void)addHeader {
////    if (self.dataSource.dataArray.count <= 0) {
////        self.tableView.mj_header = nil;
////        return;
////    }
//    if (!self.commentModel) {
//        self.tableView.mj_header = nil;
//        return;
//    }
//
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
//- (void)addFooter {
////    if (self.dataSource.dataArray.count <= 0) {
////        self.tableView.mj_footer = nil;
////        return;
////    }
//    if (!self.commentModel) {
//        self.tableView.mj_footer = nil;
//        return;
//    }
//
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

- (void)createTableViewSectionHeader {
    //    NSInteger count = 10;
    //    NSString *text = [NSString stringWithFormat:@"%zi条回复", count];
    NSString *text = @"";
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 21)];
    UILabel *headerLab = [[UILabel alloc] init];
    headerLab.frame = CGRectMake(16, 0, KWidth - 16 * 2, 21);
    headerLab.font = RR_MEDIUMFONT(17);
    headerLab.textColor = kCOLOR_dynamicProvider_222222_E5E7EB;
    headerLab.text = text;
    [header addSubview:headerLab];
    _header = header;
    _headerLab = headerLab;
}

//定位
- (void)tableViewLocation {
    if (!self.replyId) {
        return;
    }
    if (self.data.count <= 0) {
        return;
    }

    NSInteger index = -1;
    for (NSInteger i = 0; i < self.data.count; i++) {
        RRSeniorCommentsModel *model = [self.data objectOrNilAtIndex:i];
        if ([model.ID isEqualToString:self.replyId]) {
            index = i;
            break;
        }
    }

    if (index < 0) {
        self.replyId = nil;
        return;
    }
    //获取到需要跳转位置的行数
    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:index inSection:1];
    //滚动到其相应的位置
    [self.tableView scrollToRowAtIndexPath:scrollIndexPath
            atScrollPosition:UITableViewScrollPositionTop animated:NO];

    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:1]];
//    cell.contentView.backgroundColor = [UIColor redColor];
    UIView *colorView = [[UIView alloc] initWithFrame:cell.bounds];
    colorView.backgroundColor = [kCOLOR_0091FF colorWithAlphaComponent:0.08];
    [cell.contentView addSubview:colorView];
    [cell.contentView sendSubviewToBack:colorView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [colorView removeFromSuperview];
    });
    self.replyId = nil;
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
    
    [self createTableViewSectionHeader];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    self.bottomView.hidden = YES;
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(53 - appMargin().bottom));
        make.leading.equalTo(@(0));
        make.trailing.equalTo(@(0));
        make.bottom.equalTo(@(0));
    }];
    
    //        if (!self.isHalf) {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.customTabbar.mas_bottom);
        make.top.equalTo(@(0));
        make.leading.equalTo(@(0));
        make.trailing.equalTo(@(0));
        make.bottom.equalTo(self.bottomView.mas_top).offset(0);
    }];
}

#pragma mark - 回复
- (void)clickTextBtn:(UIButton *)btn {
//    //老评论
//    NSString *str = [NSString stringWithFormat:@"回复%@", self.commentModel.author.nickName ?: @""];
//    WS(weakSelf);
//    [self.service showSingleTextType:RRCommentViewTypeReplyComment placeholder:str superView:nil submitBlock:^(NSString * _Nonnull content) {
//        DLog(@"%@",content);
//        [weakSelf articleReplay:content toComment:self.commentModel toReplyModel:nil imageArray:nil];
//
//    }];
}

#pragma mark - 点赞
- (void)clickPraiseBtn:(UIButton *)btn {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            NSString *typeId = self.commentModel.ID;
//            BOOL liked = self.commentModel.liked;
//            @weakify(self);
//            PriseDynamicApi *api = [[PriseDynamicApi alloc] initWithDynamic:typeId andDel:liked ? @"YES" : @""];
//            [api startWithCompletionBlock:^(RRJsonModel *result, NSError *error) {
//                @strongify(self);
//                if (!result) {
//                    TOAST(error.localizedDescription);
//                    return;
//                } else {
//                    if (!liked) {
//                        if (result.code == 0 || result.code == 3001) {//"code": "3001", "msg": "已经添加过收藏",
//                            TOAST(@"点赞成功");
//                            self.commentModel.liked = YES;
//                            self.commentModel.likeCount = self.commentModel.likeCount + 1;
//                            self.bottomView.commentModel = self.commentModel;
//
//                        } else {
//                            TOAST(result.msg);
//                        }
//                    } else {
//                        if (result.code == 0 || result.code == 3002) {//"code": "3001", "msg": "已经添加过收藏",
//                            TOAST(@"取消点赞");
//                            self.commentModel.liked = NO;
//                            self.commentModel.likeCount = self.commentModel.likeCount - 1;
//                            self.bottomView.commentModel = self.commentModel;
//
//                        } else {
//                            TOAST(result.msg);
//                        }
//                    }
//                }
//            }];
//        }
//    }];
}

////旧评论
////老评论
////发评论
//- (void)articleReplay:(NSString *)content toComment:(RRSeniorCommentsModel *)commentModel toReplyModel:(RRSeniorCommentsModel *)replyModel imageArray:(NSArray *)imageArray{
//
//    WS(weakSelf);
//    if (content.length < 3) {
//        [IanAlert alertError:@"请至少输入3个字" length:TIMELENGTH];
//        return;
//    }
//    if (self.isReplying) {
//        return;
//    }
//    self.isReplying = YES;
//
//    [IanAlert showLoading:@"发送中"];
//    NSString *commentId = commentModel.ID;//父id
//    NSString *replyId = replyModel.ID;  //子id
//    NSString *reply2UseId = replyModel.author.ID;
//    NSString *typeId = commentModel.typeId;
//
//    [[[RRCommentCreateApi alloc] initCommentWithCommentType:self.sendType commentID:typeId content:content imageArray:nil parentId:commentId reply2Id:replyId reply2UseId:reply2UseId] startWithCompletionBlock:^(RRJsonModel *result, NSError *error) {
//        weakSelf.isReplying = NO;
//        if (error) {
//            [IanAlert alertError:error.localizedDescription length:TIMELENGTH];
//        } else {
//            if (result.code == SUCCESSCODE) {
//                [IanAlert alertSuccess:@"评论成功" length:TIMELENGTH];
////                [[NSNotificationCenter defaultCenter] postNotificationName:BBSPublishVCCommentArticlePopView object:self userInfo:nil];
////                [weakSelf.service closeReplyView];
////                [weakSelf refreshData];
//
//                [weakSelf.service closeReplyView];
//                RRSeniorCommentsModel *resultModel = [RRSeniorCommentsModel modelWithDictionary:result.data];
//                [weakSelf replayBackResultModel:resultModel];
//
//            } else if (result.code == 3001){
//                [IanAlert alertError:@"发评论太快,至少间隔30秒" length:TIMELENGTH];
//
//            } else if (result.code == 3002){
//                [IanAlert alertError:@"已经提交过了,请别重复提交" length:TIMELENGTH];
//
//            } else {
//                [IanAlert alertError:result.msg length:TIMELENGTH];
//            }
//        }
//    }];
//}

//tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return self.commentModel ? 1 : 0;
            break;
        default:
            return self.data.count;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //     return [ArticleDetailCell cellHeightfor:model];
    NSInteger section = indexPath.section;
    switch (section) {
        case 0:
        {
            return [RRSeasonSeniorCommentsTextImageDetailBtnCell cellHeightWithModel:self.commentModel isShowAll:    self.isShowMore];
        }
            break;
        default:
        {
            RRSeniorCommentsModel *model = [self.data objectOrNilAtIndex:indexPath.row];
            return [RRSeasonSeniorCommentsReplyTextImageCell cellHeightWithModel:model];
        }
            break;
    }
}

//header高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 1:
            return 21.0;
            break;
        default:
            return 0.1;
            break;
    }
}

//footer高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 10.0;
            break;
        default:
            return 0.1;
            break;
    }
}

//自定义头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
        {
            return [[UIView alloc] init];
        }
            break;
        default:
        {
            NSInteger count = self.commentModel.replyCount;
            NSString *countStr = [NSString transformCountWithString:count];
            NSString *text = @"";
            if (countStr.length > 0) {
                text = [NSString stringWithFormat:@"%@条回复", countStr];
            }
            _headerLab.text = text;
            return _header;
        }
            break;
    }
    
}

//自定义脚
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    switch (section) {
        case 0:
        {
            RRSeasonSeniorCommentsTextImageDetailBtnCell *cell = (RRSeasonSeniorCommentsTextImageDetailBtnCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRSeasonSeniorCommentsTextImageDetailBtnCell class]) forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.isHalf = NO;
            cell.isShowMore = self.isShowMore;
            cell.model = self.commentModel;
            cell.praiseBtn.hidden = YES;
            WS(weakSelf)
            //            cell.clickText = ^(RRSeniorCommentsModel * _Nonnull model) {
            //                [weakSelf clickCommentWithModel:model];
            //            };
            cell.clickDelete = ^(RRSeniorCommentsModel * _Nonnull model) {
                [weakSelf clickDeleteCommentWithModel:model];
            };
            cell.clickFullText = ^(RRSeniorCommentsModel * _Nonnull model) {
                weakSelf.isShowMore = YES;
                [weakSelf.tableView reloadData];
            };
            cell.clickCutText = ^(RRSeniorCommentsModel * _Nonnull model) {
                weakSelf.isShowMore = NO;
                [weakSelf.tableView reloadData];
            };
            cell.clickDetail = ^(RRSeniorCommentsModel * _Nonnull model) {
               [weakSelf clickCellDetail];
            };
            return cell;
        }
            break;
            
        default:{
            RRSeasonSeniorCommentsReplyTextImageCell *cell = (RRSeasonSeniorCommentsReplyTextImageCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRSeasonSeniorCommentsReplyTextImageCell class]) forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.isHalf = NO;
            RRSeniorCommentsModel *model = [self.data objectOrNilAtIndex:indexPath.row];
            cell.model = model;
            WS(weakSelf)
            //            cell.clickText = ^(RRSeniorCommentsModel * _Nonnull model) {
            //                [weakSelf clickReplyWithModel:model];
            //
            //            };
            cell.clickDelete = ^(RRSeniorCommentsModel * _Nonnull model) {
                [weakSelf clickDeleteReplyWithModel:model];
            };
            return cell;
        }
            break;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    switch (section) {
        case 0:
        {
            //点击cell回复评论
            RRSeniorCommentsModel *model = self.commentModel;
            [self clickCommentWithModel:model];
        }
            break;
        default:
        {
            //点击cell回复回复
            RRSeniorCommentsModel *model = [self.data objectOrNilAtIndex:indexPath.row];
            [self clickReplyWithModel:model];
        }
            break;
    }
}

//lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
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
        [_tableView registerClass:[RRSeasonSeniorCommentsTextImageDetailBtnCell class] forCellReuseIdentifier:NSStringFromClass([RRSeasonSeniorCommentsTextImageDetailBtnCell class])];
        [_tableView registerClass:[RRSeasonSeniorCommentsReplyTextImageCell class] forCellReuseIdentifier:NSStringFromClass([RRSeasonSeniorCommentsReplyTextImageCell class])];
        
        
        //        WS(weakSelf)
        //        MJDIYFooter *footer = [MJDIYFooter footerWithRefreshingBlock:^{
        ////            [weakSelf loadMoreData];
        ////            [[RRLogSDK sharedRRLogSDK] logAliWithId:RRStatisticsSeasonCommentLoadMore itemId:weakSelf.seasonId externDict:nil];
        //        }];
        //        [footer setTitle:@"已经到底啦～" forState:MJRefreshStateNoMoreData];
        //        _tableView.mj_footer = footer;
        //        _tableView.mj_header = [MJDIYHeader headerWithRefreshingBlock:^{
        ////            [weakSelf refreshData];
        //        }];
        
        //        RRSeasonSeniorCommentHearder *header = [[RRSeasonSeniorCommentHearder alloc] initWithFrame:CGRectMake(0, 0, KWidth, 42)];
        //        header.clickStatusIndex = ^(UIResponder *sender, NSUInteger index) {
        //
        //        };
        //        header.clickSwichIndex = ^(UIResponder *sender, NSUInteger index) {
        //
        //        };
        //        _tableView.tableHeaderView = header;
    }
    return _tableView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[RRSeasonSeniorCommentsPraiseBtnInputBar alloc] initWithFrame:CGRectMake(0, 0, 320, 53)];
        [_bottomView.textBoxBtn addTarget:self action:@selector(clickTextBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView.praiseBtn addTarget:self action:@selector(clickPraiseBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_bottomView];
        //        [_bottomView sketchShadowWithOffsetX:0 offsetY:0 Blur:15 Spread:0 color:kCOLOR_dynamicProvider_Shadow_bar_000000Alpha008_000000Alpha14 alpha:1];
//        [_bottomView sketchShadowWithBottomBar];
    }
    return _bottomView;
}

//- (RRCommentService *)service {
//    if (!_service) {
//        _service = [[RRCommentService alloc] init];
//    }
//    return _service;
//}
//- (NSString *)rr_UMemgPageName {
//    return @"剧集详情页";
//}
//
//- (NSString *)rr_UMemgChannelName {
//    return @"详情";
//}

//查看详情
- (void)clickCellDetail {
    if ([self.targetType isEqualToString:@"season"]) {
//        [[RRAppLinkManager sharedManager] goSeasonDetail:self.targetTypeId title:nil isMovie:NO toRoot:NO];
    } else if ([self.targetType isEqualToString:@"video"]) {
        
//        NSString *currentId = self.targetTypeId;
//        NSMutableArray *idsArray = [NSMutableArray arrayWithArray:@[currentId]];
//        RRQuicklookPushViewController *quicklookPushViewController = [RRQuicklookPushViewController new];
//        quicklookPushViewController.quickModelArray = idsArray;
//        quicklookPushViewController.currentId = currentId;
//        quicklookPushViewController.quickLookPageSize = 10;
////        quicklookPushViewController.delegate = self;
////        quicklookPushViewController.page = self.dataSource.page;
//        [[RRAppLinkManager sharedManager] pushViewController:quicklookPushViewController animated:YES];
        
        
    } else {
        return;;
    }
}

//回复
- (void)clickCommentWithModel:(RRSeniorCommentsModel *)model {
//    //老评论
//    NSString *str = [NSString stringWithFormat:@"回复%@", model.author.nickName ?: @""];
//    WS(weakSelf);
//    [self.service showSingleTextType:RRCommentViewTypeReplyComment placeholder:str superView:nil submitBlock:^(NSString * _Nonnull content) {
//        DLog(@"%@",content);
//        [weakSelf articleReplay:content toComment:self.commentModel toReplyModel:model imageArray:nil];
//    }];
}

//回复
- (void)clickReplyWithModel:(RRSeniorCommentsModel *)model {
//    //老评论
//    NSString *str = [NSString stringWithFormat:@"回复%@", model.author.nickName ?: @""];
//    WS(weakSelf);
//    [self.service showSingleTextType:RRCommentViewTypeReplyComment placeholder:str superView:nil submitBlock:^(NSString * _Nonnull content) {
//        DLog(@"%@",content);
//        [weakSelf articleReplay:content toComment:self.commentModel toReplyModel:model imageArray:nil];
//    }];
}

////二级回复
//- (void)replayBackResultModel:(RRSeniorCommentsModel *)model {
//    [self.dataSource.dataArray insertObject:model atIndex:0];
//    self.commentModel.replyCount = self.commentModel.replyCount + 1;
//    [self.tableView reloadData];
//    //获取到需要跳转位置的行数
//    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:1];
//    //滚动到其相应的位置
//    [self.tableView scrollToRowAtIndexPath:scrollIndexPath
//                          atScrollPosition:UITableViewScrollPositionTop animated:NO];
//}

////三级回复
//- (void)replayBackResultLevelThreeModel:(RRSeniorCommentsModel *)model {
//    //    [self.dataSource.dataArray addObject:model];
//    [self.dataSource.dataArray insertObject:model atIndex:0];
//    self.commentModel.replyCount = self.commentModel.replyCount + 1;
//    [self.tableView reloadData];
//    //获取到需要跳转位置的行数
//    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:1];
//    //滚动到其相应的位置
//    [self.tableView scrollToRowAtIndexPath:scrollIndexPath
//                          atScrollPosition:UITableViewScrollPositionTop animated:NO];
//}

//删除评论
- (void)clickDeleteCommentWithModel:(RRSeniorCommentsModel *)model {
    //    if (self.delegate && [self.delegate respondsToSelector:@selector(seasonSeniorCommentsSecondarySubVC:deleteModel:)]) {
    //        [self.delegate seasonSeniorCommentsSecondarySubVC:self deleteModel:model];
    //    }
    //    [self dismiss];
    
//    [self.navigationController popViewControllerAnimated:YES];
    
//    [[RRAppLinkManager sharedManager] popViewControllerAnimated:YES];
}

//删除回复
- (void)clickDeleteReplyWithModel:(RRSeniorCommentsModel *)model {
//    NSMutableArray *tempArr = [[NSMutableArray alloc] init];
//    for (RRSeniorCommentsModel *nowModel in self.dataSource.dataArray) {
//        if (![nowModel.ID isEqualToString:model.ID]) {
//            [tempArr addObject:nowModel];
//        }
//    }
//    [self.dataSource.dataArray removeAllObjects];
//    [self.dataSource appendDatas:tempArr];
//    self.commentModel.replyCount = self.commentModel.replyCount - 1;
//    [self.tableView reloadData];
}

// 当iOS界面环境发生变化时，系统调用该方法。
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    [self.tableView reloadData];
}

- (void)dealloc {
}
@end
