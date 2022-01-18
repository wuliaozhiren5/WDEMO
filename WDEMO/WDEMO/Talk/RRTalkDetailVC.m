//
//  RRTalkDetailVC.m
//  PPVideo
//
//  Created by rrtv on 2021/12/14.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRTalkDetailVC.h"
#import "RRMainTouchTableTableView.h"
#import "RRParentClassScrollViewController.h"
#import "RRTalkContentListVC.h"
#import "RRTalkDetailSubVC.h"
#import "RRTalkDetailHeaderView.h"
#import "RRTalkDetailBottomView.h"

#import "RRTalkDetailApi.h"
#import "RRCommunityTalkModel.h"
#import "RRCreateTalkCommentViewController.h"
#import "RRTalkContentModel.h"

//static CGFloat const headViewHeight = 298;

@interface RRTalkDetailVC ()<UITableViewDelegate, UITableViewDataSource, scrollDelegate, RRTalkDetailHeaderViewDelegate, RRCreateTalkCommentViewControllerDelegate>
{
    CGFloat headViewHeight;//头部高度
}
//tableview
@property(nonatomic ,strong) RRMainTouchTableTableView *mainTableView;
//scrollView
@property(nonatomic,strong) UIScrollView *parentScrollView;

/*
 * canScroll= yes : mainTableView 视图可以滚动，parentScrollView 禁止滚动
 */
@property (nonatomic, assign) BOOL canScroll;

@property (nonatomic, assign) BOOL isTopIsCanNotMoveMainTableView;//到顶部不能滚动了
@property (nonatomic, assign) BOOL isTopIsCanNotMoveParentScrollView;//到顶部不能滚动了

//当前的subVC
@property (nonatomic,strong) UIViewController *currentSubVC;
 
//header 头
@property( nonatomic,strong) RRTalkDetailHeaderView *headView;//头部view

@property (nonatomic, strong) RRTalkDetailBottomView *bottomView;

@property (nonatomic, strong) RRCommunityTalkModel *talkDetailModel;

//阅读进度
@property (nonatomic, assign) CGFloat rate;

@property (nonatomic, strong) RRUmengContentPageContext *pageContext;
//@property (nonatomic, copy) NSString *recSource;//来源
@property (nonatomic, strong) YYLabel *titleLab;//富文本
@end

@implementation RRTalkDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    headViewHeight = 50;
    self.customTabbar.hidden = NO;
//    self.customTabbar.navTitle.text = @"话题";
    self.customTabbar.navDividingLine.hidden = YES;
 
    self.loadingView.hidden = NO;
//    self.loadingView.center = CGPointMake(self.view.centerX, self.view.centerY - 99 - appMargin().top);
//    self.noDataView.center = self.loadingView.center;
    
    [self refreshData];
//    [self setupViews];
    self.pageContext = [[RRUmengContentPageContext alloc] init];
}

////分享按钮
//- (void)addShareBtn {
//    [self.customTabbar.rightButton setImage:[UIImage imageNamed:@"ic_universal_navbar_share_white_40"] forState:UIControlStateNormal];
//    self.customTabbar.rightButton.hidden = NO;
//    [self.customTabbar.rightButton addTarget:self action:@selector(clickShareBtn) forControlEvents:UIControlEventTouchUpInside];
//}
//
//- (void)clickShareBtn {
//    RRShareModel *sharedModel = [[RRShareModel alloc] init];
//    sharedModel.shareId = @(self.actorModel.ID).stringValue;
//    sharedModel.shareType = RRShareModel_share_actorDetail;//影人详情
//    sharedModel.shareTitle = [NSString stringWithFormat:@"明星主页-%@", self.actorModel.chineseName];
//    sharedModel.shareContent = (self.actorModel.shareContent.length > 0 ? self.actorModel.shareContent : @"");
//    sharedModel.shareImageUrl = self.actorModel.headUrl;
//    sharedModel.shareStatisticsId = RRStatisticsIdTopListShareItem;
//    [[RRShareManager manager] showWithModel:sharedModel inView:[UIViewController topViewController].view];
//}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.pageContext pageAppear];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.pageContext pageDisappear];
 }

- (void)requestData {
    [self refreshData];
}

- (void)refreshData {
    WS(weakSelf)
//    //测试代码
//    self.talkId = @"1";
    NSString *talkId = self.talkId;
    [RRTalkDetailApi requestTalkDetailWithTalkId:talkId block:^(RRCommunityTalkModel * _Nonnull model, NSError * _Nonnull error) {
        if (error) {
            if (weakSelf.loadingView) {
                weakSelf.loadingView.msgType = RRMJLoadingErrorDefault;
                //                weakSelf.dataSource.error = error;
                [weakSelf stopLoading];
                return;
            }
        }
        weakSelf.loadingView.hidden = YES;
        self.talkDetailModel = model;
        [weakSelf stopLoading];
        
    }];
}

- (void)stopLoading {
    if (self.loadingView.isHidden) {
        if (self.talkDetailModel) {
            if (self.talkDetailModel.enable) {
                [self setupViews];
            } else {
                self.noDataView.hidden = NO;
                TOAST(@"该话题已失效");
            }
        } else {
            self.noDataView.hidden = NO;
        }
    } else {
        self.noDataView.hidden = YES;
    }
}

- (void)setupViews {
    [self createCurrentSubVC];
    [self createTableView];
    [self createbottomView];
    [self createTitle];
    [self.view bringSubviewToFront:self.noDataView];
    NSDictionary *sourceParam = [[RRUMengLogger sharedLogger] clickParamsWithContentType:kRRUmengEventContnetTypeTalk contentId:self.talkId];
    //内容页浏览完成
//    self.pageContext = [[RRUmengContentPageContext alloc] init];
    self.pageContext.contentID = self.talkId;
    self.pageContext.contentName = self.talkDetailModel.name;
    self.pageContext.contentType = kRRUmengEventContnetTypeTalk;
    self.pageContext.sourcePageName = sourceParam[kRRUmengEventKeySourcePage];
//    self.pageContext.recSource = self.recSource;
    self.pageContext.watchProgresStr = @"100%";
}

- (void)createCurrentSubVC {
    RRTalkContentListVC *hotVC = [[RRTalkContentListVC alloc] init];
    hotVC.talkId = self.talkId;
    hotVC.orderType = @"hot";
    hotVC.delegate = self;
    RRTalkContentListVC *newVC = [[RRTalkContentListVC alloc] init];
    newVC.talkId = self.talkId;
    newVC.orderType = @"new";
    newVC.delegate = self;
    
    NSInteger selectIndex = 0;
    NSArray *titles = @[@"热门",
                        @"最新"];
    NSArray *viewControllers = @[hotVC,
                                 newVC];
    RRTalkDetailSubVC *pageController = [[RRTalkDetailSubVC alloc] initWithTitles:titles viewControllers:viewControllers selectedIndex:selectIndex];
    pageController.view.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_1F2126;
    
    [self addChildViewController:pageController];
    [pageController didMoveToParentViewController:self];
    
    self.currentSubVC = pageController;
}

- (void)createTableView {
//    [self headView];
    self.headView.model = self.talkDetailModel;
    headViewHeight = self.headView.headerHeight;
    self.headView.frame = CGRectMake(0, -headViewHeight, KWidth, headViewHeight);
    //加渐变
    [self.headView addGradientLayer];
    [self.customTabbar.leftButton setImage:IMAGENAME(@"ic_universal_navbar_back_white_400") forState:UIControlStateNormal];
    self.customTabbar.hidden = NO;
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.mainTableView];
    [self.view insertSubview:self.mainTableView belowSubview:self.customTabbar];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.mainTableView addSubview:self.headView];
    [self.mainTableView bringSubviewToFront:self.headView];
    
    //支持下刷新。关闭弹簧效果
    //bounces = YES;外部支持下拉刷新
    //bounces = NO;内部支持下拉刷新
    self.mainTableView.bounces = NO;
    
    [self.view bringSubviewToFront:self.customTabbar];
    //    //取缩略图
    ////    [self.headImageView rr_delaySetImageWithURLString:self.actorModel.bgImgUrl placeholderImage:KplaceholderImg];
    //    //取原图
    //    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:self.actorModel.bgImgUrl] placeholderImage:KplaceholderImg];
    //    self.nicknameLabel.text = self.actorModel.chineseName;
    //    self.customTabbar.navTitle.text = self.actorModel.chineseName;
    //    [self addShareBtn];
}

- (void)createbottomView {
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.trailing.equalTo(@(-16));
//        make.bottom.equalTo(@(-16 + appMargin().bottom));
        make.bottom.equalTo(@(-24));
        make.width.equalTo(@116);
        make.height.equalTo(@38);
        make.centerX.equalTo(self.view);

    }];
//    self.bottomView.hidden = YES;
}

- (void)createTitle {
//    self.customTabbar.navTitle.text = @"话题";
    //标题
    {
        RRCommunityTalkModel *model = self.talkDetailModel;
        NSString *title = model.name ?: @"";
        CGFloat fontSize = 17.0;
        UIFont *textFont = BOLDSYSTEMFONT(fontSize);
        CGFloat textLineSpacing = 8 - (textFont.lineHeight - textFont.pointSize);
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
        //设置行间距
        text.lineSpacing = textLineSpacing;
        //设置文本字号
        text.font = textFont;
        //设置字体颜色
        text.color = kCOLOR_dynamicProvider_222222_FFFFFF;
        {
            NSMutableAttributedString *attachment = nil;
            // 嵌入 UIImage
            UIImage *image = [UIImage imageNamed:@"ic_topic_detail_jinghao_black"];
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.image = image;
            imageView.frame = CGRectMake(0, 0, 17, 17);
            //        imageView.backgroundColor = [UIColor redColor];
            //        imageView.layer.cornerRadius = 5;
            //        imageView.layer.masksToBounds = YES;
            //        imageView.userInteractionEnabled = YES;
            attachment = [NSMutableAttributedString attachmentStringWithContent:imageView contentMode:UIViewContentModeCenter attachmentSize:imageView.size alignToFont:textFont alignment:YYTextVerticalAlignmentCenter];
            attachment.lineSpacing = textLineSpacing;
            [text appendAttributedString: attachment];
        }
        {
            //加空格
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@" "];
            one.lineSpacing = textLineSpacing;
            one.font = textFont;
            //        one.color = RGBA(84, 84, 84, 1);
            [text appendAttributedString:one];
        }
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:title];
            one.lineSpacing = textLineSpacing;
            one.font = textFont;
            one.color = kCOLOR_dynamicProvider_222222_FFFFFF;
            //        one.color = RGBA(84, 84, 84, 1);
            [text appendAttributedString:one];
        }

        //角标 1热 2荐
        NSString *cornerImageStr = nil;
        if (model.corner == 1) {
            cornerImageStr = @"ic_topic_huati_re";
        } else if (model.corner == 2) {
            cornerImageStr = @"ic_topic_huati_jian";
        } else {
            cornerImageStr = nil;
        }

        if (cornerImageStr) {
            {
                //加空格
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@" "];
                one.lineSpacing = textLineSpacing;
                one.font = textFont;
                //        one.color = RGBA(84, 84, 84, 1);
                [text appendAttributedString:one];
            }
            NSMutableAttributedString *attachment = nil;
            // 嵌入 UIImage
            UIImage *image = [UIImage imageNamed:cornerImageStr];
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.image = image;
            imageView.frame = CGRectMake(0, 0, 15, 15);
            //        imageView.backgroundColor = [UIColor redColor];
            //        imageView.layer.cornerRadius = 5;
            //        imageView.layer.masksToBounds = YES;
            //        imageView.userInteractionEnabled = YES;
            attachment = [NSMutableAttributedString attachmentStringWithContent:imageView contentMode:UIViewContentModeCenter attachmentSize:imageView.size alignToFont:textFont alignment:YYTextVerticalAlignmentCenter];
            attachment.lineSpacing = textLineSpacing;
            [text appendAttributedString: attachment];
        }

        self.titleLab.attributedText = text;
        [self.customTabbar addSubview:self.titleLab];
        [self.customTabbar bringSubviewToFront:self.titleLab];

        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.customTabbar.navTitle);
            make.width.lessThanOrEqualTo(@(KWidth - 60 * 2));
        }];
    }
}

- (void)clickSendBtn:(UIButton *)btn {
    @weakify(self)
    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
        @strongify(self)
        if (sucess) {
            RRCreateTalkCommentViewController *vc = [[RRCreateTalkCommentViewController alloc] init];
            vc.talkModel = self.talkDetailModel;
            vc.delegate = self;
            [[RRAppLinkManager sharedManager] pushViewController:vc animated:YES];
        }
    }];
 
    //功能点击
    NSMutableDictionary *parms = [NSMutableDictionary dictionary];
    parms[kRRUmengEventKeySourcePage] = self.rr_UMemgPageName;
//    parms[kRRUmengEventKeySourceChannel] = self.rr_UMemgChannelName;
    parms[kRRUmengEventKeyButtonName] = @"参与话题讨论";
    [RRUMengLogger modularClickedWithParams:parms];
    
}
#pragma mark -- RRCreateTalkCommentViewControllerDelegate
- (void)createTopicCommentViewCallBackModel:(RRSeniorCommentsModel *)model {
    if (!model) {
        return;
    }
    RRTalkContentModel *talkContentModel = [[RRTalkContentModel alloc] init];
    talkContentModel.type = @"comment";
    talkContentModel.contentInfo = model;
    
    RRTalkDetailSubVC *subVC = (RRTalkDetailSubVC *)self.currentSubVC;
    RRTalkContentListVC *listVC = (RRTalkContentListVC *)[subVC getCurrentVC];
    [listVC createTalkContentModel:talkContentModel];
    
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

#pragma mark -- scrollDelegate
- (void)scrollDidScroll:(UIScrollView *)scrollView {
    self.parentScrollView = scrollView;
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY < 0) {
        self.canScroll = YES;
        if (self.isTopIsCanNotMoveMainTableView) {
            self.isTopIsCanNotMoveParentScrollView = NO;
        } else {
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
            self.isTopIsCanNotMoveParentScrollView = YES;
            self.canScroll = NO;
        } else {
            self.parentScrollView.contentOffset = CGPointMake(0, 0);
            self.canScroll = YES;
        }
    }
}

- (void)scrollViewChangeTab:(UIScrollView *)scrollView {
    self.parentScrollView = scrollView;
    /*
     * 如果已经离开顶端 切换tab parentScrollView的contentOffset 应该初始化位置
     
     */
    if (self.canScroll) {
        self.parentScrollView.contentOffset = CGPointMake(0, 0);
    }
}

#pragma mark -- UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    /*
     *  处理联动事件
     */
    
    //获取滚动视图y值的偏移量
    CGFloat tabOffsetY = -statusMarginToTop() - navMarginToTop();//0;
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY >= headViewHeight) {
        scrollView.contentOffset = CGPointMake(0, tabOffsetY);
        offsetY = tabOffsetY;
    }
    if (!self.isTopIsCanNotMoveParentScrollView) {
        if (offsetY >= tabOffsetY) {
            scrollView.contentOffset = CGPointMake(0, tabOffsetY);
            self.isTopIsCanNotMoveMainTableView = YES;
            
        }else{
            self.isTopIsCanNotMoveMainTableView = NO;
        }
    } else {
        scrollView.contentOffset = CGPointMake(0, tabOffsetY);
    }
    
    //导航栏
    CGFloat minAlphaOffset = statusMarginToTop() + navMarginToTop();
    CGFloat maxAlphaOffset = headViewHeight;
    CGFloat offset = scrollView.contentOffset.y;
    CGFloat alpha = 1 + (offset + minAlphaOffset) / (maxAlphaOffset - minAlphaOffset);
    self.customTabbar.backgroundColor = [kCOLOR_dynamicProvider_FFFFFF_1F2126 colorWithAlphaComponent:alpha];
    self.customTabbar.navImage.alpha = 0.0;
//    self.customTabbar.navTitle.alpha = alpha;
//    self.customTabbar.navDividingLine.alpha = alpha;
//    self.headView.container.alpha = 1.0 - alpha;
    self.titleLab.alpha = alpha;
}

#pragma mark -- UITableDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return KHeight - statusMarginToTop() - navMarginToTop();
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    cell.contentView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.8];

    UIViewController *showVC = self.currentSubVC;
    UIView *view = showVC.view;
    [cell.contentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(cell.contentView);
    }];
    return cell;
}

#pragma mark -- lazy 懒加载
- (RRMainTouchTableTableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView= [[RRMainTouchTableTableView alloc]initWithFrame:CGRectMake(0, 0, KWidth, KHeight)];
        if (@available(iOS 11.0, *)) {
            _mainTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
//            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.contentInset = UIEdgeInsetsMake(headViewHeight,0, 0, 0);
        _mainTableView.backgroundColor = [UIColor clearColor]; 
//        _mainTableView.contentOffset = CGPointMake(0, -headViewHeight);
    }
    return _mainTableView;
}

- (RRTalkDetailHeaderView *)headView {
    if (!_headView) {
        _headView = [[RRTalkDetailHeaderView alloc] initWithFrame:CGRectMake(0, -headViewHeight, KWidth, headViewHeight)];
        _headView.backgroundColor = [UIColor grayColor];
        _headView.delegate = self;
    }
    return _headView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[RRTalkDetailBottomView alloc] initWithFrame:CGRectMake(0, 0, 116, 38.0)];
        _bottomView.backgroundColor = kCOLOR_1890FF;
        _bottomView.layer.cornerRadius = 38.0 / 2;
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

- (YYLabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [YYLabel new];
        _titleLab.frame = CGRectMake(0, 0, 320, 40);
        //        _titleLab.font = RR_COMMONFONT(14);
        _titleLab.font = BOLDSYSTEMFONT(17);
        _titleLab.textColor = kCOLOR_dynamicProvider_222222_DADBDC;
        _titleLab.numberOfLines = 1;
        //        _titleLab.lineBreakMode = NSLineBreakByCharWrapping;
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.alpha = 0;
    }
    return _titleLab;
}

#pragma mark -- RRTalkDetailHeaderViewDelegate
//大小变化
- (void)talkDetailHeaderViewFrameChange {
    //前后变化的差值
    CGFloat y = self.headView.headerHeight - headViewHeight;
    
    headViewHeight = self.headView.headerHeight;
    self.headView.frame = CGRectMake(0, -headViewHeight, KWidth, headViewHeight);
    //加渐变
    [self.headView addGradientLayer];
    
    self.mainTableView.contentInset = UIEdgeInsetsMake(headViewHeight,0, 0, 0);
    
    //设置列表的开始位置，不设置的话交互有点不协调
    CGPoint contentOffset = self.mainTableView.contentOffset;
    if (y > 0) {
        self.mainTableView.contentOffset = CGPointMake(0, - y + contentOffset.y);
    } else {
        self.mainTableView.contentOffset = CGPointMake(0, contentOffset.y); 
    }
}

// 当iOS界面环境发生变化时，系统调用该方法。
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    if (_titleLab) {
        [self createTitle];
    }
}

- (NSString *)rr_UMemgPageName {
    if ([self.talkId isKindOfClass:[NSString class]] && self.talkId.length) {
        return [NSString stringWithFormat:@"%@#@#话题详情页", self.talkId];
    }
    return @"话题详情页";
}


@end
