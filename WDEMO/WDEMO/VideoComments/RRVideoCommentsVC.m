//
//  RRVideoCommentsVC.m
//  PPVideo
//
//  Created by rrtv on 2022/1/25.
//  Copyright © 2022 RRMJ. All rights reserved.
//

#import "RRVideoCommentsVC.h"
#import "RRSeasonSeniorCommentsInputBar.h"
//#import "RRSeasonSeniorCommentsHearder.h"
#import "RRSeasonSeniorCommentsTextImageReplyListCell.h"
//#import "RRSeasonSeniorCommentsDetailVC.h"
#import "RRAlertBase.h"
//api model
#import "RRSeniorCommentsListApi.h"
#import "RRSeniorCommentsModel.h"
#import "RRImageGetTokenApi.h"
#import "RRImageUploadManager.h"
#import "RRCommentService.h"
#import "RRSeniorCommentCreateApi.h"
#import "NSString+ZY.h"

#import "RRVideoCommentsDetailVC.h"
//#import "RRVideoCommentsDetailPopView.h"

@interface RRVideoCommentsVC ()<UITableViewDataSource, UITableViewDelegate, RRVideoCommentsDetailVCDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) RRCommentService *service;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RRSeasonSeniorCommentsInputBar *bottomView;

@property (nonatomic, strong) RRDataSource *dataSource;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger rows;

@property (nonatomic, assign) BOOL spoiler;    //是否剧透  TRUE是全部  FALSE 是过滤剧透
@property (nonatomic, copy) NSString *sort;       //排序:likeCount根据最热排序 createTime

@property (nonatomic, strong) RRSeniorCommentsListApi *listApi;

@property (nonatomic, assign) BOOL isReplying;

///// 社区首页讨论类型跳转，定位id
//@property (nonatomic, copy) NSString *locationId;

@property (nonatomic, assign) NSInteger listCount;

@property (nonatomic, assign) BOOL isHalf;          //半屏
@property (nonatomic, strong) UIView *topBar;       //半屏
@property (nonatomic, strong) UILabel *titleLab;    //半屏详情
@property (nonatomic, strong) UIButton *closeBtn;   //半屏

@property (nonatomic, copy) NSString *type;//DRAMA 剧；VIDEO 视频；DRAMA_COMMENT 影评

//@property (nonatomic, strong)RRVideoCommentsDetailPopView *detailPopView;

@property (nonatomic, assign) BOOL isPan;

@property (nonatomic, strong) RRVideoCommentsDetailVC *videoCommentsDetailVC;

@end

@implementation RRVideoCommentsVC

- (instancetype)initWithIsHalf:(BOOL)isHalf {
    self = [super init];
    if (self) {
        self.isHalf = isHalf;
        self.type = @"VIDEO";
    }
    return self;
}

- (instancetype)initWithIsHalf:(BOOL)isHalf
                          type:(NSString *)type {
    self = [super init];
    if (self) {
        self.isHalf = isHalf;
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 暗黑
    [self.view setDarkMode:YES];
    self.customTabbar.navTitle.text = @"评论";
    self.customTabbar.hidden = self.isHalf;
    self.dataSource = [[RRDataSource alloc] init];
    //测试代码新评论
//    self.seasonId = @"111";
//    self.seasonId = @"333";
    self.spoiler = YES;
//    self.sort = @"likeCount";
    self.sort = @"createTime";
    self.page = 1;
    self.rows = 10;
    self.isReplying = NO;
    
    self.type = @"VIDEO";

    self.loadingView.hidden = NO;
    self.loadingView.center = CGPointMake(self.view.centerX, self.view.centerY - 99 - appMargin().top);
    self.noDataView.center = self.loadingView.center;
  
    self.view.backgroundColor = [UIColor clearColor];
    
    [self setupViews];
    [self refreshData];
    
    [self addGesture];

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
    NSString *typeId = self.videoId;
    NSString *type = self.type;
    BOOL spoiler = self.spoiler;
    NSString *sort = self.sort;
    NSInteger currentPage = page;
    NSInteger size = self.rows;

    WS(weakSelf)
    [self.listApi requestSeniorCommentsListWithTypeId:typeId
                                                 type:type
                                              spoiler:spoiler
                                                 sort:sort
                                                 page:currentPage
                                             pageSize:size
                                                block:^(RRSeniorCommentsListModel *_Nonnull model, NSError *_Nonnull error) {
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

        //page
        weakSelf.page = currentPage;

        weakSelf.loadingView.hidden = YES;

//        NSMutableArray *tempArr = [NSMutableArray array];
//        //第一页
//        if (currentPage == 1 && self.topSeniorCommentsModel) {
//            //添加到第一个
//            //再去重复
//            [tempArr addObject:self.topSeniorCommentsModel];
//            for (RRSeniorCommentsModel *seniorCommentsModel in model.content) {
//                if (![seniorCommentsModel.ID isEqualToString:self.topSeniorCommentsModel.ID]) {
//                    [tempArr addObject:seniorCommentsModel];
//                }
//            }
//        } else if (currentPage != 1 && self.topSeniorCommentsModel) {
//           //先去重复
//            for (RRSeniorCommentsModel *seniorCommentsModel in model.content) {
//                if (![seniorCommentsModel.ID isEqualToString:self.topSeniorCommentsModel.ID]) {
//                    [tempArr addObject:seniorCommentsModel];
//                }
//            }
//        } else {
//            [tempArr addObjectsFromArray:model.content];
//        }
//        [weakSelf.dataSource appendDatas:tempArr];

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
        weakSelf.listCount = model.total;
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
    
    //loadingView
    if (!self.loadingView.isHidden) {
        self.tableView.hidden = YES;
        self.bottomView.hidden = YES;
        return;
    }

//    if (self.commentRestricted) {
//        self.tableView.hidden = YES;
//        self.bottomView.hidden = YES;
//        self.noDataView.hidden = NO;
//        self.noDataView.imageName = @"img_empty_states_comment_close";
//        self.noDataView.placeText = @"抱歉，没有找到相关讨论";
//    } else {
//        self.tableView.hidden = NO;
//        self.bottomView.hidden = NO;
//        self.noDataView.hidden = !self.dataSource.isNoData;
//        self.noDataView.imageName = @"img_empty_states_no_content";
//        self.noDataView.placeText = @"快在ta的小星球上发第一条讨论";
//        [self.tableView reloadData];
////        [self tableViewLocation];
//    }
    self.tableView.hidden = NO;
    self.bottomView.hidden = NO;
    self.noDataView.hidden = !self.dataSource.isNoData;
    self.noDataView.imageName = @"img_empty_states_no_content";
    self.noDataView.placeText = @"快在ta的小星球上发第一条讨论";
    [self.tableView reloadData];
    
    self.titleLab.text = [NSString stringWithFormat:@"全部%zi条", self.listCount];
}

////定位
//- (void)tableViewLocation {
//    if (!self.locationId) {
//        return;
//    }
//    if (self.dataSource.dataArray.count <= 0) {
//        return;
//    }
//
//    NSInteger index = -1;
//    for (NSInteger i = 0; i < self.dataSource.dataArray.count; i++) {
//        RRSeniorCommentsModel *model = [self.dataSource.dataArray objectOrNilAtIndex:i];
//        if ([model.ID isEqualToString:self.locationId]) {
//            index = i;
//            break;
//        }
//    }
//
//    if (index < 0) {
//        self.locationId = nil;
//        return;
//    }
//    //获取到需要跳转位置的行数
//    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:index inSection:0];
//    //滚动到其相应的位置
//    [self.tableView scrollToRowAtIndexPath:scrollIndexPath
//            atScrollPosition:UITableViewScrollPositionTop animated:NO];
//
//    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
////    cell.contentView.backgroundColor = [UIColor redColor];
//    UIView *colorView = [[UIView alloc] initWithFrame:cell.bounds];
//    colorView.backgroundColor = [kCOLOR_0091FF colorWithAlphaComponent:0.08];
//    [cell.contentView addSubview:colorView];
//    [cell.contentView sendSubviewToBack:colorView];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [colorView removeFromSuperview];
//    });
//    self.locationId = nil;
//}

- (void)addHeader {
    if (self.tableView.mj_header) {
        return;
    }
    @weakify(self)
    MJDIYHeader *header = [MJDIYHeader headerWithRefreshingBlock:^{
        @strongify(self)
        //刷新数据，清理定位model
//        [self cleanTopSeniorCommentsModel];
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
    [self createbottomView];
    [self createTableView];
    [self.view bringSubviewToFront:self.loadingView];
    [self.view bringSubviewToFront:self.noDataView];
}

- (void)createTableView {
    [self.view addSubview:self.tableView];
    if (!self.isHalf) {
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.customTabbar.mas_bottom);
            make.leading.equalTo(@(0));
            make.trailing.equalTo(@(0));
            make.bottom.equalTo(@(-53 + appMargin().bottom));
        }];
    } else {
        UIView *topBarBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 49)];
//        topBarBackView.backgroundColor = kCOLOR_000000;
        topBarBackView.backgroundColor = [UIColor clearColor];
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
    }
//    self.tableView.hidden = YES;
//    [self.view bringSubviewToFront:self.tableView];
//    [self.view bringSubviewToFront:self.noDataView];
    
//    //下滑手势
//    UISwipeGestureRecognizer *swipeGestureRecognizerDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
//    swipeGestureRecognizerDown.delegate = self;
//    [self.tableView addGestureRecognizer:swipeGestureRecognizerDown];
//    swipeGestureRecognizerDown.direction = UISwipeGestureRecognizerDirectionDown;
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

- (void)addGesture {
    self.view.userInteractionEnabled = YES;
    
    //拖拽手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self  action:@selector(handlePan:)];
    panGesture.delegate = self;
    [self.view addGestureRecognizer:panGesture];

}

- (void)removeGesture {
}

- (void)handlePan:(UIPanGestureRecognizer*)recognizer {
 
    //获取到的是手指移动后，在相对坐标中的偏移量
    CGPoint translation = [recognizer translationInView:recognizer.view];
    
//    //相对有手势父视图的坐标点(注意如果父视图是scrollView,locationPoint.x可能会大于视图的width)
//    CGPoint locationPoint = [gestureRecognizer locationInView:gestureRecognizer.view];
    
    //列表偏移量
    CGPoint offset = self.tableView.contentOffset;
    
    if (offset.y <= 0) {
        
        //            self.tableView.scrollEnabled = NO;
        
        CGFloat x = 0;
        CGFloat y = recognizer.view.frame.origin.y + translation.y;
        
        //不让其再往上滑（固定位置）
        if (y < 0) {
            y = 0;
        } else {
            self.isPan = YES;
        }
        CGRect frame = recognizer.view.frame;
        frame.origin.x = x;
        frame.origin.y = y;
        recognizer.view.frame = frame;
        
        [recognizer setTranslation:CGPointZero inView:self.view];
        
    } else {
    }
    
    /**
     
     * 手势结束和失败时处理方式
     
     */
    
    if (recognizer.state == UIGestureRecognizerStateFailed || recognizer.state == UIGestureRecognizerStateEnded)  {
        /**
         
         * 试图向右拖拽超过试图本身一般位置时，关闭筛选试图；否则返回单初始位置
         
         */
        
        self.isPan = NO;
        
        if (self.view.frame.size.height - self.view.frame.origin.y > self.view.frame.size.height / 3) {
            //            ...  回退动作
            CGFloat x = 0;
            CGFloat y = 0;
            CGRect frame = self.view.frame;
            frame.origin.x = x;
            frame.origin.y = y;
            recognizer.view.frame = frame;
            
        } else {
            //           ...  关闭动作
            [self closeView];
        }
    }
    
    /**
     
     * 清空位移数据，避免拖拽事件的位移叠加
     
     */

    [recognizer setTranslation:CGPointZero inView:self.view];

}

#pragma mark - UIGestureRecognizerDelegate
//代理--手势识别器是否能够开始识别手势.
//当手势识别器识别到手势,准备从UIGestureRecognizerStatePossible状态开始转换时.调用此代理,如果返回YES,那么就继续识别,如果返回NO,那么手势识别器将会将状态置为UIGestureRecognizerStateFailed.
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
//    UIView *view = gestureRecognizer.view;
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
        CGPoint offset = self.tableView.contentOffset;
        CGFloat max = 20;
        if (offset.y <= 0 && translation.y > max) {
            [self closeView];
            return NO;
        } else {
            return YES;
        }
    }
    return YES;
}

//是否支持多时候触发，返回YES，则可以多个手势一起触发方法，返回NO则为互斥
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
//    NSLog(@"禁止下拉");
//    CGPoint offset = scrollView.contentOffset;
//    if (offset.y <= 0) {
//        offset.y = 0;
//    }
//    scrollView.contentOffset = offset;
    
    if (self.isPan) {
        scrollView.contentOffset = CGPointMake(0, 0);
    }
    NSLog(@"%f",scrollView.contentOffset.y);
    if (scrollView.contentOffset.y <= 0) {
        scrollView.bounces = NO;
        NSLog(@"禁止下拉");
        
        scrollView.contentOffset = CGPointMake(0, 0);
        
    } else if (scrollView.contentOffset.y >= 0){
        scrollView.bounces = YES;
        NSLog(@"允许上拉");

    }
}

- (void)clickTextBtn:(UIButton *)btn {
    @weakify(self);
    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
        @strongify(self);
        if (sucess) {
            @weakify(self);
            [self.service showSeniorSingleTextType:RRCommentViewTypeAmwayWriteComment
                                       placeholder:@"点击这里写评论~"
                                               key:@""
                                         superView:nil
                                       submitBlock:^(NSString *_Nonnull content, NSArray *_Nonnull imageDataArray, BOOL isSpoiler) {
                @strongify(self);
                [self articleReplay:content imageDatas:imageDataArray toComment:nil isSpoiler:isSpoiler msgLevel:RRSeniorCommentCreateApiMsgLevelOne];
            }];
        }
    }];
}

- (void)articleReplay:(NSString *)content imageDatas:(NSArray *)imageDatas toComment:(RRSeniorCommentsModel *)model isSpoiler:(BOOL)isSpoiler msgLevel:(RRSeniorCommentCreateApiMsgLevel)msgLevel {
    if (self.isReplying) {
        return;
    }
    if (![self checkCommentAvailable:content]) {
        return;
    }
    [IanAlert showLoading:@"发送中"];
    self.isReplying = YES;
    if (imageDatas.count) {
        @weakify(self);
        [[[RRImageGetTokenApi alloc] initWith:@"comment" originalFilename:[RRImageGetTokenApi getFileNameArrayString:imageDatas]] startWithCompletionBlock:^(RRJsonModel *result, NSError *error) {
            @strongify(self);
            if (!error && result.code == SUCCESSCODE) {
                NSArray *keys = [result.dataDict[@"fileKey"] componentsSeparatedByString:@","];
                if (keys.count == imageDatas.count) {
                    [[RRImageUploadManager manager] uploadImageDatas:imageDatas
                                                               token:result.dataDict[@"token"]
                                                                keys:keys
                                                             atIndex:0
                                                            complete:^(NSMutableArray *_Nonnull keys) {
                        if (keys.count == imageDatas.count) {
                            [self createComment:content images:[RRSeniorCommentCreateApi conversionImageDatas:imageDatas keys:keys] toComment:model isSpoiler:isSpoiler msgLevel:msgLevel];
                        } else {
                            [IanAlert alertError:@"图片上传失败" length:TIMELENGTH];
                            self.isReplying = NO;
                        }
                    }];
                }  else {
                    [IanAlert alertError:@"图片上传失败" length:TIMELENGTH];
                    self.isReplying = NO;
                }
            } else {
                [IanAlert alertError:@"图片上传失败" length:TIMELENGTH];
                self.isReplying = NO;
            }
        }];
    } else {
        [self createComment:content images:imageDatas toComment:model isSpoiler:isSpoiler msgLevel:msgLevel];
    }
}

- (void)createComment:(NSString *)content images:(NSArray *)images toComment:(RRSeniorCommentsModel *)model isSpoiler:(BOOL)isSpoiler msgLevel:(RRSeniorCommentCreateApiMsgLevel)msgLevel {
    WS(weakSelf);
    NSString *reply2Id = @"";
    if (model) {
        reply2Id = model.ID;
    }
    NSString *reply2UseId = @"";
    if (model) {
        reply2UseId = model.author.ID;
    }
    
    //发送评论的类型
    RRSeniorCommentCreateApiType commentCreateApiType;
    if ([self.type isEqualToString:@"DRAMA"]) {
        commentCreateApiType = RRSeniorCommentCreateApiTypeDRAMA;
    } else if ([self.type isEqualToString:@"DRAMA_COMMENT"]) {
        commentCreateApiType = RRSeniorCommentCreateApiTypeDRAMACOMMENT;
    } else if ([self.type isEqualToString:@"VIDEO"]) {
        commentCreateApiType = RRSeniorCommentCreateApiTypeVIDEO;
    } else {
        commentCreateApiType = RRSeniorCommentCreateApiTypeOTHER;
    }
    
    [[[RRSeniorCommentCreateApi alloc] initCommentWithCommentType:commentCreateApiType typeId:self.videoId content:content images:images reply2Id:reply2Id spoiler:isSpoiler msgLevel:msgLevel reply2UseId:reply2UseId] startWithCompletionBlock:^(RRJsonModel *result, NSError *error) {
        weakSelf.isReplying = NO;
        if (error) {
            [IanAlert alertError:error.localizedDescription length:TIMELENGTH];
        } else {
            if (result.code == SUCCESSCODE) {
                [IanAlert alertSuccess:@"发表成功" length:TIMELENGTH];
                RRSeniorCommentsModel *resultModel = [RRSeniorCommentsModel modelWithDictionary:result.data];
                if (msgLevel == RRSeniorCommentCreateApiMsgLevelOne) {
                    [weakSelf commentBackResultModel:resultModel];
                } else {
                    [weakSelf replayBackResultModel:resultModel commentsModel:model];
                }
                [weakSelf.service closeReplyView];
            } else if (result.code == 3001) {
                [IanAlert alertError:@"频率太快啦，喝口水歇一下" length:TIMELENGTH];

            } else if (result.code == 3002) {
                [IanAlert alertError:@"已经提交过了,请别重复提交" length:TIMELENGTH];

            } else {
                [IanAlert alertError:result.msg length:TIMELENGTH];
            }
        }
    }];
}

- (BOOL)checkCommentAvailable:(NSString *)content {
    if (content.length <= 0) {
        [IanAlert alertError:@"你还没写评论哦" length:TIMELENGTH];
        return NO;
    } else if (content.length < 3) {
        [IanAlert alertError:@"多说点吧，别偷懒哦！" length:TIMELENGTH];
        return NO;
    } else if (content.length > 1000) {
        [IanAlert alertError:@"已超出字数上限" length:TIMELENGTH];
        return NO;
    } else if (![content isLegaReplay:content]) {
        [IanAlert alertError:@"请不要重复发布相同内容" length:TIMELENGTH];
        return NO;
    }
    return YES;
}

//发送一级评论成功刷新
- (void)commentBackResultModel:(RRSeniorCommentsModel *)model {

    [self.dataSource.dataArray insertObject:model atIndex:0];
    [self.tableView reloadData];
    
    //获取到需要跳转位置的行数
    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    //滚动到其相应的位置
    [self.tableView scrollToRowAtIndexPath:scrollIndexPath
            atScrollPosition:UITableViewScrollPositionTop animated:NO];
    self.listCount = self.listCount + 1;
    self.titleLab.text = [NSString stringWithFormat:@"全部%zi条", self.listCount];

    self.noDataView.hidden = YES;
}

//回复评论成功刷新
- (void)replayBackResultModel:(RRSeniorCommentsModel *)newModel commentsModel:(RRSeniorCommentsModel *)commentsModel {
    
    if (commentsModel.replyCount < 2) {
        NSMutableArray *tempArr = nil;
        if (commentsModel.replies.count > 0) {
            tempArr = [NSMutableArray arrayWithArray:commentsModel.replies];
            [tempArr addObject:newModel];
            
        } else {
            tempArr = [NSMutableArray array];
            [tempArr addObject:newModel];
        }
        commentsModel.replies = tempArr;
        commentsModel.replyCount = commentsModel.replyCount + 1;
    } else{
        commentsModel.replyCount = commentsModel.replyCount + 1;
    }
    [self.tableView reloadData];
}

#pragma - mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    RRSeniorCommentsModel *model = [self.dataSource.dataArray objectOrNilAtIndex:indexPath.row];
    return [RRSeasonSeniorCommentsTextImageReplyListCell cellHeightWithModel:model isShowAll:NO];
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
    RRSeasonSeniorCommentsTextImageReplyListCell *cell = (RRSeasonSeniorCommentsTextImageReplyListCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRSeasonSeniorCommentsTextImageReplyListCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.isHalf = YES;
    cell.isHalf = self.isHalf;
    cell.showPhotoVC = self; 
    RRSeniorCommentsModel *model = [self.dataSource.dataArray objectOrNilAtIndex:indexPath.row];
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
    
//    if (self.detailPopView) {
//        return;
//    }
//    NSString *replyId = replyModel ? replyModel.ID : nil;
//    //    RRVideoCommentsDetailPopView *popView = [[RRVideoCommentsDetailPopView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KHeight)];
//    RRVideoCommentsDetailPopView *detailPopView = [[RRVideoCommentsDetailPopView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KHeight) commentModel:commentModel replyId:replyId isShowMore:isShowMore delegate:self];
//    self.detailPopView = detailPopView;
//    [self.detailPopView showInView:self.view.superview.superview];

    NSString *replyId = replyModel ? replyModel.ID : nil;
    RRVideoCommentsDetailVC *vc = [[RRVideoCommentsDetailVC alloc] initWithIsHalf:YES];
    vc.commentModel = commentModel;
    vc.replyId = replyId;
    vc.isShowMore = isShowMore;
    vc.delegate = self;
    
//    [self addChildViewController:vc];
//    [vc didMoveToParentViewController:self];
//    [self.view addSubview:vc.view];
    
    [self.view.superview addSubview:vc.view];
    self.videoCommentsDetailVC = vc;
    
    vc.view.frame = CGRectMake(0, KHeight - playerViewHeight(), KWidth, KHeight - playerViewHeight());
    [UIView animateWithDuration:0.25
                     animations:^{
        vc.view.frame = CGRectMake(0, 0, KWidth, KHeight - playerViewHeight());
    }];
 
}

//#pragma mark - RRVideoCommentsDetailPopViewDelegate
////关闭页面
//- (void)closeVideoCommentsDetailPopView:(RRVideoCommentsDetailPopView *)view {
//    self.detailPopView = nil;
//}

#pragma mark - RRVideoCommentsDetailVCDelegate
//关闭页面
- (void)closeVideoCommentsDetailVC:(RRVideoCommentsDetailVC *)vc {
    [self.tableView reloadData];
//    if (self.detailPopView) {
//        [self.detailPopView hidden];
//        self.detailPopView = nil;
//    }
}

//关闭all页面
- (void)closeAllVideoCommentsVC:(RRVideoCommentsDetailVC *)vc {
    [self closeView];
}

//vc跳转删除
- (void)videoCommentsDetailVC:(RRVideoCommentsDetailVC *)vc
                  deleteModel:(RRSeniorCommentsModel *)deleteModel {
    [self clickDeleteWithModel:deleteModel];
//    if (self.detailPopView) {
//        [self.detailPopView hidden];
//        self.detailPopView = nil;
//    }
}

//拖拽
- (void)dragVideoCommentsDetailVCWithFrame:(CGRect)frame {
    self.view.frame = self.videoCommentsDetailVC.view.frame;
}

//#pragma mark -  RRSeasonSeniorCommentsDetailVCDelegate
//- (void)seasonSeniorCommentsSecondarySubVC:(RRSeasonSeniorCommentsDetailVC *)vc deleteModel:(RRSeniorCommentsModel *)deleteModel {
////    if (self.clickDelete) {
////        self.clickDelete(self.model);
////    }
//    [self clickDeleteWithModel:deleteModel];
//}
//
//- (void)closeSeasonSeniorCommentsSecondarySubVC:(RRSeasonSeniorCommentsDetailVC *)vc {
//    if (!self.tableView.isHidden) {
//        [self.tableView reloadData];
//    }
//}

//删除
- (void)clickDeleteWithModel:(RRSeniorCommentsModel *)model {
    NSMutableArray *tempArr = [[NSMutableArray alloc] init];
    for (RRSeniorCommentsModel *nowModel in self.dataSource.dataArray) {
        if (![nowModel.ID isEqualToString:model.ID]) {
            [tempArr addObject:nowModel];
        }
    }
    [self.dataSource.dataArray removeAllObjects];
    [self.dataSource appendDatas:tempArr];
    [self.tableView reloadData];
    self.listCount = self.listCount - 1;
    self.titleLab.text = [NSString stringWithFormat:@"全部%zi条", self.listCount];

}

- (void)clickCommentWithModel:(RRSeniorCommentsModel *)model {
    @weakify(self);
    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
        @strongify(self);
        if (sucess) {
            @weakify(self);
            [self.service showSeniorSingleTextType:RRCommentViewTypeAmwayReplyComment
                                       placeholder:[NSString stringWithFormat:@"回复%@", model.author.nickName ?: @""]
                                               key:model.ID
                                         superView:nil
                                       submitBlock:^(NSString *_Nonnull content, NSArray *_Nonnull imageDataArray, BOOL isSpoiler) {
                @strongify(self);
                [self articleReplay:content imageDatas:imageDataArray toComment:model isSpoiler:isSpoiler msgLevel:RRSeniorCommentCreateApiMsgLevelTwo];
            }];
        }
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //点击cell回复
    RRSeniorCommentsModel *model = [self.dataSource.dataArray objectOrNilAtIndex:indexPath.row];
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

- (NSInteger)getTotal {
    return self.listCount;
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
        
//        WS(weakSelf)
//        RRSeasonSeniorCommentsHearder *header = [[RRSeasonSeniorCommentsHearder alloc] initWithFrame:CGRectMake(0, 0, KWidth, 42)];
//        header.clickStatusIndex = ^(UIResponder *sender, NSUInteger index) {
//            switch (index) {
//                case 0:
//                    weakSelf.sort = @"likeCount";
//                    break;
//                default:
//                    weakSelf.sort = @"createTime";
//                    break;
//            }
//            [weakSelf changeStatus];
//        };
//        header.clickSwichIndex = ^(UIResponder *sender, NSUInteger index) {
//            switch (index) {
//                case 0:
//                    weakSelf.spoiler = YES;
//                    break;
//                default:
//                    weakSelf.spoiler = NO;
//                    break;
//            }
//            [weakSelf changeStatus];
//        };
//        _tableView.tableHeaderView = header;
    }
    return _tableView;
}

//topBar
- (UIView *)topBar {
    if (!_topBar) {
        _topBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 49)];
        _topBar.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_1F2126;

        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_topBar.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(12, 12)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
        maskLayer.frame = _topBar.bounds;
        maskLayer.path = maskPath.CGPath;
        _topBar.layer.mask = maskLayer;
    }
    return _topBar;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KWidth, 49)];
        _titleLab.text = @"全部";
        _titleLab.font = BOLDSYSTEMFONT(17);
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
    [self closeView];
}

- (void)closeView {
    if (self.delegate && [self.delegate respondsToSelector:@selector(closeVideoCommentsVC:)]) {
        [self.delegate closeVideoCommentsVC:self];
    }
}

//- (void)changeStatus {
//    //刷新数据，清理定位model
////    [self cleanTopSeniorCommentsModel];
//    [self.listApi cancelRequest];
////    [self.tableView.mj_header beginRefreshing];
//    //footer正在刷新时候
//    if (self.tableView.mj_footer.isRefreshing) {
//        [self.tableView.mj_footer endRefreshing];
//    }
//    //header不在刷新时候
//    if (!self.tableView.mj_header.isRefreshing) {
//        [self.tableView.mj_header beginRefreshing];
//    } else {
//        self.dataSource.isLoading = NO;
//        self.dataSource.isRefreshing = NO;
//        [self refreshData];
//    }
//}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[RRSeasonSeniorCommentsInputBar alloc] initWithFrame:CGRectMake(0, 0, 320, 53)];
        [_bottomView.textBoxBtn addTarget:self action:@selector(clickTextBtn:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:_bottomView];
//
//        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.height.equalTo(@(53 - appMargin().bottom));
//            make.leading.equalTo(@(0));
//            make.trailing.equalTo(@(0));
//            make.bottom.equalTo(@(0));
//        }];
        //        [_bottomView sketchShadowWithOffsetX:0 offsetY:0 Blur:15 Spread:0 color:kCOLOR_dynamicProvider_Shadow_bar_000000Alpha008_000000Alpha14 alpha:1];
        [_bottomView sketchShadowWithBottomBar];
    }
    return _bottomView;
}

- (RRSeniorCommentsListApi *)listApi {
    if (!_listApi) {
        _listApi = [[RRSeniorCommentsListApi alloc] init];
    }
    return _listApi;
}

- (RRCommentService *)service {
    if (!_service) {
        _service = [[RRCommentService alloc] init];
        _service.darkMode = YES;
    }
    return _service;
}

//- (NSString *)rr_UMemgPageName {
//    return @"剧集详情页";
//}
//
//- (NSString *)rr_UMemgChannelName {
//    return @"详情";
//}

// 当iOS界面环境发生变化时，系统调用该方法。
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    [self.tableView reloadData];
}

- (void)dealloc {
    
}
@end
