//
//  RRSeasonSeniorCommentsSubVC.m
//  PUClient
//
//  Created by rrtv on 2021/3/24.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsSubVC.h"
#import "RRSeasonSeniorCommentsInputBar.h"
//#import "RRCommentService.h"
#import "RRSeasonSeniorCommentsHearder.h"
#import "RRSeasonSeniorCommentsTextImageReplyListCell.h"
//#import "RRSeasonSeniorCommentsSecondarySubVC.h"
//#import "RRAlertBase.h"
#import "RRSeniorCommentsModel.h"
#import "RRSeasonSeniorCommentsDetailVC.h"

@interface RRSeasonSeniorCommentsSubVC () <UITableViewDataSource, UITableViewDelegate, RRSeasonSeniorCommentsDetailVCDelegate>
//@property (nonatomic, strong) RRCommentService *service;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RRSeasonSeniorCommentsInputBar *bottomView;

@property (nonatomic, strong) UIView *topBar;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIButton *closeBtn; //半屏

@property (nonatomic, copy) NSMutableArray *data;//数据

//@property (nonatomic, strong) RRDataSource *dataSource;
//@property (nonatomic, assign) NSInteger page;
//@property (nonatomic, assign) NSInteger rows;

//@property (nonatomic, assign) BOOL spoiler;    //是否剧透  TRUE是全部  FALSE 是过滤剧透
//@property (nonatomic, copy) NSString *sort;       //排序:likeCount根据最热排序 createTime
//
//@property (nonatomic, strong) RRSeniorCommentsListApi *listApi;
//
//@property (nonatomic, assign) BOOL isReplying;
@end

@implementation RRSeasonSeniorCommentsSubVC

- (instancetype)initWithIsHalf:(BOOL)isHalf {
    self = [super init];
    if (self) {
        self.isHalf = isHalf;
    }
    return self;
}

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
//    self.customTabbar.hidden = YES;
//    self.dataSource = [[RRDataSource alloc] init];
//    //测试代码新评论
////    self.seasonId = @"111";
////    self.seasonId = @"333";
//    self.spoiler = YES;
//    self.sort = @"likeCount";
//    self.page = 1;
//    self.rows = 20;
//    self.isReplying = NO;
//
//    self.loadingView.hidden = NO;
//    self.loadingView.center = CGPointMake(self.view.centerX, self.view.centerY - 99 - appMargin().top);
//    self.noDataView.center = self.loadingView.center;
    
    self.data = [NSMutableArray array];
    
    [self setupViews];
    [self refreshData];
     
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UILabel *tagLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 23, 11)];
    tagLab.textAlignment = NSTextAlignmentCenter;
    tagLab.font = SYSTEMFONT(8);
    tagLab.textColor = kCOLOR_0091FF;
    tagLab.backgroundColor = [kCOLOR_0091FF colorWithAlphaComponent:0.1];
    tagLab.layer.cornerRadius = 3;
    tagLab.layer.masksToBounds = YES;
    tagLab.text = @"NEW";
    [view addSubview:tagLab];

    UILabel *countLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 11, 100, 11)];
    countLab.font = SYSTEMFONT(12);
    countLab.textColor = kCOLOR_88898F;
    countLab.text = @"1214";
    [view addSubview:countLab];

    [tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(0));
        make.leading.equalTo(@(0));
        make.width.equalTo(@(23));
        make.height.equalTo(@(11));
    }];
    [countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(11));
        make.leading.equalTo(@(0));
    }]; 
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(countLab);
        make.trailing.equalTo(countLab);
    }];
}

////隐藏导航栏
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
//}

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
//    [self loadDataWithPage:1];
//}
//
//- (void)loadMoreData {
//    if (self.dataSource.isLoading) {
//        if (self.dataSource.isRefreshing && self.tableView.mj_footer.isRefreshing) {
//            [self.tableView.mj_footer endRefreshing];
//        }
//        return;
//    }
//    self.dataSource.isLoading = YES; //loading中
//    self.dataSource.isRefreshing = NO;//上拉加载
//
//    [self loadDataWithPage:self.page + 1];
//}
//
//- (void)loadDataWithPage:(NSInteger)page {
//    NSString *typeId = self.seasonId;
//    NSString *type = @"DRAMA";
//    BOOL spoiler = self.spoiler;
//    NSString *sort = self.sort;
//    NSInteger currentPage = page;
//    NSInteger size = self.rows;
//
//    WS(weakSelf)
//    [self.listApi requestSeniorCommentsListWithTypeId:typeId
//                                                 type:type
//                                              spoiler:spoiler
//                                                 sort:sort
//                                                 page:currentPage
//                                             pageSize:size
//                                                block:^(RRSeniorCommentsListModel *_Nonnull model, NSError *_Nonnull error) {
//        //        //测试代码
//        //        error = [[NSError alloc] init];
//        if (error) {
//            if (weakSelf.loadingView) {
//                if (weakSelf.loadingView.isHidden) {
//                    TOAST(@"加载失败");
//                } else {
//                    weakSelf.loadingView.msgType = RRMJLoadingErrorDefault;
//                    weakSelf.dataSource.error = error;
//                }
//            }
//            [weakSelf stopLoading];
//            return;
//        }
//        //        listArray = @[];
//
//        //page
//        weakSelf.page = currentPage;
//
//        weakSelf.loadingView.hidden = YES;
//        [weakSelf.dataSource appendDatas:model.content];
//        weakSelf.dataSource.isLoading = NO;
//        weakSelf.dataSource.isRefreshing = NO;
//        weakSelf.dataSource.noMoreData = model.isEnd;
//        weakSelf.dataSource.error = error;
//
//        if (weakSelf.commentRestricted) {
//            weakSelf.listCount = 0;
//        } else {
//            weakSelf.listCount = model.total;
//        }
//        [weakSelf stopLoading];
//    }];
//}
//
//- (void)stopLoading {
//
//    self.dataSource.isLoading = NO;
//    self.dataSource.isRefreshing = NO;
//
//    [self addHeader];
//    [self addFooter];
//    [self.tableView.mj_footer endRefreshing];
//    [self.tableView.mj_header endRefreshing];
//
//    if (self.dataSource.noMoreData) {
//        [self.tableView.mj_footer endRefreshingWithNoMoreData];
//    } else {
//        [self.tableView.mj_footer resetNoMoreData];
//    }
//
//    //loadingView
//    if (!self.loadingView.isHidden) {
//        self.tableView.hidden = YES;
//        self.bottomView.hidden = YES;
//        return;
//    }
//
//    if (self.commentRestricted) {
//        self.tableView.hidden = YES;
//        self.bottomView.hidden = YES;
//        self.noDataView.hidden = NO;
//        self.noDataView.placeText = @"抱歉，没有找到相关内容";
//    } else {
//        self.tableView.hidden = NO;
//        self.bottomView.hidden = NO;
//        self.noDataView.hidden = !self.dataSource.isNoData;
//        self.noDataView.placeText = @"快来发条评论抢沙发吧！";
//        [self.tableView reloadData];
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
//    if (self.dataSource.dataArray.count <= 0) {
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




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)refreshData {
    //iOS 读取本地Json文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"评论" ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
    NSError *error;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (!jsonData || error) {
        //DLog(@"JSON解码失败");
    } else {
        //DLog(@"JSON解码成功");
    }
    NSDictionary *dic = (NSDictionary *)jsonObj;
    RRSeniorCommentsListModel *model = [RRSeniorCommentsListModel modelWithJSON:dic[@"data"]];
    self.data = [NSMutableArray arrayWithArray:model.content];
    [self.tableView reloadData];

}

- (void)setupViews {
    [self createTableView];
    [self createbottomView];
//    [self.view bringSubviewToFront:self.loadingView];
//    [self.view bringSubviewToFront:self.noDataView];
}

- (void)createTableView {
    [self.view addSubview:self.tableView];
    if (!self.isHalf) {
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@(0));
            make.leading.equalTo(@(0));
            make.trailing.equalTo(@(0));
            make.bottom.equalTo(self.bottomView.mas_top).offset(0);
        }];
    } else {
        UIView *topBarBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 49)];
        topBarBackView.backgroundColor = kCOLOR_000000;
        [self.view addSubview:topBarBackView];
        
        [self.view addSubview:self.topBar];
        [self.topBar addSubview:self.titleLab];
        [self.topBar addSubview:self.closeBtn];
        [self.topBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.trailing.equalTo(@0);
            make.height.equalTo(@49);
        }];
        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@16);
            make.trailing.equalTo(@-49);
            make.top.bottom.equalTo(@0);
        }];
        [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.bottom.equalTo(@0);
            make.width.height.equalTo(@49);
        }];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topBar.mas_bottom).offset(-10);
            make.leading.trailing.equalTo(@0);
            make.bottom.equalTo(self.bottomView.mas_top).offset(0);
        }];
        //        }
    }
    //    self.tableView.hidden = YES;
    //    self.bottomView.hidden = YES;
    //    self.bottomView.commentModel = self.commentModel;
    [self.view bringSubviewToFront:self.tableView];
}

- (void)createbottomView {
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(53 - appMargin().bottom));
        make.leading.equalTo(@(0));
        make.trailing.equalTo(@(0));
        make.bottom.equalTo(@(0));
    }];
    self.bottomView.hidden = YES;
}
 

- (void)clickTextBtn:(UIButton *)btn {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            @weakify(self);
//            [self.service showSeniorSingleTextType:RRCommentViewTypeSeniorWriteComment
//                                       placeholder:@"点击这里写评论~"
//                                               key:@""
//                                         superView:nil
//                                       submitBlock:^(NSString *_Nonnull content, NSArray *_Nonnull imageDataArray, BOOL isSpoiler) {
//                @strongify(self);
//                [self articleReplay:content imageDatas:imageDataArray toComment:nil isSpoiler:isSpoiler msgLevel:RRSeniorCommentCreateApiMsgLevelOne];
//            }];
//        }
//    }];
}

//- (void)articleReplay:(NSString *)content imageDatas:(NSArray *)imageDatas toComment:(RRSeniorCommentsModel *)model isSpoiler:(BOOL)isSpoiler msgLevel:(RRSeniorCommentCreateApiMsgLevel)msgLevel {
//    if (self.isReplying) {
//        return;
//    }
//    if (![self checkCommentAvailable:content]) {
//        return;
//    }
//    [IanAlert showLoading:@"发送中"];
//    self.isReplying = YES;
//    if (imageDatas.count) {
//        @weakify(self);
//        [[[RRImageGetTokenApi alloc] initWith:@"comment" originalFilename:[RRImageGetTokenApi getFileNameArrayString:imageDatas]] startWithCompletionBlock:^(RRJsonModel *result, NSError *error) {
//            @strongify(self);
//            if (!error && result.code == SUCCESSCODE) {
//                NSArray *keys = [result.dataDict[@"fileKey"] componentsSeparatedByString:@","];
//                if (keys.count == imageDatas.count) {
//                    [[RRImageUploadManager manager] uploadImageDatas:imageDatas
//                                                               token:result.dataDict[@"token"]
//                                                                keys:keys
//                                                             atIndex:0
//                                                            complete:^(NSMutableArray *_Nonnull keys) {
//                        if (keys.count == imageDatas.count) {
//                            [self createComment:content images:[RRSeniorCommentCreateApi conversionImageDatas:imageDatas keys:keys] toComment:model isSpoiler:isSpoiler msgLevel:msgLevel];
//                        } else {
//                            [IanAlert alertError:@"图片上传失败" length:TIMELENGTH];
//                            self.isReplying = NO;
//                        }
//                    }];
//                }  else {
//                    [IanAlert alertError:@"图片上传失败" length:TIMELENGTH];
//                    self.isReplying = NO;
//                }
//            } else {
//                [IanAlert alertError:@"图片上传失败" length:TIMELENGTH];
//                self.isReplying = NO;
//            }
//        }];
//    } else {
//        [self createComment:content images:imageDatas toComment:model isSpoiler:isSpoiler msgLevel:msgLevel];
//    }
//}
//
//- (void)createComment:(NSString *)content images:(NSArray *)images toComment:(RRSeniorCommentsModel *)model isSpoiler:(BOOL)isSpoiler msgLevel:(RRSeniorCommentCreateApiMsgLevel)msgLevel {
//    WS(weakSelf);
//    NSString *reply2Id = @"";
//    if (model) {
//        reply2Id = model.ID;
//    }
//    NSString *reply2UseId = @"";
//    if (model) {
//        reply2UseId = model.author.ID;
//    }
//    [[[RRSeniorCommentCreateApi alloc] initCommentWithCommentType:RRSeniorCommentCreateApiTypeDRAMA typeId:self.seasonId content:content images:images reply2Id:reply2Id spoiler:isSpoiler msgLevel:msgLevel reply2UseId:reply2UseId] startWithCompletionBlock:^(RRJsonModel *result, NSError *error) {
//        weakSelf.isReplying = NO;
//        if (error) {
//            [IanAlert alertError:error.localizedDescription length:TIMELENGTH];
//        } else {
//            if (result.code == SUCCESSCODE) {
//                [IanAlert alertSuccess:@"发表成功" length:TIMELENGTH];
//                RRSeniorCommentsModel *resultModel = [RRSeniorCommentsModel modelWithDictionary:result.data];
//                if (msgLevel == RRSeniorCommentCreateApiMsgLevelOne) {
//                    [weakSelf commentBackResultModel:resultModel];
//                } else {
//                    [weakSelf replayBackResultModel:resultModel commentsModel:model];
//                }
//                [weakSelf.service closeReplyView];
//            } else if (result.code == 3001) {
//                [IanAlert alertError:@"频率太快啦，喝口水歇一下" length:TIMELENGTH];
//
//            } else if (result.code == 3002) {
//                [IanAlert alertError:@"已经提交过了,请别重复提交" length:TIMELENGTH];
//
//            } else {
//                [IanAlert alertError:result.msg length:TIMELENGTH];
//            }
//        }
//    }];
//}
//
//- (BOOL)checkCommentAvailable:(NSString *)content {
//    if (content.length <= 0) {
//        [IanAlert alertError:@"你还没写评论哦" length:TIMELENGTH];
//        return NO;
//    } else if (content.length < 3) {
//        [IanAlert alertError:@"多说点吧，别偷懒哦！" length:TIMELENGTH];
//        return NO;
//    } else if (content.length > 1000) {
//        [IanAlert alertError:@"已超出字数上限" length:TIMELENGTH];
//        return NO;
//    } else if (![content isLegaReplay:content]) {
//        [IanAlert alertError:@"请不要重复发布相同内容" length:TIMELENGTH];
//        return NO;
//    }
//    return YES;
//}
//
////发送一级评论成功刷新
//- (void)commentBackResultModel:(RRSeniorCommentsModel *)model {
//
//    [self.dataSource.dataArray insertObject:model atIndex:0];
//    [self.tableView reloadData];
//
//    //获取到需要跳转位置的行数
//    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    //滚动到其相应的位置
//    [self.tableView scrollToRowAtIndexPath:scrollIndexPath
//            atScrollPosition:UITableViewScrollPositionTop animated:NO];
//    self.listCount = self.listCount + 1;
//    self.noDataView.hidden = YES;
//}
//
////回复评论成功刷新
//- (void)replayBackResultModel:(RRSeniorCommentsModel *)newModel commentsModel:(RRSeniorCommentsModel *)commentsModel {
//
//    if (commentsModel.replyCount < 2) {
//        NSMutableArray *tempArr = nil;
//        if (commentsModel.replies.count > 0) {
//            tempArr = [NSMutableArray arrayWithArray:commentsModel.replies];
//            [tempArr addObject:newModel];
//
//        } else {
//            tempArr = [NSMutableArray array];
//            [tempArr addObject:newModel];
//        }
//        commentsModel.replies = tempArr;
//        commentsModel.replyCount = commentsModel.replyCount + 1;
//    } else{
//        commentsModel.replyCount = commentsModel.replyCount + 1;
//    }
//    [self.tableView reloadData];
//}

#pragma - mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    RRSeniorCommentsModel *model = [self.data objectOrNilAtIndex:indexPath.row];
    return [RRSeasonSeniorCommentsTextImageReplyListCell cellHeightWithModel:model isShowAll:NO];
}

//header高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0;
}

//footer高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0;
}

//自定义头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

//自定义脚
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     
    RRSeasonSeniorCommentsTextImageReplyListCell *cell = (RRSeasonSeniorCommentsTextImageReplyListCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRSeasonSeniorCommentsTextImageReplyListCell class]) forIndexPath:indexPath];
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
    cell.clickReplyListCell = ^(RRSeniorCommentsModel * _Nonnull commentModel, RRSeniorCommentsModel * _Nullable replyModel, BOOL isShowMore) {
        [weakSelf clickReplyListCellWithCommentModel:commentModel replyModel:replyModel isShowMore:isShowMore];
    };
    return cell;

}

//点击回复列表的cell和footer
- (void)clickReplyListCellWithCommentModel:(RRSeniorCommentsModel *)commentModel replyModel:(RRSeniorCommentsModel *)replyModel isShowMore:(BOOL)isShowMore {
    NSString *type = @"DRAMA";
    RRSeasonSeniorCommentsDetailVC *vc = [[RRSeasonSeniorCommentsDetailVC alloc] initWithIsHalf:YES type:type];
    vc.commentModel = commentModel;
    NSString *replyId = replyModel ? replyModel.ID : nil;
    vc.replyId = replyId;
    vc.isShowMore = isShowMore;
    vc.delegate = self;
    UIViewController *topVC = [UIViewController topViewController];
    //    UIViewController *topVC = self.fatherVC;
    [topVC addChildViewController:vc];
    [vc didMoveToParentViewController:topVC];
    [topVC.view addSubview:vc.view];
    [vc show];
}

//vc跳转删除
#pragma mark -  RRSeasonSeniorCommentsDetailVCDelegate
- (void)seasonSeniorCommentsSecondarySubVC:(RRSeasonSeniorCommentsDetailVC *)vc deleteModel:(RRSeniorCommentsModel *)deleteModel {
//    if (self.clickDelete) {
//        self.clickDelete(self.model);
//    }
    [self clickDeleteWithModel:deleteModel];
}

- (void)closeSeasonSeniorCommentsSecondarySubVC:(RRSeasonSeniorCommentsDetailVC *)vc {
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

- (void)clickCommentWithModel:(RRSeniorCommentsModel *)model {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            @weakify(self);
//            [self.service showSeniorSingleTextType:RRCommentViewTypeSeniorReplyComment
//                                       placeholder:[NSString stringWithFormat:@"回复%@", model.author.nickName ?: @""]
//                                               key:model.ID
//                                         superView:nil
//                                       submitBlock:^(NSString *_Nonnull content, NSArray *_Nonnull imageDataArray, BOOL isSpoiler) {
//                @strongify(self);
//                [self articleReplay:content imageDatas:imageDataArray toComment:model isSpoiler:isSpoiler msgLevel:RRSeniorCommentCreateApiMsgLevelTwo];
//            }];
//        }
//    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //点击cell回复
    RRSeniorCommentsModel *model = [self.data objectOrNilAtIndex:indexPath.row];
    [self clickCommentWithModel:model];
    return;
//    RRSeniorCommentsModel *model = [self.dataSource.dataArray objectOrNilAtIndex:indexPath.row];
//    RRSeasonSeniorCommentsDetailVC *vc = [[RRSeasonSeniorCommentsDetailVC alloc] initWithIsHalf:YES];
//    vc.delegate = self;
//    vc.seniorCommentsModel = model;
//    //    vc.actorId = [NSString stringWithFormat:@"%lld", model.ID];
//    //    vc.name = model.chineseName;
//    //    vc.communityEnable = model.communityEnable;
//    //    UIViewController *topVC = [UIViewController topViewController];
//    UIViewController *topVC = self.fatherVC;
//    [topVC addChildViewController:vc];
//    [vc didMoveToParentViewController:topVC];
//    [topVC.view addSubview:vc.view];
//    [vc show];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if ([self.fatherVC respondsToSelector:@selector(scrollViewDidScroll:)]) {
//        [self.fatherVC scrollViewDidScroll:scrollView];
//    }
}

//lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
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
        [_tableView registerClass:[RRSeasonSeniorCommentsTextImageReplyListCell class] forCellReuseIdentifier:NSStringFromClass([RRSeasonSeniorCommentsTextImageReplyListCell class])];
        
 
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
        
        RRSeasonSeniorCommentsHearder *header = [[RRSeasonSeniorCommentsHearder alloc] initWithFrame:CGRectMake(0, 0, KWidth, 42)];
        header.clickStatusIndex = ^(UIResponder *sender, NSUInteger index) {
             
        };
        header.clickSwichIndex = ^(UIResponder *sender, NSUInteger index) {
            
        };
        _tableView.tableHeaderView = header;
    }
    return _tableView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[RRSeasonSeniorCommentsInputBar alloc] initWithFrame:CGRectMake(0, 0, 320, 53)];
       [_bottomView.textBoxBtn addTarget:self action:@selector(clickTextBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_bottomView];

        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(53 - appMargin().bottom));
            make.leading.equalTo(@(0));
            make.trailing.equalTo(@(0));
            make.bottom.equalTo(@(0));
        }];
//        [_bottomView sketchShadowWithOffsetX:0 offsetY:0 Blur:15 Spread:0 color:kCOLOR_dynamicProvider_Shadow_bar_000000Alpha008_000000Alpha14 alpha:1];
        
//        [_bottomView sketchShadowWithBottomBar];
    }
    return _bottomView;
}

//topBar
- (UIView *)topBar {
    if (!_topBar) {
        _topBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 49)];
        _topBar.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_1F2126;
    }
    return _topBar;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KWidth, 49)];
        _titleLab.text = @"评论";
        _titleLab.font = SYSTEMFONT(17);
    }
    return _titleLab;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [[UIButton alloc] init];
        _closeBtn.frame = CGRectMake(0, 0, 40, 40);
        [_closeBtn setImage:IMAGENAME(@"ic_search_results_bar_close_28") forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(clickCloseBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}

- (void)clickCloseBtn:(UIButton *)btn {
    [self dismiss];
}

- (void)show {
    if (!self.isHalf) {
        return;
    }
    self.view.frame = CGRectMake(0, KHeight, KWidth, KHeight - playerViewHeight());
    [UIView animateWithDuration:0.25
                     animations:^{
                       self.view.frame = CGRectMake(0, playerViewHeight(), KWidth, KHeight - playerViewHeight());
                     }];
}

- (void)dismiss {
    if (!self.isHalf) {
        return;
    }
    [UIView animateWithDuration:0.25
        animations:^{
          self.view.frame = CGRectMake(0, KHeight, KWidth, KHeight - playerViewHeight());
        }
        completion:^(BOOL finished) {
          [self willMoveToParentViewController:nil];
          [self removeFromParentViewController];
          [self.view removeFromSuperview];
        }];
}

//- (NSString *)rr_UMemgPageName {
//    return @"剧集详情页";
//}
//
//- (NSString *)rr_UMemgChannelName {
//    return @"详情";
//}

-(void)setCommentRestricted:(BOOL)commentRestricted {
//   _commentRestricted = commentRestricted;
//   if (self.isViewLoaded && commentRestricted) {
//       _tableView.hidden = YES;
//       _bottomView.hidden = YES;
//       self.noDataView.hidden = NO;
//       self.noDataView.placeText = @"抱歉，没有找到相关内容";
//   }
}

- (void)refreshWithId:(NSString *)seasonId {
//   if (_seasonId == seasonId) {
//       return;
//   }
//   _seasonId = seasonId;
//   //页面是否已经显示
//   if ([self isViewLoaded]) {
//       //数据初始化
//       self.dataSource = [[RRDataSource alloc] init];
//       self.spoiler = YES;
//       self.sort = @"likeCount";
//       self.page = 1;
//       self.rows = 20;
//       self.isReplying = NO;
//       self.listCount = 0;
//
//       self.listApi = nil;
//       self.service = nil;
//       //页面初始化
//       [self.tableView removeFromSuperview];
//       [self.bottomView removeFromSuperview];
//       self.tableView = nil;
//       self.bottomView = nil;
//
//       [self setupViews];
//       [self refreshData];
//   }
}

// 当iOS界面环境发生变化时，系统调用该方法。
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
   [super traitCollectionDidChange:previousTraitCollection];
   [self.tableView reloadData];
}

- (void)dealloc {
}
@end

