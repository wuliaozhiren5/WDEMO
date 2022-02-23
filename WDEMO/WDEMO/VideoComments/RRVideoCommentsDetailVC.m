//
//  RRVideoCommentsDetailVC.m
//  PPVideo
//
//  Created by rrtv on 2022/1/25.
//  Copyright © 2022 RRMJ. All rights reserved.
//

#import "RRVideoCommentsDetailVC.h"
#import "RRSeasonSeniorCommentsPraiseBtnInputBar.h"
#import "RRCommentService.h"
#import "RRSeasonSeniorCommentsHearder.h"
#import "RRSeasonSeniorCommentsTextImageCell.h"
#import "RRSeasonSeniorCommentsReplyTextImageCell.h"
#import "RRSeniorCommentsReplyListApi.h"
#import "RRImageGetTokenApi.h"
#import "RRImageUploadManager.h"
#import "RRSeniorCommentCreateApi.h"
#import "NSString+ZY.h"
#import "PriseDynamicApi.h"

@interface RRVideoCommentsDetailVC () <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) RRCommentService *service;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RRSeasonSeniorCommentsPraiseBtnInputBar *bottomView;

@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UILabel *headerLab;

@property (nonatomic, assign) BOOL isHalf;          //半屏
@property (nonatomic, strong) UIView *topBar;       //半屏
@property (nonatomic, strong) UILabel *titleLab;    //半屏详情
@property (nonatomic, strong) UIButton *closeBtn;   //半屏

@property (nonatomic, strong) RRDataSource *dataSource;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger rows;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) BOOL isReplying;

//@property (nonatomic, assign) NSInteger index;
////展示全部文字
//@property (nonatomic, assign) BOOL isShowMore;
//类型
@property (nonatomic, copy) NSString *type;//DRAMA 剧；VIDEO 视频；DRAMA_COMMENT 影评

@property (nonatomic, assign) BOOL isPan;

@end

@implementation RRVideoCommentsDetailVC

- (instancetype)initWithIsHalf:(BOOL)isHalf {
    self = [super init];
    if (self) {
        self.isHalf = isHalf;
        self.type = @"VIDEO";
//        _service = [[RRCommentService alloc] init];
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
    // 暗黑
    [self.view setDarkMode:YES];
    self.customTabbar.navTitle.text = @"评论详情";
    self.customTabbar.hidden = self.isHalf;
    self.dataSource = [[RRDataSource alloc] init];
    self.page = 1;
    self.rows = 10;
    self.total = 0;
//    self.isShowMore = NO;
    
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
    self.dataSource.isLoading = YES;
    self.dataSource.isRefreshing = NO;
    
    [self loadDataWithPage:self.page + 1];
}

- (void)loadDataWithPage:(NSInteger)page {
    NSString *typeId = self.commentModel.ID;//self.commentId;
    NSString *type = self.type;
//    NSString *type = @"DRAMA";
    //    BOOL spoiler = self.spoiler;
    //    NSString *sort = self.sort;
    NSInteger currentPage = page;
    NSInteger size = self.rows;
    
    WS(weakSelf)
    [RRSeniorCommentsReplyListApi requestSeniorCommentsReplyListWithTypeId:typeId
                                                                      type:type
                                                                      page:currentPage
                                                                      size:size
                                                                     block:^(RRSeniorCommentsReplyListModel * _Nonnull model, NSError * _Nonnull error) {
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
        //total
        weakSelf.total = model.total;

        weakSelf.loadingView.hidden = YES;
        [weakSelf.dataSource appendDatas:model.content];
        weakSelf.dataSource.isLoading = NO;
        weakSelf.dataSource.isRefreshing = NO;
        weakSelf.dataSource.noMoreData = model.isEnd;
        weakSelf.dataSource.error = error;
        
        [weakSelf stopLoading];
    }];
}

- (void)stopLoading {

    self.dataSource.isLoading = NO;
    self.dataSource.isRefreshing = NO;
    
    [self.tableView.mj_footer endRefreshing];
    [self.tableView.mj_header endRefreshing];
    [self addHeader];
    [self addFooter];
     
    if (self.dataSource.noMoreData) {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    } else {
        [self.tableView.mj_footer resetNoMoreData];
    }
//    self.noDataView.hidden = !self.dataSource.isNoData;
//    self.noDataView.placeText = @"抱歉，没有找到相关内容";

    //loding还在显示，detail不存在
    if (!self.loadingView.isHidden || !self.commentModel) {
        //隐藏
        self.bottomView.hidden = YES;
        [self removeFooter];
        
        [self.tableView reloadData];
    } else {
        //显示
        self.bottomView.hidden = NO;
        self.bottomView.praiseBtn.selected = self.commentModel.liked;
        self.bottomView.praiseBtnLab.text = [NSString commentLikeTransformCountWithString:self.commentModel.likeCount];
        
        [self.tableView reloadData];
        //定位
        [self tableViewLocation];
    }
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

//定位
- (void)tableViewLocation {
    if (!self.replyId) {
        return;
    }
    if (self.dataSource.dataArray.count <= 0) {
        return;
    }
 
    NSInteger index = -1;
    for (NSInteger i = 0; i < self.dataSource.dataArray.count; i++) {
        RRSeniorCommentsModel *model = [self.dataSource.dataArray objectOrNilAtIndex:i];
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
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(dragVideoCommentsDetailVCWithFrame:)]) {
            [self.delegate dragVideoCommentsDetailVCWithFrame:frame];
        }
        
        [recognizer setTranslation:CGPointZero inView:self.view];
        
        
    } else {
    }
    
    /**
     
     * 手势结束和失败时处理方式
     
     */
    
    if (recognizer.state == UIGestureRecognizerStateFailed || recognizer.state == UIGestureRecognizerStateEnded)  {
        /**
         
         * 试图向右拖拽超过试图本身一般位置时，关闭筛选试图；否则返回单初始位置
         
         //         */
        self.isPan = NO;
        if (self.view.frame.size.height - self.view.frame.origin.y > self.view.frame.size.height / 3) {
            //            ...  回退动作
            CGFloat x = 0;
            CGFloat y = 0;
            CGRect frame = self.view.frame;
            frame.origin.x = x;
            frame.origin.y = y;
            recognizer.view.frame = frame;
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(dragVideoCommentsDetailVCWithFrame:)]) {
                [self.delegate dragVideoCommentsDetailVCWithFrame:frame];
            }
            
        } else {
            //           ...  关闭动作
            [self closeAllView];
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
            [self closeAllView];
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
        
    } else  if (scrollView.contentOffset.y >= 0){
        scrollView.bounces = YES;
        NSLog(@"允许上拉");

    }
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (!self.loadingView.isHidden || !self.commentModel) {
        return 0;
    }
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        default:
            return self.dataSource.dataArray.count;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //     return [ArticleDetailCell cellHeightfor:model];
    NSInteger section = indexPath.section;
    switch (section) {
        case 0:
        {
            return [RRSeasonSeniorCommentsTextImageCell cellHeightWithModel:self.commentModel isShowAll:    self.isShowMore];
        }
            break;
        default:
        {
            RRSeniorCommentsModel *model = [self.dataSource.dataArray objectOrNilAtIndex:indexPath.row];
//            return [RRSeasonSeniorCommentsReplyTextImageCell cellHeightWithModel:model];
            return [RRSeasonSeniorCommentsReplyTextImageCell cellHeightWithModel:model isShowAll:YES];
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
//            NSInteger count = self.commentModel.replyCount;
            NSInteger count = self.total;
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
            RRSeasonSeniorCommentsTextImageCell *cell = (RRSeasonSeniorCommentsTextImageCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRSeasonSeniorCommentsTextImageCell class]) forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.isHalf = self.isHalf;
            cell.showPhotoVC = self;
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
            return cell;
        }
            break;
            
        default:{
            RRSeasonSeniorCommentsReplyTextImageCell *cell = (RRSeasonSeniorCommentsReplyTextImageCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRSeasonSeniorCommentsReplyTextImageCell class]) forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.isHalf = self.isHalf;
            cell.showPhotoVC = self;
            RRSeniorCommentsModel *model = [self.dataSource.dataArray objectOrNilAtIndex:indexPath.row];
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
            RRSeniorCommentsModel *model = [self.dataSource.dataArray objectOrNilAtIndex:indexPath.row];
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
        [_tableView registerClass:[RRSeasonSeniorCommentsTextImageCell class] forCellReuseIdentifier:NSStringFromClass([RRSeasonSeniorCommentsTextImageCell class])];
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
        [_bottomView sketchShadowWithBottomBar];
    }
    return _bottomView;
}

- (RRCommentService *)service {
    if (!_service) {
        _service = [[RRCommentService alloc] init];
        _service.darkMode = YES;
    }
    return _service;
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
        _titleLab.text = @"详情";
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
    [self dismiss];
    if (self.delegate && [self.delegate respondsToSelector:@selector(closeVideoCommentsDetailVC:)]) {
        [self.delegate closeVideoCommentsDetailVC:self];
    }
}

- (void)closeAllView {
    if (self.delegate && [self.delegate respondsToSelector:@selector(closeAllVideoCommentsVC:)]) {
        [self.delegate closeAllVideoCommentsVC:self];
    }
}

//- (void)show {
//    if (!self.isHalf) {
//        return;
//    }
//    self.view.frame = CGRectMake(0, KHeight, KWidth, KHeight - playerViewHeight());
//    [UIView animateWithDuration:0.25
//                     animations:^{
//        self.view.frame = CGRectMake(0, playerViewHeight(), KWidth, KHeight - playerViewHeight());
//    }];
//}

- (void)dismiss {
    if (!self.isHalf) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
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

}

- (void)popViewController {
    [super popViewController];
    if (self.delegate && [self.delegate respondsToSelector:@selector(closeVideoCommentsDetailVC:)]) {
        [self.delegate closeVideoCommentsDetailVC:self];
    }
}

//- (NSString *)rr_UMemgPageName {
//    return @"剧集详情页";
//}
//
//- (NSString *)rr_UMemgChannelName {
//    return @"详情";
//}

#pragma mark - 点赞
- (void)clickPraiseBtn:(UIButton *)btn {
    @weakify(self);
    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
        @strongify(self);
        if (sucess) {
            NSString *typeId = self.commentModel.ID;
            BOOL liked = self.commentModel.liked;
            @weakify(self);
            PriseDynamicApi *api = [[PriseDynamicApi alloc] initWithDynamic:typeId andDel:liked ? @"YES" : @""];
            [api startWithCompletionBlock:^(RRJsonModel *result, NSError *error) {
                @strongify(self);
                if (!result) {
                    TOAST(error.localizedDescription);
                    return;
                } else {
                    if (!liked) {
                        if (result.code == 0 || result.code == 3001) {//"code": "3001", "msg": "已经添加过收藏",
                            TOAST(@"点赞成功");
                            self.commentModel.liked = YES;
                            self.commentModel.likeCount = self.commentModel.likeCount + 1;
                            self.bottomView.commentModel = self.commentModel;

                        } else {
                            TOAST(result.msg);
                        }
                    } else {
                        if (result.code == 0 || result.code == 3002) {//"code": "3001", "msg": "已经添加过收藏",
                            TOAST(@"取消点赞");
                            self.commentModel.liked = NO;
                            self.commentModel.likeCount = self.commentModel.likeCount - 1;
                            self.bottomView.commentModel = self.commentModel;

                        } else {
                            TOAST(result.msg);
                        }
                    }
                }
            }];
        }
    }];
}

#pragma mark - 发评论
#pragma mark - 回复
- (void)clickTextBtn:(UIButton *)btn {
    @weakify(self);
    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
        @strongify(self);
        if (sucess) {
            @weakify(self);
            [self.service showSeniorSingleTextType:RRCommentViewTypeSeniorReplyComment placeholder:[NSString stringWithFormat:@"回复%@", self.commentModel.author.nickName ?: @""] key:self.commentModel.ID superView:nil submitBlock:^(NSString * _Nonnull content, NSArray * _Nonnull imageDataArray, BOOL isSpoiler) {
                @strongify(self);
                [self articleReplay:content imageDatas:imageDataArray toComment:self.commentModel isSpoiler:isSpoiler msgLevel:RRSeniorCommentCreateApiMsgLevelTwo];
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
                    [[RRImageUploadManager manager] uploadImageDatas:imageDatas token:result.dataDict[@"token"] keys:keys atIndex:0 complete:^(NSMutableArray * _Nonnull keys) {
                        if (keys.count == imageDatas.count) {
                            [self createComment:content images:[RRSeniorCommentCreateApi conversionImageDatas:imageDatas keys:keys] toComment:model isSpoiler:isSpoiler msgLevel:msgLevel];
                        } else {
                            [IanAlert alertError:@"图片上传失败" length:TIMELENGTH];
                            self.isReplying = NO;
                        }
                    }];
                } else {
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
    
    [[[RRSeniorCommentCreateApi alloc] initCommentWithCommentType:commentCreateApiType typeId:@"" content:content images:images reply2Id:reply2Id spoiler:isSpoiler msgLevel:msgLevel reply2UseId:reply2UseId] startWithCompletionBlock:^(RRJsonModel *result, NSError *error) {
        weakSelf.isReplying = NO;
        if (error) {
            [IanAlert alertError:error.localizedDescription length:TIMELENGTH];
        } else {
            if (result.code == SUCCESSCODE) {
                [IanAlert alertSuccess:@"发表成功" length:TIMELENGTH];
                RRSeniorCommentsModel *resultModel = [RRSeniorCommentsModel modelWithDictionary:result.data];
                if (msgLevel == RRSeniorCommentCreateApiMsgLevelThree) {
                    //三级回复
                    [weakSelf replayBackResultLevelThreeModel:resultModel];
                } else {
                    //二级回复
                    [weakSelf replayBackResultModel:resultModel];
                }
                
                [weakSelf.service closeReplyView];
            } else if (result.code == 3001){
                [IanAlert alertError:@"频率太快啦，喝口水歇一下" length:TIMELENGTH];
                
            } else if (result.code == 3002){
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


//点击cell回复评论
- (void)clickCommentWithModel:(RRSeniorCommentsModel *)model {
    @weakify(self);
    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
        @strongify(self);
        if (sucess) {
            @weakify(self);
            [self.service showSeniorSingleTextType:RRCommentViewTypeSeniorReplyComment placeholder:[NSString stringWithFormat:@"回复%@", model.author.nickName ?: @""] key:model.ID superView:nil submitBlock:^(NSString * _Nonnull content, NSArray * _Nonnull imageDataArray, BOOL isSpoiler) {
                @strongify(self);
                [self articleReplay:content imageDatas:imageDataArray toComment:model isSpoiler:isSpoiler msgLevel:RRSeniorCommentCreateApiMsgLevelTwo];
            }];
        }
    }];
}

//点击cell回复回复
- (void)clickReplyWithModel:(RRSeniorCommentsModel *)model {
    @weakify(self);
    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
        @strongify(self);
        if (sucess) {
            @weakify(self);
            [self.service showSeniorSingleTextType:RRCommentViewTypeSeniorReplyComment placeholder:[NSString stringWithFormat:@"回复%@", model.author.nickName ?: @""] key:model.ID superView:nil submitBlock:^(NSString * _Nonnull content, NSArray * _Nonnull imageDataArray, BOOL isSpoiler) {
                @strongify(self);
                [self articleReplay:content imageDatas:imageDataArray toComment:model isSpoiler:isSpoiler msgLevel:RRSeniorCommentCreateApiMsgLevelThree];
            }];
        }
    }];
}

//二级回复
- (void)replayBackResultModel:(RRSeniorCommentsModel *)model {
    [self.dataSource.dataArray insertObject:model atIndex:0];
    self.total = self.total + 1;
    [self.tableView reloadData];
    //获取到需要跳转位置的行数
    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:1];
    //滚动到其相应的位置
    [self.tableView scrollToRowAtIndexPath:scrollIndexPath
            atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

//三级回复
- (void)replayBackResultLevelThreeModel:(RRSeniorCommentsModel *)model {
//    [self.dataSource.dataArray addObject:model];
    [self.dataSource.dataArray insertObject:model atIndex:0];
    self.total = self.total + 1;
    [self.tableView reloadData];
    //获取到需要跳转位置的行数
    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:1];
    //滚动到其相应的位置
    [self.tableView scrollToRowAtIndexPath:scrollIndexPath
            atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

//点击cell删除评论
- (void)clickDeleteCommentWithModel:(RRSeniorCommentsModel *)model {
//    [self dismiss];
    if (self.delegate && [self.delegate respondsToSelector:@selector(videoCommentsDetailVC:transferModel:)]) {
        [self.delegate videoCommentsDetailVC:self deleteModel:model];
    }
    
//    if (self.delegate && [self.delegate respondsToSelector:@selector(closeVideoCommentsDetailVC:)]) {
//        [self.delegate closeVideoCommentsDetailVC:self];
//    }
}

//点击cell删除回复
- (void)clickDeleteReplyWithModel:(RRSeniorCommentsModel *)model {
    NSMutableArray *tempArr = [[NSMutableArray alloc] init];
    for (RRSeniorCommentsModel *nowModel in self.dataSource.dataArray) {
        if (![nowModel.ID isEqualToString:model.ID]) {
            [tempArr addObject:nowModel];
        }
    }
    [self.dataSource.dataArray removeAllObjects];
    [self.dataSource appendDatas:tempArr];
    self.total = self.total - 1;
    [self.tableView reloadData];
}

// 当iOS界面环境发生变化时，系统调用该方法。
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    [self.tableView reloadData];
}

- (void)dealloc {
}

@end
