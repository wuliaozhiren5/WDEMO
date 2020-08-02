//
//  PLUPersonalHomePageViewController.m
//  TGA
//
//  Created by plu on 16/9/23.
//  Copyright © 2016年 developer. All rights reserved.
//

#import "PLURouteServer+Live.h"
#import "PLUPersonalHomePageViewController.h"
#import "PLUPersonalHomePageView.h"

#import "PLURequest.h"
#import "PLUPersonalViewModel.h"
#import "PLUPersonalInfomationViewController.h"
#import "PLUPrepaidViewController.h"
#import "PLUPrepaidViewController.h"
#import "PLUHistoryRecordViewController.h"
#import "PLUWebPageViewController.h"
#import "PLUPersonalPlayRemindViewController.h"
#import "PLUPersonalSettingViewController.h"
#import "PLURequestConsts.h"

#import "AppDelegate.h"

#import "PLUReactNavigator.h"
#import "PLUPersonalCenterViewController.h"
#import "PLUUserCardViewModel.h"
#import "PLUGuardRoomInfo.h"
#import "PLUGetMsgsViewModel.h"
#import "PLUStartLiveBtnView.h"
#import "PLUPersonalVM.h"
#import "PLUSingleImagePicker.h"
#import "PLUReactNavigator+LZNewFunc.h"
#import "PLUPersonalOperation.h"

#import "PLUCTNoneAwardView.h"
#import "PLUCTSuccessView.h"
#import "PLUNewbieTaskController.h"
#import "PLURoomTaskVM.h"
#import "PLUBeansExchangeViewController.h"
#import "LZPrepaidExchangeVC.h"
#import "LZLoginControlVC.h"
#import "LZSNUpgradeSuccessView.h"
#import "PLUReactCarInfo.h"
#import "LZSNLoginUserInfoVM.h"
#import "PLUNewHandsFactory.h"
#import "LZPersonalAccountVC.h"
#import "LZIMImportDefine.h"
#import "LZEditPersonalInfoVC.h"
#import "LZSNModifyNicknameView.h"
#import "PLUAlertViewController.h"
#import "PLURoutes.h"
#import "PLURechargeViewModel.h"
#import "PLUBindIphoneViewController.h"
#import <PLUNetworking/PLUNetworking.h>
#import "LZPictureSelectorManager.h"
#import "LZCreatLive.h"
#import "PLUActivityCenterViewController.h"

#import "LZLoginAccountUpdateVM.h"

#import "LZLoginControlVC+route.h"

#import "LZSNBookVM.h"

#import <LZStatistic/LZStatistic.h>

NSString * const LZSignInVCPopNotification = @"LZSignInVCPopNotification";

@interface PLUPersonalHomePageViewController ()<UINavigationControllerDelegate,PLUPersonalHomePageViewDelegate,PLUPersonalHomePageViewDelegate,PLUMySubcribleCellDelegate,UIActionSheetDelegate, UIImagePickerControllerDelegate, PLUStartLiveBtnViewDelegate>

@property (strong, nonatomic) PLUPersonalHomePageView *personalHomePageView;

@property (strong, nonatomic) PLUPersonalViewModel *viewModel;

@property (strong, nonatomic) PLURoomTaskVM *roomTaskVM;

@property (strong, nonatomic) LZSNLoginUserInfoVM *loginUserInfoVM;

@property (strong, nonatomic) LZSNBookVM *bookVM;

@property (strong, nonatomic) UIImagePickerController *pick;

@property (copy, nonatomic)   SingleImagePickerResult result;

@property (strong, nonatomic) PLUStartLiveBtnView *startLiveBtnView;

//@property (weak, nonatomic) PLUNewHandShoppingMallView *shoppingMallNewHands;

@property (nonatomic,assign) BOOL isWillDisAppear;

@property (nonatomic, strong) LZPictureSelectorManager *manager;

@end

@implementation PLUPersonalHomePageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorFromHexRGB:@"f3f4f6"];

    _personalHomePageView = [[PLUPersonalHomePageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _personalHomePageView.delegate=self;
    [self.view addSubview:_personalHomePageView];
    [_personalHomePageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    _startLiveBtnView = [[PLUStartLiveBtnView alloc] init];
    _startLiveBtnView.delegate = self;
    [self.view addSubview:_startLiveBtnView];
    
    [_startLiveBtnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(@50);
        make.trailing.mas_equalTo(self.view).offset(-10);
        make.bottom.mas_equalTo(self.view).offset(-10);
    }];
    
   
    [self setupKVO];
    [self setPersonalGameRedDot];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh) name:PLUUserInfoUpdateNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logoutRefresh:) name:PLUUserDidLogoutNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshAuditInfo) name:PLUUserNickNameOrAvatarInfoUpdateNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(netWorkChangeToReachable) name:PLUNetworkingReachabilityDidChangeNotification object:nil];

//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showShoppingMallView) name:PLUInvitationCodeNoShowOrHideKey object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showShoppingMallView) name:PLUGivenGiftHideKey object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showShoppingMallView) name:SNAcountUpGrade object:nil];
    self.notCurrentClassBooL = YES;
}

- (BOOL)needHiddenNavigationBar {
	return YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.isWillDisAppear = false;
    [PLUAnalyticsCategory logPageView:@"uc"];
    [self isShowPlayButton];
    [self refresh];
    [self refreshAuditInfo];
    [self refreshBookInfo];

    [self loginRefresh];
    [self.personalHomePageView setMessagesBtnImage];
//    [_viewModel requestSubscriptionData];
    [_viewModel getSubscriptionData];
    [self.personalHomePageView reloadData];
    //[self showShoppingMallView];
    [PLURechargeViewModel retryFailedReceipts];
    [self requestFlowcardRedpointDisplayInfo];
    
    [_personalHomePageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    //请求大王卡红点
    [self requestFlowcardRedpointDisplayInfo];
    [LZStatistic trackWithEventType:LZStatisticEventTypePageOut params:@{LZStatisticEventConst.PageTitle:@"uc"}];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.isWillDisAppear = true;
    [PLUAnalyticsCategory endLogPageView:@"uc"];
    [LZStatistic trackWithEventType:LZStatisticEventTypePageOut params:@{LZStatisticEventConst.PageTitle:@"uc"}];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self removeKVO];
    
}


//请求大王卡红点
- (void)requestFlowcardRedpointDisplayInfo {
    WeakObj(self)
    [_viewModel showFlowNewRedLogo:^(BOOL isShow) {
        selfWeak.personalHomePageView.showFlowcardNewLogo = isShow;
    }];
}

- (void)isShowPlayButton {
    _startLiveBtnView.hidden = !kShowStartLiveBtn;
}

- (void)userDidLogout:(NSNotification *)notice{
    [super userDidLogout:notice];
    [self userNoLogin];
}

- (PLUUserInfoType)userInfoRefreshType{
    return [[PLUPersonalVM me] defaultType];
}

- (void)netWorkChangeToReachable {
    [[PLUPersonalVM me] refreshUserInfoComplete:nil];
    [self refresh];
    [self refreshAuditInfo];
    [self refreshBookInfo];
    [self loginRefresh];
}

- (NSString *)pageViewName{

    return @"uc";
}

#pragma mark - KVO
- (void)setupKVO {
    
    _loginUserInfoVM = [[LZSNLoginUserInfoVM alloc] init];
    
    _bookVM = [[LZSNBookVM alloc] init];
    
    _viewModel = [[PLUPersonalViewModel alloc] init];
    
    _roomTaskVM = [[PLURoomTaskVM alloc] init];
    _roomTaskVM.taskViewType = PLUTaskViewMine;
    
    [_roomTaskVM addObserver:self forKeyPath:PLURoomTaskVM.noviceTaskModel options:NSKeyValueObservingOptionNew context:&_roomTaskVM];
    
    [_viewModel addObserver:self
                 forKeyPath:PLUSubscriptionSuccessKey options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
    [_viewModel addObserver:self
                 forKeyPath:PersonalViewModelIsShowTaskIcon options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
    [[PLUGetMsgsViewModel shareViewModel] addObserver:self forKeyPath:NotiPersonalGameRedDot options:NSKeyValueObservingOptionNew context:nil];
}

- (void)removeKVO {
    [_viewModel removeObserver:self forKeyPath:PLUSubscriptionSuccessKey];
    [_viewModel removeObserver:self forKeyPath:PersonalViewModelIsShowTaskIcon];
    [[PLUGetMsgsViewModel shareViewModel] removeObserver:self forKeyPath:NotiPersonalGameRedDot];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:PLUSubscriptionSuccessKey]) {
        
        _personalHomePageView.subscribeDataSource = _viewModel.subscriptionData;
        //更新位置
       // [self updateShoppingMallNewHandsTop];
    }

    if ([keyPath isEqualToString:NotiPersonalGameRedDot]) {
        [self setPersonalGameRedDot];
    }
    if ([keyPath isEqualToString:PLURoomTaskVM.noviceTaskModel]) {
        _personalHomePageView.noviceTaskModel = _roomTaskVM.noviceTaskModel;
      //  [self updateShoppingMallNewHandsTop];
    }
    
}

- (void)setPersonalGameRedDot {
    BOOL personalGameRedDot = [PLUGetMsgsViewModel shareViewModel].personalGameRedDot;
    _personalHomePageView.personalGameRedDot = personalGameRedDot;
}

- (void)requestUserInfo {
    
    PLUPersonalInfoModel *personal =  [PLUPersonalVM me].personalInfo;
    _personalHomePageView.personalInfoModel = personal;
    [_viewModel requestPersonalData];
}

- (void)loginRefresh {
    if ([PLUPersonalVM me].isLogined) {
        [[PLUPersMessagesViewModel shareViewModel] loadNewMessage];
        [[PLUGetMsgsViewModel shareViewModel] requestGetMsgs];
        [_roomTaskVM requestTaskData];
    } else {
        _personalHomePageView.personalGameRedDot = NO;
    }
}

- (void)logoutRefresh:(NSNotification *)notice {
    _personalHomePageView.personalGameRedDot = NO;
}

- (void)refresh{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [PLUPersonalVM me].isLogined ? [self requestUserInfo]: [self userNoLogin];
    });
//    WeakObj(self)
//    [_loginUserInfoVM requestUserAuditInfoResult:^(BOOL success, LZUserAuditInfoModel *userAuditInfo, NSString *tips) {
//        StrongObj(selfWeak)
//        if (success) {
//            [PLUPersonalVM me].auditInfo = userAuditInfo;
//        }else {
//        }
//        [selfWeakStrong refreshUserInfo];
//    }];
}

//- (void)refreshUserInfo{
//
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [PLUPersonalVM me].isLogined ? [self requestUserInfo]: [self userNoLogin];
//    });
//}

- (void)refreshAuditInfo {
    
    if ([PLUPersonalVM me].isLogined) {
        WeakObj(self)
        [_loginUserInfoVM requestUserAuditInfoResult:^(BOOL success, LZUserAuditInfoModel *userAuditInfo, NSString *tips) {
            StrongObj(selfWeak)
            if (success) {
                [PLUPersonalVM me].auditInfo = userAuditInfo;
            }else {
            }
            [selfWeakStrong requestUserInfo];
        }];
    }
}

- (void)refreshBookInfo {
    
    WeakObj(self)
    [_bookVM requestSNBookWithResult:^(BOOL success, LZSNBookModel * _Nonnull bookModel, NSString * _Nonnull tips) {
        if (success) {
            selfWeak.personalHomePageView.bookModel = bookModel;

        }
    }];
}

- (void)userNoLogin{
    //隐藏任务完成的提示
    _personalHomePageView.personalInfoModel = nil;
}

#pragma mark - PLUStartLiveBtnViewDelegate

- (void)startLiveBtnView:(PLUStartLiveBtnView *)btnView didSelectedType:(PLUStartLiveBtnViewType)type {
    if (type == PLUStartLiveBtnViewType_suipai) {
        [self selectCenter];
    } else if (type == PLUStartLiveBtnViewType_mobileGame) {
        [self gotoSupaiDownloadPage];
    } else {}
}

- (void)gotoSupaiDownloadPage {

    PLUWebPageViewController *webView = [[PLUWebPageViewController alloc] init];
    webView.URLString = PLUDownloadSP;
    webView.isShowCloseBtn = NO;
    webView.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webView animated:YES];

}
#pragma mark - 开启随拍
- (void)selectCenter {
    
    CHECK_NETWORK
    NSString *eventId =@"uc_startlive";
    NSString *action = @"click_startlive";
    [[LZCreatLive shanreInstance] creatLive];
    
    [PLUAnalyticsCategory event:eventId action:action label:nil value:nil screen:@"uc" attributes:nil];
}

// 注册
- (void)userRegister{
    
    CHECK_NETWORK
    NSString *eventId =@"uc_register";
    NSString *action = @"click_register";
    [PLUAnalyticsCategory event:eventId action:action label:nil value:nil screen:@"uc" attributes:nil];
  
    [LZLoginControlVC showRegisterVC];
}

// 登录
-(void)userLogin{
    
    CHECK_NETWORK
    [PLURouteServer changeToPhoneCodeLoginVCWithShowAlert:false completed:^(BOOL isLogin) {
         
    }];
}

-(void)tapUserIcon{
 
    NSString *eventId = @"";
    NSString *action = @"";
    NSString *label = @"";
    eventId =@"uc_photo";
    action = @"click_photo";
    [PLUAnalyticsCategory event:eventId action:action label:label value:nil screen:@"uc" attributes:nil];
    
    WeakObj(self)
    LZPictureSelectorManagerModel *model = [LZPictureSelectorManagerModel new];
    model.title = @"从手机相册选择";
    model.type = LZPictureSelectorManagerSheetTypeLibrary;
    model.editingType = LZPictureSelectorEditingTypeDefault;
    
    LZPictureSelectorManagerModel *model1 = [LZPictureSelectorManagerModel new];
    model1.title = @"拍照";
    model1.type = LZPictureSelectorManagerSheetTypeCamera;
    model1.editingType = LZPictureSelectorEditingTypeDefault;
    
    self.manager = [LZPictureSelectorManager pictureSelectorSheetWithTitle:@"选择头像" sheetArray:@[model,model1] presentVC:self resultBlock:^(UIImage *image, LZPictureSelectorManagerSheetType sourceType) {
        if (image) {
            [PLUPersonalOperation updateAvatar:image result:^(BOOL success, NSString *tips) {
                if (success) {
                    [selfWeak refreshAuditInfo];
                }
                if (tips.length > 0) {
                    [selfWeak.view showRemberViewWithString:tips];
                }
            }];
        }
    }];
}

//个人主页
-(void)userPersonHomePage {
    //隐藏小红点
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"1" forKey:@"FirstEnterPersonCenter"];
    [defaults synchronize];
    
    PLUPersonalCenterViewController *vc = [[PLUPersonalCenterViewController alloc]init];
    vc.userId = [NSString stringWithFormat:@"%lld", [PLUPersonalVM me].personalInfo.uid];
    vc.hidesBottomBarWhenPushed =YES;
    [self.navigationController pushViewController:vc animated:YES];
    
    //埋点
    NSString *ec_event = @"uc";
    NSString *ea_action = @"click";
    NSString *cd_screen = @"uc";
    NSDictionary *el_label = @{@"label":[NSString stringWithFormat:@"uc_zone_%lld", [PLUPersonalVM me].personalInfo.uid]};
    [PLUAnalyticsCategory event:ec_event action:ea_action label:el_label value:nil screen:cd_screen attributes:nil];
    
}

-(void)userMessage{
    CHECK_NETWORK
    if (![PLUPersonalVM me].isLogined) {
        //去登录
        [self userLogin];
    } else {
        [[PLUIMController shareController] showAtRoomId:@"uc" offSetY:0];
    }
}

-(void)userInfo{

    CHECK_NETWORK
    if (![PLUPersonalVM me].isLogined) {
        //去登录
        [self userLogin];
        
    }
    else
    {
        NSString *eventId =@"uc_personal_information";
        NSString *action = @"go_to_information";
        [PLUAnalyticsCategory event:eventId action:action label:nil value:nil screen:@"uc" attributes:nil];
        
        PLUPersonalInfomationViewController *personalInfomationViewController = [[PLUPersonalInfomationViewController alloc]init];
        personalInfomationViewController.hidesBottomBarWhenPushed =YES;
        [self.navigationController pushViewController:personalInfomationViewController animated:YES];
    }
}

//签到
-(void)userSign{
//#ifdef DEBUG 
//#else
    
    CHECK_NETWORK
    if (![PLUPersonalVM me].isLogined) {
        //去登录
        [self userLogin];
    }
    else
    {
       [self goSignIn];
    }
//#endif
}

// 贵族
- (void)userNoble {
    CHECK_NETWORK
    if (![PLUPersonalVM me].isLogined) {
        [self userLogin];
    }
    else
    {
        [PLUReactNavigator gotoNoblePageAtVC:self withRoomId:nil];
    }
}

-(void)userGrade { 
//#ifdef DEBUG
//#else
    CHECK_NETWORK
    if (![PLUPersonalVM me].isLogined) {
        //去登录
        [self userLogin];
    }
    else
    {
        NSString *eventId =@"uc_grade";
        NSString *action = @"click_grade";
        [PLUAnalyticsCategory event:eventId action:action label:nil value:nil screen:@"uc" attributes:nil];
        //我的等级
        PLUWebPageViewController *webView = [[PLUWebPageViewController alloc] init];
        webView.URLString = PLUMyGrade;
        webView.theTitle = @"我的等级";
        webView.isShowShareBtn = NO;
        webView.isShowCloseBtn = NO;
        webView.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:webView animated:YES];
    }
//#endif
}
//苏宁会员
-(void)ecologyGrade {
    //#ifdef DEBUG
    //#else
    CHECK_NETWORK
    BOOL bind = [PLUPersonalVM me].personalInfo.bindStatus;
    if (![PLUPersonalVM me].isLogined) {
        //去登录
        [self userLogin];
    } else if (!bind) {
        [[LZLoginAccountUpdateVM sharedSingleton] requestConfigUpgrade:YES];
    } else {
        //苏宁会员
        PLUWebPageViewController *webView = [[PLUWebPageViewController alloc] init];
        webView.URLString = PLUEcologyGrade;
        webView.theTitle = @"苏宁会员";
        webView.isShowShareBtn = NO;
        webView.isShowCloseBtn = NO;
        webView.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:webView animated:YES];
    }
    //#endif
}

//充值
-(void)userRecharge{
    
    CHECK_NETWORK
    if (![PLUPersonalVM me].isLogined) {
        //去登录
        [self userLogin];
        
    }
    else
    {
        NSString *eventId =@"uc_recharge";
        NSString *action = @"click_recharge";
        [PLUAnalyticsCategory event:eventId action:action label:nil value:nil screen:@"uc" attributes:nil];
        
        LZPrepaidExchangeVC *prepaidExchangeVC = [[LZPrepaidExchangeVC alloc]init];
        prepaidExchangeVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:prepaidExchangeVC animated:YES];
   
    }
}

-(void)userSubscribe:(PLURelationshipUserModel *)subscribeModel{
    
    CHECK_NETWORK
    if (![PLUPersonalVM me].isLogined) {
            //去登录
        [self userLogin];
        
    } else {
        PLURelationshipUserModel *subModel = subscribeModel;
        NSString *gameID = subModel.gameID.stringValue;
        NSNumber *roomID = subModel.roomID;
        [PLURouteServer changePageWithGameId:gameID
                                      roomId:roomID.stringValue
                                  streamType:nil
                                      preUrl:nil
                                       cover:nil
                                    autoFeed:NO
                                    animated:YES
                                    delegate:nil];
        
        
    }
}

//我的关注
-(void)userSubscribe{
    CHECK_NETWORK
    if (![PLUPersonalVM me].isLogined) {
        //去登录
        [self userLogin];
        
    }
    else
    {
        NSString *eventId =@"uc_subscriber";
        NSString *action = @"click_subscriber";
        [PLUAnalyticsCategory event:eventId action:action label:nil value:nil screen:@"uc" attributes:nil];
        
        
        NSString *ec_event = @"my_sub_host";
        NSString *ea_action = @"click";
        NSString *cd_screen = @"uc";
        NSDictionary *el_label = @{@"label":@"my_sub_host_more", @"rid":@(852)};
        [PLUAnalyticsCategory event:ec_event action:ea_action label:el_label value:nil screen:cd_screen attributes:nil];
        
        [PLUReactNavigator goSubscribeList:self];
    }
    
}

//我的任务
-(void)userTask{
    
    CHECK_NETWORK
    if (![PLUPersonalVM me].isLogined) {
        //去登录
        [self userLogin];
        
    }
    else
    {
        
        
        NSString *eventId =@"uc_task";
        NSString *action = @"click_task";
        [PLUAnalyticsCategory event:eventId action:action label:nil value:nil screen:@"uc" attributes:nil];
        
        [PLUGlobalSettingManager shareManager].firstUserTask = NO;
        PLUNewbieTaskController *newbieTaskVC= [[PLUNewbieTaskController alloc]init];
        newbieTaskVC.hidesBottomBarWhenPushed =YES;
        [self.navigationController pushViewController:newbieTaskVC animated:YES];
    }
}

//礼券兑换
-(void)userTickerExchange {
    CHECK_NETWORK
    if (![PLUPersonalVM me].isLogined) {
        //去登录
        [self userLogin];
    } else {
        NSString *ec_event = @"click_vchr_exchange";
        NSString *ea_action = @"click_list";
        NSString *cd_screen = @"uc";
        NSDictionary *el_label = @{@"label":@"go_to_vchr_exchange"};
        [PLUAnalyticsCategory event:ec_event action:ea_action label:el_label value:nil screen:cd_screen attributes:nil];
        
        [PLUReactNavigator gotoTickerExchangeAtVC:self];
    }
}

//我的竞猜
-(void)userGuess {
    CHECK_NETWORK
    if (![PLUPersonalVM me].isLogined) {
            //去登录
        [self userLogin];
    } else {
        [PLUReactNavigator gotoMyQuizAtVC:self];
    }
}

//我的账户
-(void)userAccount {
    CHECK_NETWORK
    if (![PLUPersonalVM me].isLogined) {
        //去登录
        [self userLogin];
    } else {
        LZPersonalAccountVC *accountVC = [[LZPersonalAccountVC alloc] init];
        accountVC.hidesBottomBarWhenPushed =YES;
        [self.navigationController pushViewController:accountVC animated:YES];

        NSString *eventId =@"click";
        NSString *action = @"my_account";
        [PLUAnalyticsCategory event:eventId action:action label:nil value:nil screen:@"uc" attributes:nil];
        
//        RN
//        [PLUReactNavigator gotoMyAccoutVC:self];
    }
}

//观看记录
-(void)userWatchHistory{
    
    CHECK_NETWORK
    NSString *eventId =@"uc_watch_record";
    NSString *action = @"click_record";
    [PLUAnalyticsCategory event:eventId action:action label:nil value:nil screen:@"uc" attributes:nil];
    
    PLUHistoryRecordViewController *historyRecordViewController = [[PLUHistoryRecordViewController alloc]init];
    historyRecordViewController.hidesBottomBarWhenPushed =YES;
    [self.navigationController pushViewController:historyRecordViewController animated:YES];
    
}

//开播提醒
-(void)userPlayRemind{
    
    CHECK_NETWORK
    if (![PLUPersonalVM me].isLogined) {
        //去登录
        [self userLogin];
        
    }
    else
    {
        NSString *eventId =@"uc_liveremind";
        NSString *action = @"click_liveremind";
        
        [PLUAnalyticsCategory event:eventId action:action label:nil value:nil screen:@"uc" attributes:nil];
        
        PLUPersonalPlayRemindViewController *playRemindVC = [[PLUPersonalPlayRemindViewController alloc]init];
        playRemindVC.hidesBottomBarWhenPushed =YES;
        [self.navigationController pushViewController:playRemindVC animated:YES];
    }
}

//我的包裹
-(void)userPackage{
    
    CHECK_NETWORK
    if (![PLUPersonalVM me].isLogined) {
        //去登录
        [self userLogin];
        
    }
    else
    {
        NSString *eventId =@"uc_package";
        NSString *action = @"click_package";
        
        [PLUAnalyticsCategory event:eventId action:action label:nil value:nil screen:@"uc" attributes:nil];
        [PLUReactNavigator gotoMyPackageVC:self];
    }
}
  
//实名认证
-(void)userAuthentication {
    CHECK_NETWORK
    if (![PLUPersonalVM me].isLogined) {
        //去登录
        [self userLogin];
    } else {
       [[LZCreatLive shanreInstance] certify];
        
        NSString *cd_screen = @"uc";
        NSString *ea_action = @"click";
        NSString *ec_event = @"start_host_auth";
        NSDictionary *el_lable = @{@"rid":@(26)};
        [PLUAnalyticsCategory event:ec_event action:ea_action label:el_lable value:nil screen:cd_screen attributes:nil];
    }

//    LZEditPersonalInfoVC *infoVC = [[LZEditPersonalInfoVC alloc]init];
//    infoVC.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:infoVC animated:YES];
    
}



//游戏中心
-(void)userGameCenter{
    
    CHECK_NETWORK
    if (![PLUPersonalVM me].isLogined) {
        //去登录
        [self userLogin];
    } else {
        NSString *eventId =@"uc_gamecenter";
        NSString *action = @"click_gamecenter";
        [PLUAnalyticsCategory event:eventId action:action label:nil value:nil screen:@"uc" attributes:nil];
        
        [[PLUGetMsgsViewModel shareViewModel] clearLocalGameGameRedDot];
  
        [PLURouteServer changeToGameVC];
     }
}

/**
 活动中心
 */
- (void)activityCenter{
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasActivityNewIcon"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    PLUActivityCenterViewController *activityCenter = [[PLUActivityCenterViewController alloc]init];
    activityCenter.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:activityCenter animated:YES];
    
    //埋点
    NSString *ec_event = @"uc";
    NSString *ea_action = @"click";
    NSString *cd_screen = @"uc";
    NSDictionary *el_label = @{@"label":@"event_center"};
    [PLUAnalyticsCategory event:ec_event action:ea_action label:el_label value:nil screen:cd_screen attributes:nil];
}

//用户勋章
-(void)userMedal {

    CHECK_NETWORK
    if (![PLUPersonalVM me].isLogined) {
        //去登录
        [self userLogin];
    } else { 
        [PLURouteServer changeToMedalVC];
    }
 
    
    NSString *ec_event = @"my_medal";
    NSString *ea_action = @"click";
    NSString *cd_screen = @"uc";
    NSDictionary *el_label = @{@"rid":@(839)};
    [PLUAnalyticsCategory event:ec_event action:ea_action label:el_label value:nil screen:cd_screen attributes:nil];
}

//免流量观看（大王卡）
-(void)userFlowcard {
  
    NSString *ec_event = @"freeflow_watch";
    NSString *ea_action = @"click";
    NSString *cd_screen = @"uc";
    NSDictionary *el_label = @{@"rid":@(863)};
    [PLUAnalyticsCategory event:ec_event action:ea_action label:el_label value:nil screen:cd_screen attributes:nil];
    
    [PLUReactNavigator gotoKingCardAtVC:self];
    self.personalHomePageView.showFlowcardNewLogo = NO;
    [self.viewModel hideFlowNewRedLogo];

}
//苏宁读书
-(void)userSNBookWithUrlString:(NSString*)urlString {
    
    PLUWebPageViewController *webView = [[PLUWebPageViewController alloc] init];
    webView.URLString = urlString;
    webView.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webView animated:YES];
 
}

//下载随性拍APP
-(void)userDownloadApp{
    
    //下载随性拍APP
    PLUWebPageViewController *webView = [[PLUWebPageViewController alloc] init];
    webView.URLString = @"http://www.baidu.com";
    webView.theTitle = @"下载随性拍APP";
    webView.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webView animated:YES];
    
}

//设置
-(void)userSetting{
    
    NSString *eventId =@"uc_setup";
    NSString *action = @"click_setup";
    
    [PLUAnalyticsCategory event:eventId action:action label:nil value:nil screen:@"uc" attributes:nil];
    PLUPersonalSettingViewController *settingVC = [[PLUPersonalSettingViewController alloc]init];
    settingVC.hidesBottomBarWhenPushed =YES;
    [self.navigationController pushViewController:settingVC animated:YES];
}

//跳转到会员中心
-(void)userReact
{
    CHECK_NETWORK
    if (![PLUPersonalVM me].isLogined) {
        //去登录
        [self userLogin];
        
    } else {
		[PLUReactNavigator gotoLiveShop];
    }
}

-(void)userClickInvisibleSwitch{ 
    WeakObj(self);
    [_viewModel switchCurrentUserStealthlyStatus:^(BOOL success, NSString *tips) {
        if (success) {
            selfWeak.personalHomePageView.personalInfoModel =[PLUPersonalVM me].personalInfo;
            
        } else { 
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.view showRemberViewWithString:tips];
            });

        }
    }];
}
////当直播商城高度改变后回调
//-(void)updateShoppingMallNewHandsTop{
//    //我的关注中有正在直播的主播时
//    //top = 308 + 10 + 120 + 10 + 54 = 502
//    //没有正在直播的主播
//    //top = 308 + 10 + 54 + 10 + 54 = 436
//    CGFloat top = 0;
//    if(_viewModel.subscriptionData.count > 0){
//        top = 502;
//    }else{
//        top = 436;
//    }
//    if(_personalHomePageView.showUserTask == false){//不存在新手任务这一cell
//        top = top - 54;
//    }
//    if(isiPhoneXSeries){//适配iphoneX
//        top += 24;
//    }
//    top = top + (54-42)/2;
//    if(_shoppingMallNewHands){
//        if(top < [UIScreen mainScreen].bounds.size.height - 50){
//            _shoppingMallNewHands.storeViewFrame = CGRectMake(5, top, 111, 42);
//        }
//    }
//}
//- (void)showShoppingMallView {
//    UIWindow *window = [UIApplication sharedApplication].delegate.window;
//    //排除掉邀请码控件、注册成功控件、账号升级控件
//    if(kKG_SCRK && self.isWillDisAppear==false && [PLUPersonalVM me].isLogined && [self isKindOfClass:[PLUPersonalHomePageViewController class]] && ![window.subviews.lastObject isKindOfClass:NSClassFromString(@"PLUInvitationCodeView")] && ![window.subviews.lastObject isKindOfClass:NSClassFromString(@"LZSNModifyNicknameView")] && ![window.subviews.lastObject isKindOfClass:NSClassFromString(@"LZSNAccountUpgradeView")] && ![window.subviews.lastObject isKindOfClass:NSClassFromString(@"PLUNewHandShoppingMallView")] && ![window.subviews.lastObject isKindOfClass:NSClassFromString(@"LZSNUpgradeSuccessView")]){//用户登录并直播商城显示了
//        PLUNewHandShoppingMallView *shoppingMall = (PLUNewHandShoppingMallView *)[PLUNewHandsFactory showWithType:NewHandsTypeShopingMall SuperView:window Frame:[UIScreen mainScreen].bounds];
//        if(shoppingMall){
//             _shoppingMallNewHands = shoppingMall;
//             [self.personalHomePageView.tableView setContentOffset:CGPointMake(0, 0)];
//             [self updateShoppingMallNewHandsTop];
//        }
//    }
//}

- (NSString *)screenDesc {
    return @"uc";
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)goSignIn
{
    
    NSString *eventId =@"qiandao";
    NSString *action = @"click_qiandao";
    NSString *userid = NSStringFromLongLong([PLUPersonalVM me].personalInfo.uid);
    if (!userid.length) {
        userid = @"-1";
    }
    NSString *label = [NSString stringWithFormat:@"uid:%@",userid];
    [PLUAnalyticsCategory event:eventId action:action label:label value:nil screen:@"qiandao" attributes:nil];
    
    if (![PLUPersonalVM me].isBindedPhone)//第三方登录 并且要求没有绑定过手机号
    {
        [self bindPhone];
    }
    else{
        //签到
        PLUWebPageViewController *webView = [[PLUWebPageViewController alloc] init];
        if ([[PLUPersonalVM me].signInfo.data.sinType isEqualToNumber:@1]) {
            webView.URLString = PLUMouthSigninh5;
        } else if ([[PLUPersonalVM me].signInfo.data.sinType isEqualToNumber:@2]) {
            webView.URLString = PLUWeekSigninh5;
        } else {
            webView.URLString = PLUSigninh5;
        }
        webView.h5Type = PLUH5Checkin;
        webView.theTitle = @"签到";
        webView.h5Type = PLUH5Checkin;
        webView.hidesBottomBarWhenPushed = YES;
        webView.popBlock = ^{
            
            [[NSNotificationCenter defaultCenter] postNotificationName:LZSignInVCPopNotification object:nil];
        };
        [self.navigationController pushViewController:webView animated:YES];
    }
}

- (void)bindPhone
{
    PLUBindIphoneViewController *bindIphoneViewController = [[PLUBindIphoneViewController alloc]init];
    bindIphoneViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:bindIphoneViewController animated:YES];
    
}
@end
