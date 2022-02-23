//
//  RRDramaCommentDetailVC.m
//  NJVideo
//
//  Created by WDEMO on 2021/8/3.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRDramaCommentDetailVC.h"
#import "RRDramaCommentDetailCell.h"
#import "RRSeasonSeniorCommentsTextImageReplyListCell.h"
//#import "RrmjUser.h"
//#import "RRDramaCommentDetailApi.h"
//#import "RRSeniorCommentsListApi.h"
#import "RRDramaCommentPraiseBtnInputBar.h"
#import "RRSeasonSeniorCommentsDetailVC.h"
//#import "RRImageGetTokenApi.h"
//#import "RRImageUploadManager.h"
//#import "RRCommentService.h"
//#import "RRSeniorCommentCreateApi.h"
//#import "NSString+ZY.h"

//#import "RRAlertBase.h"
//#import "RRAlertView.h"
//#import "ReportApi.h"
//#import "RRThumbUpApi.h"
//#import "RRAppLinkManager.h"
//发影评
//#import "RRCreateFilmReviewViewController.h"
//#import "RRDramaCommentDeletetApi.h"
//头部view
#import "RRTopBarUserView.h"
//#import "NoDataView.h"

//@interface RRDramaCommentDetailVC () <UITableViewDataSource, UITableViewDelegate, RRSeasonSeniorCommentsDetailVCDelegate, RRCreateFilmReviewViewControllerDelegate>
@interface RRDramaCommentDetailVC () <UITableViewDataSource, UITableViewDelegate, RRSeasonSeniorCommentsDetailVCDelegate>

//@property (nonatomic, strong) RRCommentService *service;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RRDramaCommentPraiseBtnInputBar *bottomView;

//@property (nonatomic, strong) RRDataSource *dataSource;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger rows;

@property (nonatomic, assign) BOOL spoiler;    //是否剧透  TRUE是全部  FALSE 是过滤剧透
@property (nonatomic, copy) NSString *sort;       //排序:likeCount根据最热排序 createTime

//@property (nonatomic, strong) RRSeniorCommentsListApi *listApi;

@property (nonatomic, assign) BOOL isReplying;

@property (nonatomic, strong) RRSeniorCommentsModel *dramaCommentModel;//影评model
@property (nonatomic, assign) NSInteger listCount;

@property (nonatomic, strong) RRTopBarUserView *topBarUserView;
//@property (nonatomic, strong) UIImageView *topUserAvaterImgV;//头像
//@property (nonatomic, strong) UILabel *topUserNickNameLab;//昵称
//@property (nonatomic, strong) UIImageView *topUserVipImgV;//vip图片

@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UILabel *headerLab;

//阅读进度
@property (nonatomic, assign) CGFloat rate;

//@property (nonatomic, strong) RRUmengContentPageContext *pageContext;
@property (nonatomic, copy) NSString *recSource;//来源

//@property (nonatomic, strong) NoDataView *noCommontDataView;

//剧集上报
@property (nonatomic, assign) BOOL isShowSeasonCard;

@property (nonatomic, copy) NSMutableArray *data;//数据

@end

@implementation RRDramaCommentDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"影评详情";

//    self.dataSource = [[RRDataSource alloc] init];
//    self.spoiler = YES;
//    self.sort = @"createTime";
//    self.page = 1;
//    self.rows = 20;
//
//    self.isReplying = NO;
//
//    self.loadingView.hidden = NO;
////    self.loadingView.center = CGPointMake(self.view.centerX, self.view.centerY - 99 - appMargin().top);
//    self.noDataView.center = self.loadingView.center;
//
    [self setupViews];
    [self refreshData];
//
//    //埋点
////    self.pageContext = [[RRUmengContentPageContext alloc] initWithContentId:self.dramaCommentId contentType:kRRUmengEventContnetTypeDramaComment];
//
//    NSDictionary *sourceParam = [[RRUMengLogger sharedLogger] clickParamsWithContentType:kRRUmengEventContnetTypeDramaComment contentId:self.dramaCommentId];
//    self.recSource = sourceParam[kRRUmengEventKeyRecSource];
//
//    self.pageContext = [[RRUmengContentPageContext alloc] init];
//    self.pageContext.contentID = self.dramaCommentId;
//    self.pageContext.contentType = kRRUmengEventContnetTypeDramaComment;
//    self.pageContext.sourcePageName = sourceParam[kRRUmengEventKeySourcePage];
//    self.pageContext.recSource = self.recSource;
//    self.pageContext.watchProgresStr = @"0%%";

}

- (void)refreshData {
    {
    //iOS 读取本地Json文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"影评详情" ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
    NSError *error;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (!jsonData || error) {
        //DLog(@"JSON解码失败");
    } else {
        //DLog(@"JSON解码成功");
    }
    NSDictionary *dic = (NSDictionary *)jsonObj;
    RRSeniorCommentsModel *model = [RRSeniorCommentsModel modelWithJSON:dic[@"data"]];
    self.dramaCommentModel = model;
    }
    
    {
    //iOS 读取本地Json文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"影评详情下讨论" ofType:@"json"];
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
    self.data = [model.content mutableCopy];
    }
    
    [self.tableView reloadData];
    self.tableView.hidden = NO;
    self.bottomView.hidden = NO;
}

//
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    [self.pageContext pageAppear];
//}
//
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    [self.pageContext pageDisappear];
//
//    //离开页面,关闭素输入框
//    if (_service) {
//        [_service closeReplyView];
//    }
//}
//
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
////    [self loadDataWithPage:1];
//    
//    
//    //detail详情
//    NSString *dramaCommentId = self.dramaCommentId;
//    @weakify(self)
//    [RRDramaCommentDetailApi requestDramaCommentDetailWithTypeId:dramaCommentId
//                                                           block:^(RRSeniorCommentsModel * _Nonnull model, NSError * _Nonnull error) {
//        @strongify(self)
//        if (error) {
//            if (self.loadingView) {
//                if (self.loadingView.isHidden) {
//                    TOAST(@"加载失败");
//                } else {
//                    self.loadingView.msgType = RRMJLoadingErrorDefault;
////                    self.dataSource.error = error;
//                }
//            }
//            [self stopLoading];
//            return;
//        }
//        
////        //测试代码
////        model = nil;
//        self.dramaCommentModel = model;
//
//        if (self.dramaCommentModel) {
//            self.dramaCommentModel = model;
//            //请求第一页数据
//            [self loadDataWithPage:1];
//            self.noDataView.hidden = YES;
////            self.noDataView.placeText = @"抱歉，没有找到相关内容";hidden
//        } else {
//            self.loadingView.hidden = YES;
//            [self stopLoading];
//            self.noDataView.hidden = NO;
////            self.noDataView.placeText = @"抱歉，没有找到相关内容";
//            self.noDataView.placeText = @"已删除";
//            self.noDataView.imageName = @"ic_reply_delete";
//        }
//    }];
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
//    NSString *typeId = self.dramaCommentId;
//    NSString *type = @"DRAMA_COMMENT";
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
//        weakSelf.listCount = model.total;
//        [weakSelf stopLoading];
//    }];
//}
//
//- (void)stopLoading {
//
//    self.dataSource.isLoading = NO;
//    self.dataSource.isRefreshing = NO;
//    
//    [self.tableView.mj_footer endRefreshing];
//    [self.tableView.mj_header endRefreshing];
//    [self addHeader];
//    [self addFooter];
//     
//    if (self.dataSource.noMoreData) {
//        [self.tableView.mj_footer endRefreshingWithNoMoreData];
//    } else {
//        [self.tableView.mj_footer resetNoMoreData];
//    }
//    
//    //loding还在显示，detail不存在
//    if (!self.loadingView.isHidden || !self.dramaCommentModel) {
//        //隐藏
//        self.bottomView.hidden = YES;
//        self.topBarUserView.hidden = YES;
//        self.customTabbar.rightButton.hidden = YES;
////        [self removeHeader];
//        [self removeFooter];
//    } else {
//        //显示
//        self.bottomView.hidden = NO;
//        self.topBarUserView.hidden = NO;
//        [self updateTopBarUserView];
//        self.customTabbar.rightButton.hidden = NO;
//        self.bottomView.commentModel = self.dramaCommentModel;
//    }
//    [self.tableView reloadData];
//    [self viewRate];
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
//        if (self.dramaCommentModel && self.loadingView.isHidden) {
//            self.tableView.tableFooterView = self.noCommontDataView;
//        } else {
//            self.tableView.tableFooterView = nil;
//        }
//        return;
//    }
//    
//    self.tableView.tableFooterView = nil;
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
//
- (void)setupViews {
//    self.customTabbar.frame = CGRectMake(0, 0, KWidth, statusMarginToTop() + navMarginToTop() - 4);
    [self createTableViewSectionHeader];
    [self createTableView];
    [self createbottomView];
//    [self.view bringSubviewToFront:self.loadingView];
//    [self.view bringSubviewToFront:self.noDataView];
//
//    [self.customTabbar addSubview:self.topBarUserView];
//
//    [self.customTabbar.rightButton setImage:IMAGENAME(@"ic_more_gray") forState:UIControlStateNormal];
//    self.customTabbar.rightButton.hidden = YES;
//    [self.customTabbar.rightButton addTarget:self action:@selector(clickMoreBtn:) forControlEvents:UIControlEventTouchUpInside];
//    //left 48 right 48
////    CGFloat width = KWidth - 48 - 48;
//    //没有分享
//    CGFloat width = KWidth - 48 - 56;
//    self.topBarUserView.frame = CGRectMake(48, self.customTabbar.leftButton.frame.origin.y + (self.customTabbar.leftButton.frame.size.height - 30) / 2, width, 30);
}

- (void)createTableView {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(0));
        make.leading.equalTo(@(0));
        make.trailing.equalTo(@(0));
        make.bottom.equalTo(@(-53 + appMargin().bottom));
    }];
    self.tableView.hidden = NO;
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

- (void)createTableViewSectionHeader {
//    NSInteger count = 10;
//    NSString *text = [NSString stringWithFormat:@"%zi条回复", count];
    NSString *text = @"";
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 21 + 16)];
    UILabel *headerLab = [[UILabel alloc] init];
    headerLab.frame = CGRectMake(16, 8, KWidth - 16 * 2, 21);
    headerLab.font = RR_MEDIUMFONT(17);
    headerLab.textColor = kCOLOR_dynamicProvider_222222_E5E7EB;
    headerLab.text = text;
    [header addSubview:headerLab];
    _header = header;
    _headerLab = headerLab;
}

- (void)updateTopBarUserView {
    NSString *headImgUrl = self.dramaCommentModel.author.headImgUrl;
    NSString *nickName = self.dramaCommentModel.author.nickName;
//    BOOL isVip = [RrmjUser isVip:self.dramaCommentModel.author.medalList];
//    BOOL isExpired = [RrmjUser isVipExpired:self.dramaCommentModel.author.medalList];;
//    NSInteger vipLevel = (self.dramaCommentModel.author.vipLevel.level).integerValue;

    BOOL isVip = YES;
    BOOL isExpired = NO;
    NSInteger vipLevel = 4;

    self.topBarUserView.userId = self.dramaCommentModel.author.ID;
    [self.topBarUserView headImgUrl:headImgUrl
                           nickName:nickName
                              isVip:isVip
                           vipLeveL:vipLevel
                          isExpired:isExpired];
}

#pragma - mark 发评论
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
//    [[[RRSeniorCommentCreateApi alloc] initCommentWithCommentType:RRSeniorCommentCreateApiTypeDRAMACOMMENT typeId:self.dramaCommentId content:content images:images reply2Id:reply2Id spoiler:isSpoiler msgLevel:msgLevel reply2UseId:reply2UseId] startWithCompletionBlock:^(RRJsonModel *result, NSError *error) {
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
//    [self addHeader];
//    [self addFooter];
//
//    //获取到需要跳转位置的行数
//    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:1];
//    //滚动到其相应的位置
//    [self.tableView scrollToRowAtIndexPath:scrollIndexPath
//            atScrollPosition:UITableViewScrollPositionTop animated:NO];
//    self.listCount = self.listCount + 1;
//    self.noDataView.hidden = YES;
//
//    //评论回复
//    NSMutableDictionary *parms = [NSMutableDictionary dictionary];
//    parms[kRRUmengEventKeyCommentID] = self.dramaCommentModel.ID;
//    parms[kRRUmengEventKeyContentType] = kRRUmengEventContnetTypeDramaCommentComment;
//    parms[kRRUmengEventKeyPublisherID] = model.author.ID;
//    [RRUMengLogger modularCommentReplyWithParams:parms];
//
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
//    }
//    [self.tableView reloadData];
//    [self addHeader];
//    [self addFooter];
//
//    //评论回复
//    NSMutableDictionary *parms = [NSMutableDictionary dictionary];
//    parms[kRRUmengEventKeyCommentID] = commentsModel.ID;
//    parms[kRRUmengEventKeyContentType] = kRRUmengEventContnetTypeDramaCommentComment;
//    parms[kRRUmengEventKeyPublisherID] = commentsModel.author.ID;
//    [RRUMengLogger modularCommentReplyWithParams:parms];
//}
//
//- (void)clickMoreBtn:(UIButton *)btn {
//    [self showAlertView];
//    //功能点击
//    NSMutableDictionary *parms = [NSMutableDictionary dictionary];
//    parms[kRRUmengEventKeySourcePage] = self.rr_UMemgPageName;
//    parms[kRRUmengEventKeySourceChannel] = self.rr_UMemgChannelName;
//    parms[kRRUmengEventKeyButtonName] = @"更多操作";
//    [RRUMengLogger modularClickedWithParams:parms];
//}
//
//#pragma mark - 提示框
//- (void)showAlertView {
//
//    WS(weakSelf);
//    RRAlertItem *item1 = [[RRAlertItem alloc] initWithTitle:@"编辑" itemImg:nil itemStyle:RRAlertItemStyleSheet];
//    item1.actionBlock = ^(RRAlertItem *item) {
//        NSLog(@"点击了%@", item.title);
//        [weakSelf clickEditBtn];
//        //功能点击
//        NSMutableDictionary *parms = [NSMutableDictionary dictionary];
//        parms[kRRUmengEventKeySourcePage] = self.rr_UMemgPageName;
//        parms[kRRUmengEventKeySourceChannel] = self.rr_UMemgChannelName;
//        parms[kRRUmengEventKeyButtonName] = @"编辑";
//        [RRUMengLogger modularClickedWithParams:parms];
//    };
//
//    RRAlertItem *item2 = [[RRAlertItem alloc] initWithTitle:@"删除" itemImg:nil itemStyle:RRAlertItemStyleSheet];
//    item2.actionBlock = ^(RRAlertItem *item) {
//        NSLog(@"点击了%@", item.title);
//        [weakSelf clickDeleteBtn];
//        //功能点击
//        NSMutableDictionary *parms = [NSMutableDictionary dictionary];
//        parms[kRRUmengEventKeySourcePage] = self.rr_UMemgPageName;
//        parms[kRRUmengEventKeySourceChannel] = self.rr_UMemgChannelName;
//        parms[kRRUmengEventKeyButtonName] = @"删除";
//        [RRUMengLogger modularClickedWithParams:parms];
//    };
//
//    RRAlertItem *item3 = [[RRAlertItem alloc] initWithTitle:@"举报" itemImg:nil itemStyle:RRAlertItemStyleSheet];
//    item3.actionBlock = ^(RRAlertItem *item) {
//        NSLog(@"点击了%@", item.title);
//        [weakSelf clickReportBtn];
//    };
//
//    RRAlertItem *item4 = [[RRAlertItem alloc] initWithTitle:@"不感兴趣" itemImg:nil itemStyle:RRAlertItemStyleSheet];
//    item4.actionBlock = ^(RRAlertItem *item) {
//        TOAST(@"操作成功，将减少此类内容推送");
//
//    };
//    item1.titleFont = SYSTEMFONT(17);
//    item2.titleFont = SYSTEMFONT(17);
//    item3.titleFont = SYSTEMFONT(17);
//    item4.titleFont = SYSTEMFONT(17);
//
////    BOOL isCommentUser = [UserInfoConfig sharedUserInfoConfig].userInfo.commentUser;
////    //老评论
////    if (!isCommentUser) {
////        NSArray *itemArray = @[item1, item3];
////        NSString *title = [NSString stringWithFormat:@"%@：%@", self.model.author.nickName, self.model.content];
////        RRAlertBase *alert = [[RRAlertBase alloc] initWithTitle:title itemArray:itemArray];
////        [alert titleStyleWithText:title lines:2 textColor:kCOLOR_898A91 font:SYSTEMFONT(14) lineHeihgt:6];
////        [alert showWithAnimation:YES];
////        return;
////    }
//
//    BOOL isMy = [UserInfoConfig isLogined] && [[UserInfoConfig sharedUserInfoConfig].userInfo.Id isEqualToString:self.dramaCommentModel.author.ID];
//    //编辑,删除
//    NSArray *itemArray = @[item1, item2];
//    if (!isMy) {
//        itemArray = @[item3];
//    }
//
//    if (![UserInfoConfig sharedUserInfoConfig].isMoviesOpen) {
//        itemArray = @[item1, item2, item4];
//        if (!isMy) {
//            itemArray = @[item3, item4];
//        }
//    }
////    NSString *title = @"举报毒舌电影：好搞笑哦好好看撒大噶点范德萨发的撒范德萨到发疯剧啊撒地方大法大范德萨发到点点滴滴带的…";
////    NSString *title = [NSString stringWithFormat:@"%@：%@", self.model.author.nickName, self.model.content];
//    RRAlertBase *alert = [[RRAlertBase alloc] initWithTitle:nil itemArray:itemArray];
////    [alert titleStyleWithText:title lines:2 textColor:kCOLOR_898A91 font:SYSTEMFONT(14) lineHeihgt:6];
//    alert.cancelItemBlock = ^{
//        //功能点击
//        NSMutableDictionary *parms = [NSMutableDictionary dictionary];
//        parms[kRRUmengEventKeySourcePage] = self.rr_UMemgPageName;
//        parms[kRRUmengEventKeySourceChannel] = self.rr_UMemgChannelName;
//        parms[kRRUmengEventKeyButtonName] = @"取消";
//        [RRUMengLogger modularClickedWithParams:parms];
//    };
//    [alert showWithAnimation:YES];
//}
 
#pragma mark - 点赞
- (void)clickPraiseBtn:(UIButton *)btn {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            NSString *typeId = self.dramaCommentModel.ID;
//            BOOL liked = self.dramaCommentModel.liked;
//            @strongify(self);
//            [RRThumbUpApi postThumUp:liked
//                            targetId:typeId
//                                type:RRThumbUpTypeDramaComment block:^(RRJsonModel * _Nonnull result, NSError * _Nonnull error) {
//                @strongify(self);
//                if (!result) {
//                    TOAST(error.localizedDescription);
//                    return;
//                } else {
//                    if (!liked) {
//                        TOAST(@"点赞成功");
//                        self.dramaCommentModel.liked = YES;
//                        self.dramaCommentModel.likeCount = self.dramaCommentModel.likeCount + 1;
//                        self.bottomView.commentModel = self.dramaCommentModel;
//
//                    } else {
//                        TOAST(@"取消点赞");
//                        self.dramaCommentModel.liked = NO;
//                        self.dramaCommentModel.likeCount = self.dramaCommentModel.likeCount - 1;
//                        self.bottomView.commentModel = self.dramaCommentModel;
//
//                    }
//                }
//            }];
//        }
//    }];
//
//    //内容点赞
//    NSMutableDictionary *parms = [NSMutableDictionary dictionary];
//    parms[kRRUmengEventKeySourcePage] = self.rr_UMemgPageName;
//    parms[kRRUmengEventKeySourceChannel] = self.rr_UMemgChannelName;
//    parms[kRRUmengEventKeyCommentID] = self.dramaCommentModel.ID;
//    parms[kRRUmengEventKeyLikeType] = @"影评";
//    parms[kRRUmengEventKeyPublisherID] = self.dramaCommentModel.author.ID;
//    [RRUMengLogger modularContentLikeWithParams:parms];
}

#pragma mark - 举报
- (void)clickReportBtn {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            __block NSString * Message;
//            //408之后 都为commetType   兼容帖子为reply状态
//            ReportApi * api = [[ReportApi alloc] initWithID:self.dramaCommentModel.ID type:KDramaCommentType content:nil];
//            [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
//                NSDictionary * dic = request.responseJSONObject;
//                if (dic) {
//                    RRJsonModel * json = [RRJsonModel modelWithDictionary:dic];
//                    if (json.code == SUCCESSCODE) {
//                        Message = @"举报成功";
//        //                    [IanAlert alertSuccess:Message];
//                        TOAST(Message);
//                    }else if (json.code == 1124){
//                        Message = @"该内容您已举报过了";
//        //                    [IanAlert alertSuccess:Message];
//                        TOAST(Message);
//                    }else if (json.code == 1125){
//                        Message = @"您不能举报自己哦";
//        //                    [IanAlert alertError:Message];
//                        TOAST(Message);
//                    }else{
//                        Message = @"举报失败";
//        //                    [IanAlert alertError:Message];
//                        TOAST(Message);
//                    }
//                }else{
//                    Message = @"举报失败";
//        //                [IanAlert alertError:Message];
//                    TOAST(Message);
//                }
//            } failure:^(YTKBaseRequest *request) {
//                Message = @"举报失败";
//        //            [IanAlert alertError:Message];
//                TOAST(Message);
//            }];
//        }
//    }];
}

#pragma mark - 删除影评
#pragma mark - 删除btn
- (void)clickDeleteBtn {
//    WS(weakSelf)
//    RRAlertView *alertView = [[RRAlertView alloc] initWithTitle:nil
//                                                        content:@"确定删除改影评？删除后不可恢复"
//                                                    cancelTitle:@"取消"
//                                                      sureTitle:@"确认删除"];
//    alertView.dismissBlock = ^(BOOL isClicked) {
//        if (isClicked) {
//            //确认删除
//            [weakSelf clickSureDeleteBtn];
//        } else {
//            //取消
//        }
//    };
//    [alertView showInView:kAppDelegate.window];
}

#pragma mark - 确认删除btn
- (void)clickSureDeleteBtn {
//    NSString *typeId = self.model.ID;
//    WS(weakSelf)
//    [RRSeniorCommentsDeletetApi requestSeniorCommentsDeleteWithTypeId:typeId block:^(BOOL success, NSError * _Nonnull error) {
//        if (success) {
//            if (weakSelf.clickDelete) {
//                weakSelf.clickDelete(self.model);
//            }
//        }
//    }];
    
//    NSString  *typeId = self.dramaCommentModel.ID;
//    WS(weakSelf)
//    [RRDramaCommentDeletetApi requestDramaCommentDeleteWithTypeId:typeId block:^(BOOL success, NSError * _Nonnull error) {
//        if (success) {
//            if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(dramaCommentDetailVC:deleteModel:)]) {
//                [weakSelf.delegate dramaCommentDetailVC:weakSelf deleteModel:weakSelf.dramaCommentModel];
//            }
//            [weakSelf.navigationController popViewControllerAnimated:YES];
//        }
//    }];
}
 
//删除影评
- (void)clickDeleteDramaCommentWithModel:(RRSeniorCommentsModel *)model {
    [self clickDeleteBtn];
}

//点击剧集
- (void)clickDramaWithModel:(RRSeniorCommentsModel *)model {
//    if (self.delegate) {
////        [self.navigationController popViewControllerAnimated:YES];
//        [self popViewController];
//    } else {
//        BOOL enable = model.drama.enable;
//        if (enable) {
//            NSString *dramaId = model.drama.dramaId;
//            [[RRAppLinkManager sharedManager] goSeasonDetail:dramaId title:nil isMovie:NO toRoot:NO];
//        }
//    }
//
//    if (model.drama.enable) {
//        //内容点击
//        NSMutableDictionary *paramDict = [NSMutableDictionary dictionary];
//        paramDict[kRRUmengEventKeyContentName] = model.drama.title;
//        paramDict[kRRUmengEventKeyContentID] =  model.drama.dramaId;
//        paramDict[kRRUmengEventKeyContentType] = kRRUmengEventVideoTypeValueLongVideo;
//        paramDict[kRRUmengEventKeySourcePage] = self.rr_UMemgPageName;
//        paramDict[kRRUmengEventKeySourceChannel] = self.rr_UMemgChannelName;
//        paramDict[kRRUmengEventKeyRecSource] = self.recSource;
//        [RRUMengLogger logWithEventName:kRRUMengEventNameContentClick params:paramDict];
//    }
}
 
#pragma mark - 编辑
- (void)clickEditBtn {
//    NSLog(@"编辑影评");
//    @weakify(self)
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self)
//        RRCreateFilmReviewViewController *vc = [[RRCreateFilmReviewViewController alloc] init];
//        vc.model = self.dramaCommentModel;
//        vc.delegate = self;
//        [[RRAppLinkManager sharedManager] pushViewController:vc animated:YES];
//    }];
}

#pragma - mark RRCreateFilmReviewViewControllerDelegate
- (void)createFilmReviewViewCallBackModel:(RRSeniorCommentsModel *)model {
    if (!model) {
        return;
    }
    //刷新页面
    //剧集信息
    RRSeriesItemModel *drama = self.dramaCommentModel.drama;
    self.dramaCommentModel = model;
    self.dramaCommentModel.drama = drama;
    [self.tableView reloadData];
    //网络请求刷新
//    [self.tableView.mj_header beginRefreshing];
}

#pragma - mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    if (!self.loadingView.isHidden || !self.dramaCommentModel) {
//        return 0;
//    }
//    return 2;
    if (!self.dramaCommentModel) {
        return 0;
    }
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     switch (section) {
        case 0:
             return 1;
            break;
        case 1:
            return self.data.count;
            break;
        default:
            return 0;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    switch (section) {
        case 0:
            return [RRDramaCommentDetailCell cellHeightWithModel:self.dramaCommentModel];
            break;
        case 1:
        {
            RRSeniorCommentsModel *model = [self.data objectOrNilAtIndex:indexPath.row];
            return [RRSeasonSeniorCommentsTextImageReplyListCell cellHeightWithModel:model isShowAll:NO];
        }
            break;
        default:
            return 0;
            break;
    }
}

//header高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 1:
            return 21 + 16;
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
            NSInteger count = self.listCount;
            NSString *countStr = [NSString transformCountWithString:count];
            NSString *text = @"";
            if (countStr.length > 0) {
                text = [NSString stringWithFormat:@"全部评论 %@ ", countStr];
            } else {
                text = @"全部评论";
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
//    RRDramaCommentDetailCell *cell = (RRDramaCommentDetailCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRDramaCommentDetailCell class]) forIndexPath:indexPath];
//    cell.model = self.dramaCommentModel;
//    return cell;
    
    NSInteger section = indexPath.section;
    switch (section) {
        case 0:
        {
            RRDramaCommentDetailCell *cell = (RRDramaCommentDetailCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRDramaCommentDetailCell class]) forIndexPath:indexPath];
            RRSeniorCommentsModel *model = self.dramaCommentModel;
            cell.isHalf = NO;
            cell.model = model;
            WS(weakSelf)
            cell.clickDelete = ^(RRSeniorCommentsModel * _Nonnull model) {
                [weakSelf clickDeleteDramaCommentWithModel:model];
            };
            cell.clickDrama = ^(RRSeniorCommentsModel * _Nonnull model) {
                [weakSelf clickDramaWithModel:model];
            };
            [self showSeasonCardWithModel:model];

            //单击手势 单击回复
            UITapGestureRecognizer *singleTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTapDramaCommentDetailCell:)];
            singleTapGesture.numberOfTapsRequired = 1;
            singleTapGesture.numberOfTouchesRequired = 1;
            [cell addGestureRecognizer:singleTapGesture];
            //双击手势 双击点赞
            UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapDramaCommentDetailCell:)];
            doubleTapGesture.numberOfTapsRequired = 2;
            doubleTapGesture.numberOfTouchesRequired = 1;
            [cell addGestureRecognizer:doubleTapGesture];
            //只有当doubleTapGesture识别失败的时候(即识别出这不是双击操作)，singleTapGesture才能开始识别
            [singleTapGesture requireGestureRecognizerToFail:doubleTapGesture];
            
            return cell;
        }
            break;
            
        default:{
            RRSeasonSeniorCommentsTextImageReplyListCell *cell = (RRSeasonSeniorCommentsTextImageReplyListCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRSeasonSeniorCommentsTextImageReplyListCell class]) forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.isHalf = NO;
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
            cell.clickPraise = ^(RRSeniorCommentsModel * _Nonnull model) {
                [weakSelf clickPraiseWithModel:model];
            };
            
//            if (!model.rr_contentContext) {
//                RRUmengContentContext *context = [[RRUmengContentContext alloc] init];
//        //        context.contentName = model.title;
//                context.contentID = model.ID;
//                context.contentType = kRRUmengEventContnetTypeDramaComment;
//                context.page = self.rr_UMemgPageName;
//                context.channel = self.rr_UMemgChannelName;
//                context.location = @(indexPath.row).stringValue;
//                context.publisherID = model.author.ID;
//                model.rr_contentContext = context;
//            }
//            cell.rr_statisticsExposureModel = model;
//
//            //评论曝光：UM_Event_CommentExposure（只爆一级评论）
//            NSMutableDictionary *parms = [NSMutableDictionary dictionary];
//            parms[kRRUmengEventKeyCommentID] = model.ID;
//            parms[kRRUmengEventKeyContentType] = kRRUmengEventContnetTypeDramaCommentComment;
//            parms[kRRUmengEventKeyPublisherID] = model.author.ID;
//            [RRUMengLogger modularCommentExposureWithParams:parms];
            
            return cell;
        }
            break;
    }
}

- (void)singleTapDramaCommentDetailCell:(UIGestureRecognizer *)gesture {
    NSLog(@"单击");
    //点击回复
    [self clickTextBtn:nil];
}

- (void)doubleTapDramaCommentDetailCell:(UIGestureRecognizer *)gesture {
    NSLog(@"双击");
//
//    CGPoint point = [gesture locationInView:self.view];
//    //读取PAG素材文件
//    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"kuaikan_zan_bmp" ofType:@"pag"];
//    PAGFile *pagFile = [PAGFile Load:resourcePath];
//    //创建PAG播放视图PAGView
//    PAGView *pagView = [[PAGView alloc] initWithFrame:CGRectMake(point.x - 40, point.y - 40, 80, 80)];
//    [self.view addSubview:pagView];
//    //关联PAGView和PAGFile
//    [pagView setComposition:pagFile];
//    //设置循环播放，默认只播放一次
//    [pagView setRepeatCount:1];
//    [pagView play];
////    [pagView mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.centerX.offset(point.x);
////        make.centerY.offset(point.y);
////        make.width.height.offset(80);
////    }];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [pagView stop];
//        [pagView removeFromSuperview];
//    });
    
    BOOL liked = self.dramaCommentModel.liked;
    if (!liked) {
        [self clickPraiseBtn:nil];
    }
}

//点击回复列表的cell和footer
- (void)clickReplyListCellWithCommentModel:(RRSeniorCommentsModel *)commentModel replyModel:(RRSeniorCommentsModel *)replyModel isShowMore:(BOOL)isShowMore {
    NSString *type = @"DRAMA_COMMENT";
    RRSeasonSeniorCommentsDetailVC *vc = [[RRSeasonSeniorCommentsDetailVC alloc] initWithIsHalf:NO type:type];
    vc.commentModel = commentModel;
    NSString *replyId = replyModel ? replyModel.ID : nil;
    vc.replyId = replyId;
    vc.isShowMore = isShowMore;
    vc.delegate = self;
//    [[RRAppLinkManager sharedManager] pushViewController:vc animated:YES];
    [self.navigationController pushViewController:vc animated:YES];
}

//vc跳转删除
#pragma mark -  RRSeasonSeniorCommentsDetailVCDelegate
- (void)seasonSeniorCommentsSecondarySubVC:(RRSeasonSeniorCommentsDetailVC *)vc deleteModel:(RRSeniorCommentsModel *)deleteModel {
    [self clickDeleteWithModel:deleteModel];
}

- (void)closeSeasonSeniorCommentsSecondarySubVC:(RRSeasonSeniorCommentsDetailVC *)vc {
    if (!self.tableView.isHidden) {
        [self.tableView reloadData];
    }
}

//删除评论
- (void)clickDeleteWithModel:(RRSeniorCommentsModel *)model {
//    NSMutableArray *tempArr = [[NSMutableArray alloc] init];
//    for (RRSeniorCommentsModel *nowModel in self.dataSource.dataArray) {
//        if (![nowModel.ID isEqualToString:model.ID]) {
//            [tempArr addObject:nowModel];
//        }
//    }
//    [self.dataSource.dataArray removeAllObjects];
//    [self.dataSource appendDatas:tempArr];
//    self.listCount = self.listCount - 1;
//    [self.tableView reloadData];
//    [self addHeader];
//    [self addFooter];

}

#pragma - mark 发回复
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

- (void)clickPraiseWithModel:(RRSeniorCommentsModel *)model {
//    //内容点赞
//    NSMutableDictionary *parms = [NSMutableDictionary dictionary];
//    parms[kRRUmengEventKeySourcePage] = self.rr_UMemgPageName;
//    parms[kRRUmengEventKeySourceChannel] = self.rr_UMemgChannelName;
//    parms[kRRUmengEventKeyCommentID] = model.ID;
//    parms[kRRUmengEventKeyLikeType] = kRRUmengEventContnetTypeDramaCommentComment;
//    parms[kRRUmengEventKeyPublisherID] = model.author.ID;
//    [RRUMengLogger modularContentLikeWithParams:parms];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //点击cell回复
//    RRSeniorCommentsModel *model = [self.dataSource.dataArray objectOrNilAtIndex:indexPath.row];
//    [self clickCommentWithModel:model];
//    return;
    
    NSInteger section = indexPath.section;
    switch (section) {
        case 0:
        {
//            RRSeniorCommentsModel *model = self.dramaCommentModel;
            //点击回复
//            [self clickTextBtn:nil];
        }
            break;
            
        default:{
      
            RRSeniorCommentsModel *model = [self.data objectOrNilAtIndex:indexPath.row];
            [self clickCommentWithModel:model];
        }
            break;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if ([self.fatherVC respondsToSelector:@selector(scrollViewDidScroll:)]) {
//        [self.fatherVC scrollViewDidScroll:scrollView];
//    }
//    [self viewRate];
}

////浏览进度
//- (void)viewRate {
//
//    if (!self.dramaCommentModel) {
//        return;
//    }
//
//    if (self.rate >= 1) {
//        return;
//    }
//
//    //当前屏幕高度
//    CGFloat screenHeight = KHeight;
//    //ScrollView top
//    CGFloat scrollViewContentOffset = self.tableView.contentOffset.y;
//
//    CGFloat top = [RRDramaCommentDetailCell cellContentLabTopWithModel:self.dramaCommentModel];
//
//    CGFloat bottom = [RRDramaCommentDetailCell cellHeightWithModel:self.dramaCommentModel] - 20 - 70 -20;
//
//    CGFloat rate = (scrollViewContentOffset + screenHeight - top) / (bottom - top);
//
//    rate = MIN(rate, 1.0);
//    self.rate = rate;
//    NSLog(@"进度 = %f", rate);
//    NSString *rateStr = [NSString stringWithFormat:@"%zi%%", (NSInteger)(rate * 100)];
//    self.pageContext.watchProgresStr = rateStr;
//    self.pageContext.publisherID = self.dramaCommentModel.author.ID;
//}

//埋点剧集上报
- (void)showSeasonCardWithModel:(RRSeniorCommentsModel *)model {
//    //上报过了，只上报一次
//    if (self.isShowSeasonCard) {
//        return;
//    }
//    if (model.drama.enable) {
//        //内容曝光
//        NSMutableDictionary *paramDict = [NSMutableDictionary dictionary];
//        paramDict[kRRUmengEventKeyContentName] = model.drama.title;
//        paramDict[kRRUmengEventKeyContentID] =  model.drama.dramaId;
//        paramDict[kRRUmengEventKeyContentType] = kRRUmengEventVideoTypeValueLongVideo;
//        paramDict[kRRUmengEventKeyExposurePage] = self.rr_UMemgPageName;
//        paramDict[kRRUmengEventKeyExposureChannel] = self.rr_UMemgChannelName;
//        paramDict[kRRUmengEventKeyRecSource] = self.recSource;
//        [RRUMengLogger logWithEventName:kRRUMengEventNameContentExposure params:paramDict];
//
//        self.isShowSeasonCard = YES;
//    }
}

#pragma - mark lazy
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
        [_tableView registerClass:[RRDramaCommentDetailCell class] forCellReuseIdentifier:NSStringFromClass([RRDramaCommentDetailCell class])];
        [_tableView registerClass:[RRSeasonSeniorCommentsTextImageReplyListCell class] forCellReuseIdentifier:NSStringFromClass([RRSeasonSeniorCommentsTextImageReplyListCell class])];
    }
    return _tableView;
}

- (RRDramaCommentPraiseBtnInputBar *)bottomView {
    if (!_bottomView) {
        _bottomView = [[RRDramaCommentPraiseBtnInputBar alloc] initWithFrame:CGRectMake(0, 0, 320, 53)];
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

- (RRTopBarUserView *)topBarUserView {
    if (!_topBarUserView) {
        _topBarUserView = [[RRTopBarUserView alloc] init];
        _topBarUserView.frame = CGRectMake(48, 0, 200, 30);
        _topBarUserView.hidden = YES;
    }
    return _topBarUserView;
}

//- (UIView *)topUserView {
//    if (!_topUserView) {
//        _topUserView = [[UIView alloc] init];
//        _topUserView.frame = CGRectMake(48, 0, 200, 30);
//        _topUserView.hidden = YES;
//    }
//    return _topUserView;
//}
//
//- (UIImageView *)topUserAvaterImgV {
//    if (!_topUserAvaterImgV) {
//        _topUserAvaterImgV = [[UIImageView alloc] init];
//        _topUserAvaterImgV.frame = CGRectMake(0, 0, 30, 30);
//        _topUserAvaterImgV.layer.cornerRadius = 15;
//        _topUserAvaterImgV.layer.masksToBounds = YES;
//        _topUserAvaterImgV.layer.borderWidth = 1;
//        _topUserAvaterImgV.layer.borderColor = [kCOLOR_85888F colorWithAlphaComponent:0.2].CGColor;
//    }
//    return _topUserAvaterImgV;
//}
//
//- (UILabel *)topUserNickNameLab {
//    if (!_topUserNickNameLab) {
//        _topUserNickNameLab = [[UILabel alloc] init];
//        _topUserNickNameLab.frame  = CGRectMake(0, 0, 100, 30);
//        _topUserNickNameLab.font = BOLDSYSTEMFONT(17.0);
//        _topUserNickNameLab.textColor = kCOLOR_dynamicProvider_222222_DADBDC;
//    }
//    return _topUserNickNameLab;
//}
//
//- (UIImageView *)topUserVipImgV {
//    if (!_topUserVipImgV) {
//        _topUserVipImgV = [[UIImageView alloc] init];
//        _topUserVipImgV.frame  = CGRectMake(0, 0, 28, 14);
//
//    }
//    return _topUserVipImgV;
//}
//
//- (RRSeniorCommentsListApi *)listApi {
//    if (!_listApi) {
//        _listApi = [[RRSeniorCommentsListApi alloc] init];
//    }
//    return _listApi;
//}
//
//#pragma  mark -  无评论的时候
//- (NoDataView *)noCommontDataView {
//    if (!_noCommontDataView) {
//        _noCommontDataView = [[NoDataView alloc ]init];
//        _noCommontDataView.frame = CGRectMake(0, 0, KWidth, 200);
//        _noCommontDataView.imageName = @"img_empty";
//        _noCommontDataView.placeText = @"抱歉，没有找到相关内容";
//    }
//    return _noCommontDataView;
//}

// 当iOS界面环境发生变化时，系统调用该方法。
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    [self.tableView reloadData];
}

- (void)dealloc {
}

//- (NSString * _Nullable)rr_UMemgChannelName {
//    return @"";
//}
//
//- (NSString *)rr_UMemgPageName {
//    if ([self.dramaCommentId isKindOfClass:[NSString class]] && self.dramaCommentId.length) {
//        return [NSString stringWithFormat:@"%@#@#影评详情页", self.dramaCommentId];
//    }
//    return @"影评详情页";
//}
//
//- (void)popViewController {
//    [super popViewController];
//    //更新数据
//    if (self.passDramaCommentModel && self.dramaCommentModel) {
//        self.passDramaCommentModel.liked = self.dramaCommentModel.liked;
//        self.passDramaCommentModel.likeCount = self.dramaCommentModel.likeCount;
//    }
//    if (self.delegate && [self.delegate respondsToSelector:@selector(closeDramaCommentDetailVC:)]) {
//        [self.delegate closeDramaCommentDetailVC:self];
//    }
//}
@end
