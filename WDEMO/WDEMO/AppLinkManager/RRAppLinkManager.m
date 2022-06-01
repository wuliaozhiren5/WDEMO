//
//  RRAppLinkManager.m
//  WDEMO
//
//  Created by rrtv on 2022/6/1.
//  Copyright © 2022 wwc. All rights reserved.
//

#import "RRAppLinkManager.h"
//#import "NSURL+QueryDictionary.h"
//#import "BaseViewController.h"
//#import "RRSearchViewController.h"
//#import "RRSearchResultVC.h"
//#import "V3_RRUserUploadVedioDetailVC.h"
//#import "RRSeasonViewController.h"
//#import "NewsIntroModel.h"
//#import "NewTextDetailVC.h"
//#import "Activity_ViewController.h"
//#import "RegisterVC.h"
//#import "RRMyBoundViewController.h"
//#import "V3_SilverRecord.h"
//#import "RRRobSofaVideoViewController.h"
//#import "RRFilmNewsListViewController.h"
//#import "RRFilmTelevsionModel.h"
//#import "RRAmwayVideoUperQuickLookViewController.h"
//#import "RRSeasonListViewController.h"
//#import "RRNavigationSummaryModel.h"
//#import "RRVideoModuleCustomViewController.h"
//
////3.8.0
//#import "RRVideoAlbumWithSeasonViewController.h"
//#import "RRSpecialColumnViewController.h"
//#import "RRPopularitySeasonViewController.h"
//
//// 3.8.1
//#import "DateVC.h"
//#import "RRAllSeasonCategoryViewController.h"
//#import "RRMobileBoundingViewController.h"
//#import "RRBindWechatViewController.h"
//#import "RRUperVC.h"
//#import "RRQuicklookPushViewController.h"
////3.9.0
//#import <UTDID/UTDevice.h>
//
////4.0.0
//#import "RRPursuedVC.h"
//#import "RRMyCollectionSeriesViewController.h"
//#import "RRBingeWatchingViewController.h"
////4.1.5
//#import "V3_RRUserUploadVedioDetailVC.h"
//#import "RRHomeViewController.h"
//#import "RRHistoryViewController.h"
//#import "RRWebHandlerManager.h"
////#import "RRSquareMainController.h"
//#import "RegisterVC.h"
//#import "RRNewLoginViewController.h"
//#import "RRReportViewController.h"
//#import "RRUpUserFollowViewController.h"
//#import "RRMyFocusViewController.h"
//#import "RRMyDownloadMainNewController.h"
//#import "RRActivityCenterViewController.h"
//#import "RRMyBackpackViewController.h"
//#import "RRContactUsVC.h"
//#import "RRSettingViewController.h"
//#import "MyClassifyVC.h"
//#import "RRMyMessageReplyListVC.h"
//#import "RRMyMessageLikeListVC.h"
//#import "RRMyMessageFansListVC.h"
//#import "RRMyMessageChosenListVC.h"
//#import "RRMyMessageSystemListVC.h"
//#import "RRVideoRankListViewController.h"
//#import "RRUserInformationViewController.h"
//#import "RRAllSeasonCategoryViewController.h"
//#import "DateVC.h"
//#import "RRFilmNewsListViewController.h"
//#import "RRTaskCenterViewController.h"
//#import "AboutViewController.h"
//#import "RRDeleteUsetListViewController.h"
//#import "RRSeasonThirdPlayViewController.h"
//#import "RRMyCollectionContentViewController.h"
//#import "RRMyCollectionVC.h"
//#import "UIViewController+RRViewController.h"
////431
//#import "RRAmwayMainController.h"
////433
//#import "RRAmwayPageDetailController.h"
//#import "RRProviderLoginManager.h"
////451
//#import "RRVipPayViewController.h"
//
//#import "RRAmwayVideoViewController.h"
//#import "RRVipRestoreViewController.h"
//
////478
//#import "RRLeBoTVSearchingController.h"
//
////4.10
//#import "RRSeasonLiveViewController.h"
////4/13
//#import "RRAmwayVideoSearchResultViewController.h"
//#import "RRAmwayVideoEverybodyWatchingViewController.h"
//#import "RRAmwayVideoActorViewController.h"
////4161
//#import "RRRetrievePwdViewController.h"
//
////5.12新排行榜
//#import "RRAllRankingVC.h"
//
//#import "RRGuessYouLikeVC.h"
//#import "RRAblumListVC.h"
//#import "RRAblumDetailVC.h"
//#import "RRDramaCommentDetailVC.h"
//
////5100
//#import "RRUserRobotNormalOrVipView.h"
//#import "RRGetPrivilegeApi.h"
//
////5.2影人
//#import "RRActorVC.h"
//#import "RRActorIntroVC.h"
//
////追剧小红点
//#import "RRUserSubscriptionRedPointDisplayManager.h"
//
//#import "RRAmwayRecommendedLookViewController.h"
//
//#import "RRAlertLoginView.h"
//
//#import "RRAlertView.h"
//
//#import "RRCommunityVC.h"
//
////5.8
////#import "RRIdolManager.h"
////创建片单
//#import "RRMyCreateSheetViewController.h"
//#import "RRCreateFilmReviewViewController.h"
//#import "RRAmwayVideoShortVideoViewController.h"
////5.13
////话题详情
//#import "RRTalkCommentDetailVC.h"
////话题评论详情
//#import "RRTalkDetailVC.h"
////话题列表页
//#import "RRCommunityTalkViewController.h"
////影视组件(推荐)二级页面
//#import "RRVideoRecommendListVC.h"

@interface RRAppLinkManager ()

//@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> *navigationMap;
//
//@property (nonatomic, copy) RRLoginStatusBlock loginStatusBlock;
//
//@property (nonatomic, weak) RRAlertLoginView *alertLoginView;
//
//@property (nonatomic, assign) BOOL isAlertLoginStyle;

@end

//typedef NS_ENUM (NSInteger, RRNavigation) {
//    RRNavigationUndefined,
//
//    RRNavigationEmptyJump,
//    //5个主tab
//    RRNavigationMainRecommend,
//    RRNavigationMainChannel,
//    RRNavigationMainDiscover,
//    RRNavigationMainSubscribe,
//    RRNavigationMainMine,
//
//    RRNavigationSearch,
//    RRNavigationSearchResult,
//    RRNavigationVideoDetail,
//    RRNavigationSeasonDetail,
//    RRNavigationUpUserDetail,
//    RRNavigationInfoDetail,
////    RRNavigationArticleDetail,
//    RRNavigationWebDetail,
//    RRNavigationBrowserDetail,
//    RRNavigationWeimao,
//
//    RRNavigationCommunity,
//    RRNavigationBindMobile,
//    RRNavigationAccount,
//    RRNavigationSignup,
//    RRNavigationSignin,
//
//    RRNavigationInWebJump,
//
//    RRNavigationGrowrecord,
//    RRNavigationAlbum,
//
//    //3.6.2
//    RRNavigationMedalList,
//    //3.6.3
//    RRNavigationZeroCommentVideoList,
//    RRNavigationInfoList,
//
//    //3.6.4
//    RRNavigationCategoryDetail,
//    RRNavigationBillboard,
//    RRNavigationSubcategory,
//
//    //3.6.6
//    RRNavigationWelfare,
//    RRNavigationRRMall,
//    //3.6.8
//    RRNavigationRRSeasonIndex,
//    RRNavigationRRHome,
//    RRNavigationRRBindWeChat,
//    RRNavigationRRTaskCenter,
//
//    //3.7.0
//    RRNavigationToplist,    //美剧/电影榜单 的 列表
//    RRNavigationTopics,     //话题中心
//    RRNavigationTopic,      //话题详情
//
//    //3.7.2
//    RRNavigationSummary,    //自定义导航
//
//    //3.8.0
//    RRNavigationChannel,//人气新剧，片单总览，合辑，专栏
//    RRNavigationAllCategory,//人气新剧，片单总览，合辑，专栏
//
//    //3.8.1
//    RRNavigationSchedule, // 排期表
//
//    //3.9.0
//    RRNavigationCircleDetail, // 圈子详情跳转
//    RRNavigationActorDetail, // 明星详情跳转
//    RRNavigationDramaCommentDetail,//影评详情跳转
//    //4.1.5
//    RRNavigationReport,//影视举报页
//    RRNavigationVideoRank,//短视频排行榜
//    RRNavigationUpFocus,//up主关注
//    RRNavigationUpFans,//up主粉丝
//    RRNavigationVideoCategory,//短视频二级页
//    RRNavigationSpecialPart,//精彩专栏
//    RRNavigationSeasonRank,//剧集排行榜
//    RRNavigationSeasonInfo,//资讯列表
//    RRNavigationPostAritcle,//发帖
//    RRNavigationSignInReward,//签到有奖
//    RRNavigationMessageManagement,//消息管理
//    RRNavigationMessageReply,//我的消息 评论/回复
//    RRNavigationMessageLike,//我的消息 赞/收藏
//    RRNavigationMessageFans,//我的消息 新增粉丝
//    RRNavigationMessageChosen,//我的消息 我的精选
//    RRNavigationMessageSystem,//我的消息 系统通知
//    RRNavigationHistory,    //历史管理
//    RRNavigationSubcribe,   //我的追剧
//    RRNavigationDownload,   //下载
//    RRNavigationMyFocus,    //我的关注
//    RRNavigationActivity,   //活动
//    RRNavigationMyPackage,  //道具包
//    RRNavigationContactUs,  //联系我们
//    RRNavigationMyLevel,    //等级
//    RRNavigationSetting,    //设置页面
//    RRNavigationUserEdit,   //个人资料编辑
//    RRNavigationAboutUs,    //关于我们
//
//    RRNavigationChengjiuCenter, //任务-成就中心
//    RRNavigationDailyTask,  //每日一题
//    RRNavigationQuestion,   //问题反馈
//    RRNavigationGiftCode,   //礼品码
//    RRNavigationInviteCode, //邀请码
//    RRNavigationSliver,     //银币，成就值
//    RRNavigationShareApp,   //分享app
//    //4.2.1
//    RRNavigationThirdWeb,   //第三方链接播放,也可以作为其他第三方网页展示
////    RRNavigationRStart,     //二级页面打开R星
//    RRNavigationCollections,//我的收藏
//
//    //433
//    RRNavigationAmway,       //安利
//    RRNavigationAmwayDetail, //安利详情
//    //451
//    RRNavigationAmwaySobot,  //智齿客服
//    RRNavigationVipPay,      //会员购买
//    RRNavigationVipPayRestore,  //会员购买恢复
//
//    //490
//    RRNavigationAmwayVideoDetail, //安利短视频
//
//    //4.10
//    RRNavigationPrivateLiveRoom,    //私密放映厅
//
//    //5.0
//    RRNavigationGuessYouLike,   //猜你喜欢
//    RRNavigationRank,//榜单
//    RRNavigationAblumList,//片单列表
//    RRNavigationAblumDetail,//片单详情
//
//    //5.8
//    RRIdolRoomDetail, //爱豆直播间
//    RRIdolWebDetail, //爱豆直播详情
//    RRCreateSheet,//创建片单
//    RRCreateFilmReview,//创建影评
//    RRTalkDetail,//话题详情（新513新加）
//    RRVideoRecommendList,//（影视组件(推荐)二级页面 516新加）
//
//};//添加协议 请在文档中做出说明 (http://wiki.rr-in.tv/pages/viewpage.action?pageId=12517578)

@implementation RRAppLinkManager




+ (instancetype)sharedManager {
    static RRAppLinkManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[RRAppLinkManager alloc] init];
//        [manager bindLoginSucess];
//        manager.barrageZanDictionary = [[NSMutableDictionary alloc]init];
//        manager.isAlertLoginStyle = YES;
    });
    return manager;
}

//- (void)bindLoginSucess {
//    @weakify(self);
//    [RACObserve([RRProviderLoginManager shareManager], loginSucess) subscribeNext:^(id  _Nullable x) {
//        @strongify(self);
//        if ([x boolValue]) {
//            if (self.loginStatusBlock) {
//                self.loginStatusBlock(YES);
//                [self releaseLoginBlock];
//                if (self.isAlertLoginStyle) {
//                    [self.alertLoginView dismiss];
//                }
//            }
//        }
//    }];
//}
//
//#pragma mark - navigation map
//
//- (NSDictionary *)navigationMap {
//    if (!_navigationMap) {
//        _navigationMap = @{
//                @"recommend":       @(RRNavigationMainRecommend),
//                @"channel":       @(RRNavigationMainChannel),
//                @"discover":       @(RRNavigationMainDiscover),
////                @"subscribe"        :       @(RRNavigationMainSubscribe),
//                @"mine":       @(RRNavigationMainMine),
//                @"search":       @(RRNavigationSearch),
//                @"searchResult": @(RRNavigationSearchResult),
//                @"video":       @(RRNavigationVideoDetail),
//                @"season":       @(RRNavigationSeasonDetail),
//                @"upuser":       @(RRNavigationUpUserDetail),
//                @"info":       @(RRNavigationInfoDetail),
////                @"article":       @(RRNavigationArticleDetail),
//                @"webview":       @(RRNavigationWebDetail),
//                @"browser":       @(RRNavigationBrowserDetail),
//                @"weimao":       @(RRNavigationWeimao),
//                @"community"        :    @(RRNavigationCommunity),
//                @"bindphone":       @(RRNavigationBindMobile),
//                @"account":       @(RRNavigationAccount),
//                @"signup":       @(RRNavigationSignup),
//                @"signin":       @(RRNavigationSignin),
//                @"webturn":       @(RRNavigationInWebJump),
//                @"growrecord":       @(RRNavigationGrowrecord),
////                @"album":       @(RRNavigationAlbum),
//                @"empty":       @(RRNavigationEmptyJump),
//                @"medalList":       @(RRNavigationMedalList),
//                @"zeroCommentVideoList":   @(RRNavigationZeroCommentVideoList),
//                @"infoList":       @(RRNavigationInfoList),
//                @"category":       @(RRNavigationCategoryDetail),
//                @"billboard":       @(RRNavigationBillboard),
////                @"subcategory"      :       @(RRNavigationSubcategory),
//                @"welfare":       @(RRNavigationWelfare),
//                @"rrmall":       @(RRNavigationRRMall),
//                @"seasonIndex":       @(RRNavigationRRSeasonIndex),
//                @"taskCenter":       @(RRNavigationRRTaskCenter),
//                @"topList":       @(RRNavigationToplist),
//                @"topics":       @(RRNavigationTopics),
//                @"topic":       @(RRNavigationTopic),
//                @"navigationSummary":       @(RRNavigationSummary),
//                @"section":       @(RRNavigationChannel),
//                @"allCategory":       @(RRNavigationAllCategory),
//                @"schedule":       @(RRNavigationSchedule),
//                @"circleDetail":       @(RRNavigationCircleDetail),
//                @"actorDetail":       @(RRNavigationActorDetail),
//                @"report":       @(RRNavigationReport),
//                @"videoRank":       @(RRNavigationVideoRank),
//                @"focus":       @(RRNavigationUpFocus),
//                @"fans":       @(RRNavigationUpFans),
//                @"videoCategory":       @(RRNavigationVideoCategory),
//                @"specialPart":       @(RRNavigationSpecialPart),
//                @"seasonRank":       @(RRNavigationSeasonRank),
//                @"seasonInfo":       @(RRNavigationSeasonInfo),
//                @"postArticle":       @(RRNavigationPostAritcle),
//                @"signInReward":       @(RRNavigationSignInReward),
//                @"myMessage":       @(RRNavigationMessageManagement),
//                @"myMessageReply":       @(RRNavigationMessageReply),
//                @"myMessageLike":       @(RRNavigationMessageLike),
//                @"myMessageFans":       @(RRNavigationMessageFans),
//                @"myMessageChosen":       @(RRNavigationMessageChosen),
//                @"myMessageSystem":       @(RRNavigationMessageSystem),
//                @"history":       @(RRNavigationHistory),
//                @"subcribe":       @(RRNavigationSubcribe),
//                @"download":       @(RRNavigationDownload),
//                @"myfocus":       @(RRNavigationMyFocus),
//                @"myActivity":       @(RRNavigationActivity),
//                @"myPackage":       @(RRNavigationMyPackage),
//                @"contactUs":       @(RRNavigationContactUs),
//                @"myLevel":       @(RRNavigationMyLevel),
//                @"setting":       @(RRNavigationSetting),
//                @"userEdit":       @(RRNavigationUserEdit),
//                @"aboutUs":       @(RRNavigationAboutUs),
//                @"chengjiu":       @(RRNavigationChengjiuCenter),
//                @"dailyTask":       @(RRNavigationDailyTask),
//                @"question":       @(RRNavigationQuestion),
//                @"giftcode":       @(RRNavigationGiftCode),
//                @"invitecode":       @(RRNavigationInviteCode),
//                @"sliver":       @(RRNavigationSliver),
//                @"shareApp":       @(RRNavigationShareApp),
//                @"thirdWeb":       @(RRNavigationThirdWeb),
////                @"rstar":       @(RRNavigationRStart),
//                @"collections":       @(RRNavigationCollections),
//                @"amway":       @(RRNavigationAmway),
//                @"amwayDetail":       @(RRNavigationAmwayDetail),
//                @"sobot":       @(RRNavigationAmwaySobot),
//                @"vippay":       @(RRNavigationVipPay),
//                @"vipPayRestore":       @(RRNavigationVipPayRestore),
//                @"amwayVideoDetail":       @(RRNavigationAmwayVideoDetail),
//                @"privateLiveRoom":       @(RRNavigationPrivateLiveRoom),
//                @"guessYouLike":       @(RRNavigationGuessYouLike),
//                @"rank":@(RRNavigationRank),
//                @"ablumList":@(RRNavigationAblumList),
//                @"ablumDetail":@(RRNavigationAblumDetail),
//                @"idolRoom":@(RRIdolRoomDetail),
//                @"idolWeb":@(RRIdolWebDetail),
//                @"dramaCommentDetail": @(RRNavigationDramaCommentDetail),
//                @"createSheet": @(RRCreateSheet),
//                @"createFilmReview" : @(RRCreateFilmReview),
//                @"talkDetail" : @(RRTalkDetail),
//                @"videoRecommendList" : @(RRVideoRecommendList),
//        };
//    }
//    return _navigationMap;
//}
//
//- (BOOL)parseLinkUrl:(NSString *)linkUrl toRoot:(BOOL)toRoot isInWebView:(BOOL)isInWebView redirectInfo:(NSDictionary **)redirctInfo {
//    
//    
//    return [self parseLinkUrl:linkUrl toRoot:toRoot isInWebView:isInWebView redirectInfo:redirctInfo clickId:RRStatisticsIdNone clickItem:nil clickParamDict:nil];
//}
//
//- (BOOL)parseLinkUrl:(NSString *)linkUrl toRoot:(BOOL)toRoot isInWebView:(BOOL)isInWebView redirectInfo:(NSDictionary **)redirctInfo clickId:(RRStatisticsId)clickId clickItem:(NSString *)clickItem clickParamDict:(NSMutableDictionary *)clickParams {
//    return [self parseLinkUrl:linkUrl toRoot:toRoot isInWebView:isInWebView redirectInfo:redirctInfo clickId:clickId clickItem:clickItem clickParamDict:clickParams deeplinkFailUrl:nil];
//}
//
//- (BOOL)parseLinkUrl:(NSString *)linkUrl toRoot:(BOOL)toRoot isInWebView:(BOOL)isInWebView redirectInfo:(NSDictionary **)redirctInfo clickId:(RRStatisticsId)clickId clickItem:(NSString *)clickItem clickParamDict:(NSMutableDictionary *)clickParams deeplinkFailUrl:(NSString *)deeplinkFailUrl {
//    if (clickId != RRStatisticsIdNone && !clickParams) {
//        clickParams = [NSMutableDictionary dictionary];
//    }
//    BOOL parseLinkResult = [self goLink:linkUrl toRoot:toRoot isInWebView:isInWebView redirectInfo:redirctInfo clickParamDict:clickParams deeplinkFailUrl:deeplinkFailUrl];
//    if (clickId != RRStatisticsIdNone) {
//        [[RRLogSDK sharedRRLogSDK] logWithId:clickId itemId:clickItem externDict:clickParams];
//    }
//    return parseLinkResult;
//}
//
//- (BOOL)parseLinkUrl:(NSString *)linkUrl {
//    return [self parseLinkUrl:linkUrl toRoot:NO isInWebView:NO redirectInfo:nil clickId:0 clickItem:nil clickParamDict:nil deeplinkFailUrl:nil];
//}
//
//- (void)goDeeplink:(NSURL *)deepLink completionHandler:(void (^__nullable)(BOOL success))completion {
//    if (!deepLink) {
//        completion(NO);
//        return;
//    }
//    if ([deepLink.scheme isEqualToString:kAppURLSchemes] || [deepLink.scheme isEqualToString:kAppZYBURLSchemes]) {
//        //自家链接直接打开
//        BOOL result = [self goLink:deepLink.absoluteString toRoot:NO isInWebView:NO redirectInfo:NULL clickParamDict:nil];
//        if (completion) {
//            completion(result);
//        }
//        return;
//    }
//    [self p_applicationOpenURL:deepLink completionHandler:completion];
//}
//
//- (void)p_applicationOpenURL:(NSURL *)deepLink completionHandler:(void (^__nullable)(BOOL success))completion {
//    if (@available(iOS 10.0, *)) {
//        NSDictionary *options = @{
//                UIApplicationOpenURLOptionsSourceApplicationKey: @"com.rrkj.rrkanju.jsb"
//        };
//        [[UIApplication sharedApplication] openURL:deepLink options:options completionHandler:completion];
//    } else {
//        BOOL result = [[UIApplication sharedApplication] openURL:deepLink];
//        if (completion) {
//            completion(result);
//        }
//    }
//}
//
//- (BOOL)goLink:(NSString *)linkUrl toRoot:(BOOL)toRoot isInWebView:(BOOL)isInWebView redirectInfo:(NSDictionary **)redirctInfo clickParamDict:(NSMutableDictionary *)clickParams {
//    return [self goLink:linkUrl toRoot:toRoot isInWebView:isInWebView redirectInfo:redirctInfo clickParamDict:clickParams deeplinkFailUrl:nil];
//}
//
//- (void)chengjiuCenterLoginFinishAction {
//    if (![UserInfoConfig sharedUserInfoConfig].isMoviesOpen) {
//        [[RRAppLinkManager sharedManager] goDailyQuestionFromId:0 toRoot:NO];
//    } else {
//        [self goAchievementToRoot:NO];
//    }
//}
//
//- (BOOL)goLink:(NSString *)linkUrl toRoot:(BOOL)toRoot isInWebView:(BOOL)isInWebView redirectInfo:(NSDictionary **)redirctInfo clickParamDict:(NSMutableDictionary *)clickParams deeplinkFailUrl:(NSString *)deeplinkFailUrl {
//    DLog(@"ParseLink: %@", linkUrl);
//    NSURL *url = URL(linkUrl);
//    NSString *scheme = url.scheme;
//    NSString *host = url.host;
//    if ([scheme isEqualToString:kAppURLSchemes] || [scheme isEqualToString:kAppZYBURLSchemes]) {
//        NSDictionary *paramDict = [self parameterDictFromUrl:url.absoluteString];
//        NSInteger naviType = [self.navigationMap integerValueForKey:host default:RRNavigationUndefined];
//        NSString *rrStatistics = [paramDict stringValueForKey:@"rrStatistics" default:nil];
//        clickParams[kRRStatisticsExternResultType] = host;
//        [self makelogWithParam:rrStatistics];
//        NSString *openSourceStr = [paramDict stringValueForKey:@"openSource" default:nil];
//        if (openSourceStr) {
//            [RRUMengLogger sharedLogger].openSource = openSourceStr;
//        }
//        switch (naviType) {
//            case RRNavigationMainRecommend: {
//                [self goMainTab:0];
//                return YES;
//            }
//            case RRNavigationMainChannel: {
//                [self goMainTab:1];
//                return YES;
//            }
//            case RRNavigationMainDiscover: {
//                [self goMainTab:2];
//                return YES;
//            }
//            case RRNavigationCommunity: {
//                [self goCommunityTab];
//                return YES;
//            }
//            case RRNavigationMainMine: {
//                [self goMainTab:3];
//                return YES;
//            }
//            case RRNavigationSearch: {
//                [self goSeachToRoot:toRoot searchPortalType:RRSearchPortalTypeH5];
//                return YES;
//            }
//            case RRNavigationSearchResult: {
//  
//                NSString *searchWord = [paramDict stringValueForKey:@"searchword" default:nil];
//                [self goSearchResult:searchWord toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationVideoDetail: {
//                NSString *videoId = [paramDict stringValueForKey:@"videoId" default:nil];
//                NSString *title = [paramDict stringValueForKey:@"title" default:nil];
//                NSString *albumId = [paramDict stringValueForKey:@"albumId" default:nil];
//                [clickParams setObject:videoId ? : @"" forKey:kRRStatisticsExternResultId];
//                [[RRUMengLogger sharedLogger] updateContentType:kRRUmengEventVideoTypeValueShortVideo contentId:videoId withInAppJumpLink:linkUrl];
//                if (videoId.length) {
//                    [self goVideoDetail:videoId title:title albumId:albumId cover:nil toRoot:toRoot];
//                }
//                return YES;
//            }
//            case RRNavigationSeasonDetail: {
//                NSString *seasonId = [paramDict stringValueForKey:@"seasonId" default:nil];
//                [clickParams setObject:seasonId ? : @"" forKey:kRRStatisticsExternResultId];
//                BOOL isMovie = [paramDict boolValueForKey:@"isMovie" default:NO];
//                [[RRUMengLogger sharedLogger] updateContentType:kRRUmengEventVideoTypeValueLongVideo contentId:seasonId withInAppJumpLink:linkUrl];
//                if (seasonId.length) {
//                    [self goSeasonDetail:seasonId title:nil isMovie:isMovie toRoot:toRoot];
//                }
//                return YES;
//            }
//            case RRNavigationUpUserDetail: {
//                NSString *userId = [paramDict stringValueForKey:@"userId" default:nil];
//                [clickParams setObject:userId ? : @"" forKey:kRRStatisticsExternResultId];
//                if (userId.length) {
//                    [self goUpuserDetail:userId toRoot:toRoot];
//                }
//                return YES;
//            }
//            case RRNavigationAmway: {
//                [self goAmwayToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationAmwayDetail: {
//                NSString *amwayId = [paramDict stringValueForKey:@"amwayId" default:nil];
//                [clickParams setObject:amwayId ? : @"" forKey:kRRStatisticsExternResultId];
//                if (amwayId.length) {
//                    [self goAmwayDetail:amwayId toRoot:toRoot];
//                }
//                return YES;
//            }
//            case RRNavigationAmwayVideoDetail: {
//                NSString *videoId = [paramDict stringValueForKey:@"videoId" default:nil];
//                if (videoId.length) {
//                    [self goAmwayVideo:videoId cover:nil toRoot:toRoot];
//                }
//                return YES;
//            }
//            case RRNavigationPrivateLiveRoom: {
//                NSString *liveRoomId = [paramDict stringValueForKey:@"roomId" default:nil];
//                [self goSeasonLiveRoom:liveRoomId roomModel:nil toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationGuessYouLike: {
//                [self goGuessYouLikeVCToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationRank: {
//                NSString *sectionId = [paramDict stringValueForKey:@"sectionId" default:nil];
//                NSString *seriesId = [paramDict stringValueForKey:@"seriesId" default:nil];
//                [self goRankList:sectionId seriesId:seriesId toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationInfoDetail: {
//                NSString *infoId = [paramDict stringValueForKey:@"infoId" default:nil];
//                [clickParams setObject:infoId ? : @"" forKey:kRRStatisticsExternResultId];
//                if (infoId.length) {
//                    [self goInfoDetail:infoId toRoot:toRoot];
//                }
//                return YES;
//            }
////            case RRNavigationArticleDetail: {
////                NSString *articleId = [paramDict stringValueForKey:@"articleId" default:nil];
////                [clickParams setObject:articleId ? : @"" forKey:kRRStatisticsExternResultId];
////                if (articleId.length) {
////                    [self goArticleDetail:articleId toRoot:toRoot];
////                }
////                return YES;
////            }
//            case RRNavigationWebDetail: {
//                NSString *urlString = [paramDict stringValueForKey:@"url" default:nil];
//                NSString *title = [paramDict stringValueForKey:@"title" default:nil];
//                BOOL isImmersive = [paramDict boolValueForKey:@"isImmersive" default:NO];
//                BOOL isBack = [paramDict boolValueForKey:@"isBack" default:NO];
//                BOOL isH5webview = [paramDict boolValueForKey:@"isH5" default:NO];
//                if (urlString.length) {
//                    [self goWebDetail:urlString title:title isImmersive:isImmersive isH5:isH5webview showBackInmmersive:isBack toRoot:toRoot];
//                }
//                return YES;
//            }
//            case RRNavigationBrowserDetail: {
//                NSString *urlString = [paramDict stringValueForKey:@"url" default:nil];
//                if (urlString.length) {
//                    [self goBrowserDetail:urlString deeplinkFailUrl:deeplinkFailUrl toRoot:toRoot];
//                }
//                return YES;
//            }
//            case RRNavigationWeimao: {
//                return YES;
//            }
//            case RRNavigationBindMobile: {
//                [self goBindMobileToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationAccount: {
//                [self goAccountToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationSignin: {
//                [self goSigninToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationSignup: {
//                [self goSignupToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationInWebJump: {
//                NSString *redirctLinkParam = [paramDict stringValueForKey:@"url" default:nil];
//                NSString *title = [paramDict stringValueForKey:@"title" default:nil];
//                NSURL *redirctLink = URL(redirctLinkParam);
//                if (redirctLink) {
//                    if (isInWebView) {
//                        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//                        dict[@"link"] = redirctLink;
//                        dict[@"title"] = title;
//                        *redirctInfo = dict;
//                        return NO;
//                    } else {
//                        [clickParams setObject:@"webview" forKey:kRRStatisticsExternResultType];
//                        [self goWebDetail:redirctLinkParam title:title isImmersive:NO isH5:NO showBackInmmersive:YES toRoot:toRoot];
//                    }
//                }
//                return YES;
//            }
//            case RRNavigationGrowrecord: {
//                [self goGrowrecordToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationAlbum: {
////                NSString *albumId = [paramDict stringValueForKey:@"albumId" default:nil];
////                NSInteger albumType = [paramDict intValueForKey:@"albumType" default:0];
////                [clickParams setObject:albumId ? : @"" forKey:kRRStatisticsExternResultId];
////                if (albumType == RRAlbumTypeUser) {
////                    [clickParams setObject:@"subject" forKey:kRRStatisticsExternResultType];
////                }
////                if (albumId) {
////                    if (albumType == RRAlbumTypeOffical) {
////                        [self goRRAlbum:albumId toRoot:toRoot];
////                    } else {
////                        [self goAlbum:albumId albumType:albumType toRoot:toRoot];
////                    }
////                }
//                return YES;
//            }
//            case RRNavigationAblumDetail: {
//                NSString *albumId = [paramDict stringValueForKey:@"seriesId" default:nil];
//                [[RRUMengLogger sharedLogger] updateContentType:kRRUmengEventContnetTypeFilmList contentId:albumId withInAppJumpLink:linkUrl];
//                [self goAblumDetail:albumId toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationAblumList: {
//                NSString *sectionId = [paramDict stringValueForKey:@"sectionId" default:nil];
//                NSString *name = [paramDict stringValueForKey:@"name" default:nil];
//                [self goAblumList:sectionId title:name toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationEmptyJump: {
//                return YES;
//            }
//            case RRNavigationMedalList: {
//                [self goMedalListToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationZeroCommentVideoList: {
//                [self goZeroCommentVideoListToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationWelfare: {
//                [self goWelfareToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationRRMall: {
//                [self goRrMallToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationInfoList: {
//                [self goInfoListToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationCategoryDetail: {
//                NSString *categoryId = [paramDict stringValueForKey:@"categoryId" default:nil];
//                NSString *title = [paramDict stringValueForKey:@"title" default:nil];
//                [clickParams setObject:categoryId ? : @"" forKey:kRRStatisticsExternResultId];
//                if (categoryId.length) {
//                    [self goCategoryDetailWithCategoryId:categoryId title:title toRoot:toRoot];
//                }
//                return YES;
//            }
//            case RRNavigationBillboard: {
//                [self goBillboardToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationRRSeasonIndex: {
//                NSString *type = [[paramDict stringValueForKey:@"type" default:nil] uppercaseString];
//                if (type.length) {
//                    [self goSeasonCategory:type toRoot:toRoot];
//                }
//                return YES;
//            }
//            case RRNavigationRRTaskCenter: {
//                [self goTaskCenterToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationToplist: {
//                NSString *toplistType = [paramDict stringValueForKey:@"albumType" default:nil];
//                [self goTopListWithType:toplistType toRoot:toRoot];
//                return YES;
//            }
//
//            case RRNavigationSummary: {
//                long long navigationId = [paramDict longValueForKey:@"navigationId" default:0];
//                [self goNavigationSummaryWithNavigationId:navigationId toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationChannel: {
//                NSString *type = [paramDict stringValueForKey:@"type" default:nil];
//                NSString *sectionId = [paramDict stringValueForKey:@"sectionId" default:nil];
//                NSString *title = [paramDict stringValueForKey:@"name" default:nil];
//                [self goChannelWithType:type withId:sectionId withTitle:title];
//                return YES;
//            }
//            case RRNavigationAllCategory: {
//                [self goAllCategorySeasonVCWithParam:paramDict];
//                return YES;
//            }
//            case RRNavigationSchedule: {
//                [self goDateVC];
//                return YES;
//            }
////            case RRNavigationCircleDetail: {
////                NSString *circleId = [paramDict stringValueForKey:@"circleId" default:nil];
////                [self goCircleDetailWithCircleId:circleId toRoot:toRoot];
////                return YES;
////            }
//            case RRNavigationActorDetail: {
//                NSString *actorId = [paramDict stringValueForKey:@"actorId" default:nil];
//                NSString *actorName = [paramDict stringValueForKey:@"actorName" default:@""];
//                [self goActorWithActorId:actorId actorName:actorName mainActor:YES toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationReport: {
//                RRReportViewController *vc = [[RRReportViewController alloc] init];
//                [self goNextViewController:vc toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationVideoRank: {
//                RRVideoRankListViewController *vc = [[RRVideoRankListViewController alloc] init];
//                [self goNextViewController:vc toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationUpFocus: {
//                RRUpUserFollowViewController *vc = [[RRUpUserFollowViewController alloc] init];
//                vc.type = UpUserTypeFollow;
//                vc.userId = [paramDict stringValueForKey:@"id" default:nil];
//                [self goNextViewController:vc toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationUpFans: {
//                RRUpUserFollowViewController *vc = [[RRUpUserFollowViewController alloc] init];
//                vc.type = UpUserTypeFans;
//                vc.userId = [paramDict stringValueForKey:@"id" default:nil];
//                [self goNextViewController:vc toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationVideoCategory: {
//                return YES;
//            }
//            case RRNavigationSpecialPart: {
//                RRSpecialColumnViewController *vc = [[RRSpecialColumnViewController alloc] init];
//                vc.sectionId = [paramDict stringValueForKey:@"id" default:nil];
//                vc.navTitle = [paramDict stringValueForKey:@"title" default:nil];
//                [self goNextViewController:vc toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationSeasonRank: {
//                [self goAllRankingToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationSeasonInfo: {
//                RRFilmNewsListViewController *vc = [[RRFilmNewsListViewController alloc] init];
//                [self goNextViewController:vc toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationPostAritcle: {
//                return YES;
//            }
//            case RRNavigationSignInReward: {
//                [self goCheckinPageToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationMessageManagement: {
//                
//                [self goMyMessageToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationMessageReply: {
//       
//                [self goMyMessageReplyToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationMessageLike: {
//       
//                [self goMyMessageLikeToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationMessageFans: {
//                
//                [self goMyMessageFansToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationMessageChosen: {
//                
//                [self goMyMessageChosenToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationMessageSystem: {
//                
//                [self goMyMessageSystemToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationHistory: {
//                RRHistoryViewController *vc = [[RRHistoryViewController alloc] init];
//                [self goNextViewController:vc toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationSubcribe: {
//                [self goToMyPursuedPage];
//                return YES;
//            }
//            case RRNavigationDownload: {
//                RRMyDownloadMainNewController *vc = [[RRMyDownloadMainNewController alloc] init];
//                [self goNextViewController:vc toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationMyFocus: {
//                [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//                    if (sucess) {
//                        RRMyFocusViewController *vc = [[RRMyFocusViewController alloc] init];
//                        [self goNextViewController:vc toRoot:toRoot];
//                    }
//                }];
//                return YES;
//            }
//            case RRNavigationActivity: {
//                RRActivityCenterViewController *vc = [[RRActivityCenterViewController alloc] init];
//                [self goNextViewController:vc toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationMyPackage: {
//                [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//                    if (sucess) {
//                        RRMyBackpackViewController *vc = [[RRMyBackpackViewController alloc] init];
//                        [self goNextViewController:vc toRoot:toRoot];
//                    }
//                }];
//                return YES;
//            }
//            case RRNavigationContactUs: {
//                RRContactUsVC *vc = [[RRContactUsVC alloc] init];
//                [self goNextViewController:vc toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationMyLevel: {
//                [self goMyLevel];
//                return YES;
//            }
//            case RRNavigationSetting: {
//                RRSettingViewController *vc = [[RRSettingViewController alloc] init];
//                [self goNextViewController:vc toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationUserEdit: {
//                RRUserInformationViewController *vc = [[RRUserInformationViewController alloc] init];
//                [self goNextViewController:vc toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationAboutUs: {
//                AboutViewController *vc = [[AboutViewController alloc] init];
//                [self goNextViewController:vc toRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationChengjiuCenter: {
//                @weakify(self);
//                [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//                    @strongify(self);
//                    if (sucess) {
//                        [self chengjiuCenterLoginFinishAction];
//                    }
//                }];
//
//                return YES;
//            }
//            case RRNavigationDailyTask: {
//                [[RRAppLinkManager sharedManager] goDailyQuestionFromId:60000 toRoot:NO];
//                return YES;
//            }
//            case RRNavigationQuestion: {
//                Activity_ViewController *next = [[Activity_ViewController alloc] init];
//                if (![UserInfoConfig sharedUserInfoConfig].isMoviesOpen) {
//                    next.targetUrl = [NSString stringWithFormat:@"%@/%@", KShareUrl, @"h5/appWeb/#/bugListFeedback"];
//                } else {
//                    //热门问题
//                    next.targetUrl = [NSString stringWithFormat:@"%@/%@", KShareUrl, @"h5/appWeb/#/bugList"];
//                }
//                next.titleStr = @"帮助反馈";
//                [[RRAppLinkManager sharedManager] pushViewController:next animated:YES];
//                return YES;
//            }
//            case RRNavigationGiftCode: {
//                return [[RRAppLinkManager sharedManager] parseLinkUrl:[NSString stringWithFormat:@"rrspjump://webview?url=%@/h5/activity/#/h5/golfcode", KShareUrl] toRoot:NO isInWebView:NO redirectInfo:NULL];
//            }
//            case RRNavigationInviteCode: {
//                Activity_ViewController *next = [[Activity_ViewController alloc] init];
//                next.targetUrl = [NSString stringWithFormat:@"%@/%@", KShareUrl, @"h5/appWeb/#/writeInvitation"];
//                //            next.titleStr = @"";
//                [[RRAppLinkManager sharedManager] pushViewController:next animated:YES];
//                return YES;
//            }
//            case RRNavigationSliver: {
//                [[RRAppLinkManager sharedManager] goMyCurrencyAccountDetailToRoot:NO];
//                return YES;
//            }
//            case RRNavigationShareApp: {
//                Activity_ViewController *next = [[Activity_ViewController alloc] init];
//                next.targetUrl = [RRAppConfig config].p_invitedPageUrl;
//                [[RRAppLinkManager sharedManager] pushViewController:next animated:YES];
//                return YES;
//            }
//            case RRNavigationThirdWeb: {
//                NSString *url = [paramDict stringValueForKey:@"url" default:nil];
//                NSString *seasonID = [paramDict stringValueForKey:@"seasonId" default:nil];
//                NSString *site = [paramDict stringValueForKey:@"site" default:nil];
//                [self goThirdWebViewControllerWithURL:url seasonID:seasonID site:site];
//                return YES;
//            }
//            case RRNavigationCollections: {
//                [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//                    if (sucess) {
//                        [self goToMyCollectionContentPageToRoot:toRoot];
//                    }
//                }];
//                return YES;
//            }
//            case RRNavigationAmwaySobot: {
//                [self goSobotToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationVipPay: {
//                [self goVipPayToRoot:toRoot];
//                return YES;
//            }
//            case RRNavigationVipPayRestore:
//                [self goVipPayRestore:toRoot];
//                return YES;
//
////            case RRIdolRoomDetail: {
////                NSString *roomId = [paramDict stringValueForKey:@"roomId" default:nil];
////                if (roomId.length > 0) {
////                    [[RRIdolManager shareIdolManager] goLiveRoomWithRoomId:roomId];
////                }
////                return YES;
////            }
////            case RRIdolWebDetail: {
////                NSString *url = [paramDict stringValueForKey:@"url" default:nil];
////                if (url.length > 0) {
////                    [[RRIdolManager shareIdolManager] goLiveRoomWebViewWithUrl:url];
////                }
////                return YES;
////            }
//            case RRNavigationDramaCommentDetail: {
//                NSString *dramaCommentId = [paramDict stringValueForKey:@"dramaCommentId" default:nil];
//                [[RRUMengLogger sharedLogger] updateContentType:kRRUmengEventContnetTypeDramaComment contentId:dramaCommentId withInAppJumpLink:linkUrl];
//                [self goDramaCommentDetail:dramaCommentId toRoot:NO];
//                return YES;
//            }
//            case RRCreateSheet: {
//                NSString *sheetId = [paramDict stringValueForKey:@"sheetId" default:nil];
//                if (sheetId.length) {
//                    [self goCreateSheetWithId:sheetId model:nil toRoot:NO withBlock:nil];
//                } else {
//                    [self goCreateSheet:NO];
//                }
//                return YES;
//            }
//            case RRCreateFilmReview: {
//                NSString *seasonId = [paramDict stringValueForKey:@"seasonId" default:nil];
//                if (seasonId.length) {
//                    [self goFilmReviewWithSeasonId:seasonId model:nil delegate:nil toRoot:NO];
//                }
//                return YES;
//            }
//            case RRTalkDetail: {
//                NSString *talkId = [paramDict stringValueForKey:@"talkId" default:nil];
//                if (talkId.length) {
//                    [self goTalkDetail:talkId toRoot:NO];
//                }
//                return YES;
//            }
//            case RRVideoRecommendList: {
//                NSString *title = [paramDict stringValueForKey:@"title" default:nil];
//                NSString *sectionId = [paramDict stringValueForKey:@"sectionId" default:nil];
//                if (sectionId.length) {
//                    [self goVideoRecommendListWithSectionId:sectionId title:title toRoot:NO];
//                }
//                return YES;
//            }
//            default: {
//                NSString *redirectUrl = [paramDict stringValueForKey:@"redirectUrl" default:nil];
//                if ([redirectUrl hasPrefix:@"http"]) {
//                    [clickParams setObject:@"webview" forKey:kRRStatisticsExternResultType];
//                    [self goWebDetail:redirectUrl title:nil isImmersive:NO isH5:NO showBackInmmersive:YES toRoot:toRoot];
//                    return YES;
//                }
//                [clickParams setObject:@"" forKey:kRRStatisticsExternResultType];
//            }
//                return NO;
//        }
//    } else if (!isInWebView) {
//        if ([scheme isEqualToString:@"https"] || [scheme isEqualToString:@"http"]) {
//            [self goWebDetail:url.absoluteString title:nil isImmersive:NO isH5:NO showBackInmmersive:YES toRoot:toRoot];
//            [clickParams setObject:@"webview" forKey:kRRStatisticsExternResultType];
//        } else {
//            // webView中 没有deeplinkFailUrl，而且webview会自己处理deeplink
//            //deeplink 跳转
//            [self goBrowserDetail:linkUrl deeplinkFailUrl:deeplinkFailUrl toRoot:toRoot];
//            [clickParams setObject:@"deeplink" forKey:kRRStatisticsExternResultType];
//        }
//        return YES;
//    }
//    return NO;
//}
//
//#pragma mark - log
//
//- (void)makelogWithParam:(NSString *)param {
//    if (param.length == 0) {
//        return;
//    }
//    NSDictionary *paramDict = [self dictObjectWithJSONString:param];
//    RRStatisticsId statisticsId = (RRStatisticsId)[paramDict longValueForKey:@"id" default:0];
//    NSString *itemId = [paramDict stringValueForKey:@"item" default:nil];
//    NSDictionary *externDict = paramDict[@"extern"];
//    if (![externDict isKindOfClass:[NSDictionary class]]) {
//        externDict = nil;
//    }
//    if (statisticsId > 0) {
//        [[RRLogSDK sharedRRLogSDK] logWithId:statisticsId itemId:itemId externDict:externDict];
//    }
//}
//
//#pragma mark - navi jump
//- (void)goMyMessageToRoot:(BOOL)toRoot {
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        if (sucess) {
//            MyClassifyVC *vc = [[MyClassifyVC alloc] init];
//            [self goNextViewController:vc toRoot:toRoot];
//        }
//    }];
//}
// 
//- (void)goMyMessageReplyToRoot:(BOOL)toRoot {
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        if (sucess) {
//            RRMyMessageReplyListVC *vc = [[RRMyMessageReplyListVC alloc] init];
//            vc.messageType = RRMyMessageTypeReply;
//            vc.title = @"评论/回复";
//            [self goNextViewController:vc toRoot:toRoot];
//        }
//    }];
//}
//
//- (void)goMyMessageLikeToRoot:(BOOL)toRoot {
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        if (sucess) {
//            RRMyMessageLikeListVC *vc = [[RRMyMessageLikeListVC alloc] init];
//            vc.messageType = RRMyMessageTypeLike;
//            vc.title = @"赞/收藏";
//            [self goNextViewController:vc toRoot:toRoot];
//        }
//    }];
//}
//
//- (void)goMyMessageFansToRoot:(BOOL)toRoot {
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        if (sucess) {
//            RRMyMessageFansListVC *vc = [[RRMyMessageFansListVC alloc] init];
//            vc.messageType = RRMyMessageTypeFans;
//            vc.title = @"新增粉丝";
//            [self goNextViewController:vc toRoot:toRoot];
//        }
//    }];
//}
//
//- (void)goMyMessageChosenToRoot:(BOOL)toRoot {
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        if (sucess) {
//            RRMyMessageChosenListVC *vc = [[RRMyMessageChosenListVC alloc] init];
//            vc.messageType = RRMyMessageTypeChosen;
//            vc.title = @"我的精选";
//            [self goNextViewController:vc toRoot:toRoot];
//        }
//    }];
//}
//
//- (void)goMyMessageSystemToRoot:(BOOL)toRoot {
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        if (sucess) {
//            RRMyMessageSystemListVC *vc = [[RRMyMessageSystemListVC alloc] init];
//            vc.messageType = RRMyMessageTypeSystem;
//            vc.title = @"系统通知";
//            [self goNextViewController:vc toRoot:toRoot];
//        }
//    }];
//}
//
//- (void)goMainTab:(NSInteger)index {
//    AppDelegate2 *appDelegate = (AppDelegate2 *)[UIApplication sharedApplication].delegate;
//    BaseNavigationController *currentNavigation = (BaseNavigationController *)appDelegate.window.rootViewController;
//    if (![currentNavigation isKindOfClass:[BaseNavigationController class]]) {
//        return;
//    }
//    TabBarViewController *tabBarVC = (TabBarViewController *)[currentNavigation.viewControllers objectOrNilAtIndex:0];
//    if (![tabBarVC isKindOfClass:[TabBarViewController class]]) {
//        return;
//    }
//    if (index < 0 || index >= tabBarVC.viewControllers.count) {
//        return;
//    }
//    [tabBarVC setSelectedIndex:index];
//    [currentNavigation setViewControllers:[self popedRootViewControllers] animated:YES];
//}
//
//
//- (void)goCommunityTab {
//    AppDelegate2 *appDelegate = (AppDelegate2 *)[UIApplication sharedApplication].delegate;
//    BaseNavigationController *currentNavigation = (BaseNavigationController *)appDelegate.window.rootViewController;
//    if (![currentNavigation isKindOfClass:[BaseNavigationController class]]) {
//        return;
//    }
//    TabBarViewController *tabBarVC = (TabBarViewController *)[currentNavigation.viewControllers objectOrNilAtIndex:0];
//    if (![tabBarVC isKindOfClass:[TabBarViewController class]]) {
//        return;
//    }
//   
//    [tabBarVC.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if([obj isKindOfClass:[RRCommunityVC class]]){
//            [tabBarVC setSelectedIndex:idx];
//            [currentNavigation setViewControllers:[self popedRootViewControllers] animated:YES];
//            *stop = YES;
//        }
//
//    }];
//}
//
//- (void)goSeachToRoot:(BOOL)toRoot searchPortalType:(RRSearchPortalType)searchPortalType {
//    if (toRoot) {
//        [self popToRootViewController];
//    }
//    RRSearchViewController *searchVC = [[RRSearchViewController alloc] init];
//    searchVC.searchPortalType = searchPortalType;
//    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:searchVC];
//    nav.modalPresentationStyle = UIModalPresentationFullScreen;
//    [self presentViewController:nav animated:YES completion:nil];
//}
//
//- (void)goSearchResult:(NSString *)searchWord toRoot:(BOOL)toRoot {
//    //跳转搜索结果页 NEW
//    RRSearchResultVC *vc = [[RRSearchResultVC alloc] init];
//    vc.searchWord = searchWord ?: @"";
//    NSString *searchW = [UserInfoConfig sharedUserInfoConfig].searchWord;
//    NSString *placeHolder = @"搜索影视名称";
//    vc.searchWordPlaceHolder = searchW ?: placeHolder;
//    //搜索词的来源类型
//    vc.searchWordType = RRSearchWordModelTypeTyping;//完整输入
//    //用户使用搜索引擎的入口
//    vc.searchPortalType = RRSearchPortalTypeCustomizeNativePages; //入口：自定义原生页面
//    [self goNextViewController:vc toRoot:toRoot];
//}
// 
//- (void)goAllRankingToRoot:(BOOL)toRoot {
//    //5.12新排行榜
//    RRAllRankingVC *vc = [[RRAllRankingVC alloc]init];
//    [self goNextViewController:vc toRoot:toRoot];
//}
// 
//- (void)goRankList:(NSString *)sectionId seriesId:(NSString *)seriesId toRoot:(BOOL)toRoot {
//    //5.12新排行榜
//    RRAllRankingVC *vc = [[RRAllRankingVC alloc]init];
//    vc.topId = seriesId;
//    [self goNextViewController:vc toRoot:toRoot];
//}
//
//- (void)goAmwayRecommendedListWithActorId:(NSString *)actorId dramaId:(NSString *)dramaId videoId:(NSString *)videoId communityHome:(BOOL)communityHome toRoot:(BOOL)toRoot {
//    RRAmwayRecommendedLookViewController *vc = [[RRAmwayRecommendedLookViewController alloc]init];
//    vc.actorId = actorId;
//    vc.dramaId = dramaId;
//    vc.videoId = videoId;
//    vc.communityBOOL = communityHome;
//    [self goNextViewController:vc toRoot:toRoot];
//}
//
//- (void)goVideoDetailLoginFinish:(NSString *)videoId title:(NSString *)title albumId:(NSString *)albumId cover:(NSString *)cover toRoot:(BOOL)toRoot{
//    if (videoId == nil) {
//        return;
//    }
//    RRQuicklookPushViewController *quicklookPushViewController = [RRQuicklookPushViewController new];
//    quicklookPushViewController.quickModelArray = [@[videoId] mutableCopy];
//    quicklookPushViewController.currentId = videoId;
//    [self goNextViewController:quicklookPushViewController toRoot:toRoot];
//}
//
//- (void)goAmwayShortVideo:(NSString *)videoId sectionId:(NSString *)sectionId toRoot:(BOOL)toRoot {
//    if (videoId == nil) {
//        return;
//    }
//    RRAmwayVideoShortVideoViewController *shortVideoAmwayPushViewController = [RRAmwayVideoShortVideoViewController new];
//    shortVideoAmwayPushViewController.sectionId = sectionId;
//    shortVideoAmwayPushViewController.videoId = videoId;
//    [self goNextViewController:shortVideoAmwayPushViewController toRoot:toRoot];
//}
//
//
//- (void)goVideoDetail:(NSString *)videoId title:(NSString *)title albumId:(NSString *)albumId cover:(NSString *)cover toRoot:(BOOL)toRoot {
////    @weakify(self);
////    [[RRAppLinkManager sharedManager]goLoginBlockToRoot:toRoot loginFinish:^(BOOL sucess) {
////        @strongify(self);
////        if (sucess) {
////            [self goVideoDetailLoginFinish:videoId title:title albumId:albumId cover:cover toRoot:toRoot];
////        }
////    }];
//    [self goVideoDetailLoginFinish:videoId title:title albumId:albumId cover:cover toRoot:toRoot];
//
//}
//
//- (void)goAmwayVideo:(NSString *)videoId cover:(NSString *)cover toRoot:(BOOL)toRoot {
//    if (videoId == nil) {
//        return;
//    }
////    RRAmwayVideoViewController *next = [[RRAmwayVideoViewController alloc] initWithVideoId:videoId cover:nil];
////    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goSeasonLiveRoomLoginFinish:(NSString *)roomId roomModel:(RRSeriesLiveRoomModel *)roomModel toRoot:(BOOL)toRoot {
//    if (roomId == nil) {
//        return;
//    }
//    if ([[RRAppLinkManager sharedManager].currentTopController isKindOfClass:NSClassFromString(@"RRPlayerPresentViewController")] || [[RRAppLinkManager sharedManager].currentTopController isKindOfClass:NSClassFromString(@"RRSeasonPlayViewController")]) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:KRRUserGoSeasonLiveRoom object:nil];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self goSeasonLiveRoom:roomId roomModel:roomModel toRoot:toRoot];
//        });
//        return;
//    }
//    RRSeasonLiveViewController *existedVC = [RRSeasonLiveViewController lastestLiveRoomVC];
//    RRSeasonLiveViewController *next = nil;
//    if (existedVC) {
//        UINavigationController *naviVC = existedVC.navigationController;
//        NSMutableArray *vcs = [naviVC.viewControllers mutableCopy];
//        [vcs removeObject:existedVC];
//        [naviVC setViewControllers:vcs];
//        if ([existedVC.roomId isEqualToString:roomId]) {
//            next = existedVC;
//        } else {
//            existedVC.logoutWhenExit = NO;
//        }
//    }
//    if (!next) {
//        next = [[RRSeasonLiveViewController alloc] init];
//        next.roomId = roomId;
//        if (roomModel) {
//            next.roomModel = roomModel;
//        }
//    }
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goSeasonLiveRoom:(NSString *)roomId roomModel:(RRSeriesLiveRoomModel *)roomModel toRoot:(BOOL)toRoot {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            [self goSeasonLiveRoomLoginFinish:roomId roomModel:roomModel toRoot:toRoot];
//        }
//    }];
//}
//
//- (void)goGuessYouLikeVCToRoot:(BOOL)toRoot {
//    RRGuessYouLikeVC *next = [[RRGuessYouLikeVC alloc] init];
//    [self goNextViewController:next toRoot:toRoot];
////    @weakify(self);
////    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
////        @strongify(self);
////        if (sucess) {
////            [self goSeasonLiveRoomLoginFinish:roomId roomModel:roomModel toRoot:toRoot];
////        }
////    }];
//}
//
//- (void)amwayVideoSeasonDetailWithSeasonId:(NSString *)seasonId amwayVideoTitle:(NSString *)amwayVideoTitle  amwayVideoId:(NSString *)amwayVideoId isMovie:(BOOL)isMovie toRoot:(BOOL)toRoot {
//    
//    RRSeasonViewController *next =  [[RRSeasonViewController alloc] init];
//    next.seasonId = seasonId;
//    next.isMovie = NO;
//    next.shortVideo = [NSString stringWithFormat:@"%@#@#%@",amwayVideoId,amwayVideoTitle];
////    [[RRAppLinkManager sharedManager] pushViewController:next animated:YES];
//    if (!toRoot) {
//        BaseNavigationController *naviVC = [self currentTopNavigationController];
//        if (naviVC) {
//            NSMutableArray *vcs = [naviVC.viewControllers mutableCopy];
//            [vcs enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
//                if ([obj isKindOfClass:[RRSeasonViewController class]]) {
//                    [vcs removeObject:obj];
//                }
//            }];
//            [vcs addObject:next.realController];
//            [naviVC setViewControllers:vcs animated:YES];
//            return;
//        }
//    }
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goSeasonDetailLoginFinish:(NSString *)seasonId
//                            title:(NSString *)title
//              seniorCommentsModel:(RRSeniorCommentsModel*)seniorCommentsModel
//                 isCommunityEnter:(BOOL)isCommunityEnter
//                          isMovie:(BOOL)isMovie
//                           toRoot:(BOOL)toRoot {
//    AppDelegate2 *app = (AppDelegate2 *)[UIApplication sharedApplication].delegate;
//
//    if (app.needBindWechat) {
//        RRBindWechatViewController *ctr = [[RRBindWechatViewController alloc] initWithNibName:@"RRBindWechatViewController" bundle:nil];
//        [self goNextViewController:ctr toRoot:toRoot];
//    } else if (app.needBindPhone) {
//        RRMobileBoundingViewController *ctr = [[RRMobileBoundingViewController alloc] init];
//        [self goNextViewController:ctr toRoot:toRoot];
//    } else {
//        RRSeasonViewController *next =  [[RRSeasonViewController alloc] init];
//        next.seasonId = seasonId;
//        next.isMovie = isMovie;
//        next.topSeniorCommentsModel = seniorCommentsModel;
//        next.isCommunityEnter = isCommunityEnter;
//        if (!toRoot) {
//            BaseNavigationController *naviVC = [self currentTopNavigationController];
//            if (naviVC) {
//                NSMutableArray *vcs = [naviVC.viewControllers mutableCopy];
//                [vcs enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
//                    if ([obj isKindOfClass:[RRSeasonViewController class]]) {
//                        [vcs removeObject:obj];
//                    }
//                }];
//                [vcs addObject:next.realController];
//                [naviVC setViewControllers:vcs animated:YES];
//                return;
//            }
//        }
//        [self goNextViewController:next toRoot:toRoot];
//    }
//}
//
//- (void)goSeasonDetail:(NSString *)seasonId title:(NSString *)title isMovie:(BOOL)isMovie toRoot:(BOOL)toRoot {
////    @weakify(self);
////    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
////        @strongify(self);
////        if (sucess) {
//            [self goSeasonDetailLoginFinish:seasonId
//                                      title:title
//                        seniorCommentsModel:nil
//                           isCommunityEnter:NO
//                                    isMovie:isMovie
//                                     toRoot:toRoot];
////        }
////    }];
//}
//
//- (void)goSeasonDetail:(NSString *)seasonId title:(NSString *)title seniorCommentsModel: (RRSeniorCommentsModel*)seniorCommentsModel isCommunityEnter:(BOOL)isCommunityEnter isMovie:(BOOL)isMovie toRoot:(BOOL)toRoot {
// 
//    [self goSeasonDetailLoginFinish:seasonId
//                              title:title
//                seniorCommentsModel:seniorCommentsModel
//                   isCommunityEnter:isCommunityEnter
//                            isMovie:isMovie
//                             toRoot:toRoot];
//    
//}
//
//- (void)goUpuserDetail:(NSString *)userId
//               videoId:(NSString *)videoId
//               tabType:(enum MyProfileTabType)tabType
//                toRoot:(BOOL)toRoot {
//    UIViewController *topVC = [UIViewController topViewController];
//    if (videoId && [topVC isMemberOfClass:NSClassFromString(@"RRAmwayVideoUperQuickLookViewController")]) {
//        [self popViewControllerAnimated:YES];
//    } else {
//        RRUperVC *next = [[RRUperVC alloc] init];
//        next.tabType = tabType;
//        next.userId = userId;
//        next.videoId = videoId;
//        NSString *currentPageName = [RRUMengLogger currentTopViewControllerPageName];
//        next.fromPageName = currentPageName;
//        [self goNextViewController:next toRoot:toRoot];
//    }
//}
//
//- (void)goUpuserDetail:(NSString *)userId
//               videoId:(NSString *)videoId
//                toRoot:(BOOL)toRoot {
//    [self goUpuserDetail:userId
//                 videoId:videoId
//                 tabType:MyProfileTabTypeDynamic
//                  toRoot:toRoot];
//}
//
//- (void)goUpuserDetail:(NSString *)userId toRoot:(BOOL)toRoot {
//    [self goUpuserDetail:userId videoId:nil toRoot:NO];
//}
//
//- (void)goAmwayDetail:(NSString *)amwayId toRoot:(BOOL)toRoot {
//    RRAmwayPageDetailController *next = [[RRAmwayPageDetailController alloc] init];
//    next.amwayId = amwayId;
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goInfoDetail:(NSString *)infoId toRoot:(BOOL)toRoot {
//    NewsIntroModel *newsModel = [[NewsIntroModel alloc]init];
//    newsModel.ID = infoId;
//    NewTextDetailVC *next = [[NewTextDetailVC alloc] init];
//    next.infoModel = newsModel;
//    next.type = InfoTypeNew;//咨询类型
//    [self goNextViewController:next toRoot:toRoot];
//}
//
////- (void)goArticleDetail:(NSString *)articleId toRoot:(BOOL)toRoot {
////    RRArticleOrStarDynamicDetailVC *next = [[RRArticleOrStarDynamicDetailVC alloc] init];
////    next.articleId = articleId;
////    [self goNextViewController:next toRoot:toRoot];
////}
//
//- (void)goWebDetail:(NSString *)linkUrl title:(NSString *)title isImmersive:(BOOL)isImmersive isH5:(BOOL)isH5 showBackInmmersive:(BOOL)showBackInImmersive toRoot:(BOOL)toRoot {
//    Activity_ViewController *next = [[Activity_ViewController alloc] init];
//    next.targetUrl = linkUrl;
//    next.titleStr = title;
//    next.isImmersive = isImmersive;
//    next.isH5Web = isH5;
//    next.isShowBackInImmersivePage = showBackInImmersive;
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goBrowserDetail:(NSString *)linkUrl deeplinkFailUrl:(NSString *)deeplinkFailUrl toRoot:(BOOL)toRoot {
//    //不再直接使用 parseLink来处理 browserDetail的链接，留给rrspjump://browser?url=rrspjump%3A%2F%2F  一个跳转回主App的机会...
//    [self p_applicationOpenURL:URL(linkUrl) completionHandler:^(BOOL success) {
//        if (!success) {
//            NSURL *failURL = URL(deeplinkFailUrl);
//            if (failURL) {
//                [[UIApplication sharedApplication] openURL:URL(deeplinkFailUrl)];
//            }
//        }
//    }];
//}
//
//- (void)goBindMobileToRoot:(BOOL)toRoot {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:toRoot loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            RRRetrievePwdViewController *retrieveVC = [[RRRetrievePwdViewController alloc] init];
//            [self goNextViewController:retrieveVC toRoot:toRoot];
//        }
//    }];
//}
//
//- (void)goAccountToRoot:(BOOL)toRoot {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:toRoot loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            [self goNextViewController:[RRMyBoundViewController new] toRoot:toRoot];
//        }
//    }];
//}
//
//- (void)goSigninToRoot:(BOOL)toRoot {
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:toRoot loginFinish:^(BOOL sucess) {
//
//   }];
//}
//
//- (void)goSignupToRoot:(BOOL)toRoot {
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:toRoot loginFinish:^(BOOL sucess) {
//    }];
//}
//
//- (void)goGrowrecordToRoot:(BOOL)toRoot {
//    if (![UserInfoConfig isLogined]) {
//        return;
//    }
//    V3_SilverRecord *next = [[V3_SilverRecord alloc] init];
//    next.type = RecordLever;
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goAlbum:(NSString *)albumId albumType:(NSInteger)albumType toRoot:(BOOL)toRoot {
//    
//}
//
//- (void)goRRAlbum:(NSString *)albumId toRoot:(BOOL)toRoot {
//    RRVideoAlbumWithSeasonViewController *next = [[RRVideoAlbumWithSeasonViewController alloc] init];
//    next.albumId = albumId;
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//
//
//- (void)goMedalListToRootLoginFinish:(BOOL)toRoot {
//    Activity_ViewController *next = [[Activity_ViewController alloc] init];
//    next.targetUrl = KMedalUrl;
//    next.titleStr = @"我的勋章";
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goMedalListToRoot:(BOOL)toRoot {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            [self goMedalListToRootLoginFinish:toRoot];
//        }
//    }];
//   
//}
//
//- (void)goPrivacyComplaintToRoot:(BOOL)toRoot {
//    Activity_ViewController *next = [[Activity_ViewController alloc] init];
//    next.targetUrl = KPrivacyComplaintUrl;
//    next.titleStr = @"隐私投诉";
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goCenterToRoot:(BOOL)toRoot {
//    if ([RRMJTool isYoungModeOpen]) {
//        TOAST(@"青少年模式，无法使用此功能");
//        return;
//    }
//    if ([UserInfoConfig sharedUserInfoConfig].isMoviesOpen) {
//        [self goImmersiveVipPlayToRoot:toRoot];
//    } else {
//        [self goVipPayToRoot:toRoot];
//    }
//}
//
//- (void)presentVipCenter {
//    if ([RRMJTool isYoungModeOpen]) {
//        TOAST(@"青少年模式，无法使用此功能");
//        return;
//    }
//    if ([UserInfoConfig sharedUserInfoConfig].isMoviesOpen) {
//        Activity_ViewController *next = [[Activity_ViewController alloc] init];
//        next.targetUrl = [RRAppConfig config].p_vipCenterUrl;
//        next.titleStr = [RRAppCompanyName stringByAppendingString:@"VIP"];
//        next.isImmersive = YES;
//        [[RRAppLinkManager sharedManager] presentViewController:next animated:YES completion:nil];
//    } else {
//        RRVipPayViewController *next = [[RRVipPayViewController alloc] init];
//        [[RRAppLinkManager sharedManager] presentViewController:next animated:YES completion:nil];
//    }
//}
//
//- (void)goVipLevelRulesUrlToRoot:(BOOL)toRoot {
//    Activity_ViewController *next = [[Activity_ViewController alloc] init];
//    next.targetUrl = KVipLevelRulesUrl;
//    next.titleStr = [RRAppCompanyName stringByAppendingString:@"VIP等级规则"];
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goVipLevelHomeUrlToRoot:(BOOL)toRoot {
//    Activity_ViewController *next = [[Activity_ViewController alloc] init];
//    next.targetUrl = KVipLevelHomeUrl;
//    next.titleStr = [RRAppCompanyName stringByAppendingString:@"VIP等级体系"];
//    next.isImmersive = YES;
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//
//- (void)goTaskCenterToRootLoginFinish:(BOOL)toRoot{
//    
//    if (![UserInfoConfig sharedUserInfoConfig].isMoviesOpen) {
//        [self goDailyQuestionFromId:0 toRoot:toRoot];
//        return;
//    }
//    RRTaskCenterViewController *next = [[RRTaskCenterViewController alloc] init];
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//
//- (void)goTaskCenterToRoot:(BOOL)toRoot {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            [self goTaskCenterToRootLoginFinish:toRoot];
//        }
//    }];
//}
//
//- (void)goDailyQuestionFromIdLoginFinish:(NSInteger)fromId toRoot:(BOOL)toRoot{
//    
//    Activity_ViewController *next = [[Activity_ViewController alloc] init];
//    if (fromId) {
//        next.targetUrl = [KPageQuestion stringByAppendingFormat:@"?from=%ld", (long)fromId];
//    } else {
//        next.targetUrl = KPageQuestion;
//    }
//    next.titleStr = @"每日一题";
//    [self goNextViewController:next toRoot:toRoot];
//    
//}
//
//
//- (void)goDailyQuestionFromId:(NSInteger)fromId toRoot:(BOOL)toRoot {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            [self goDailyQuestionFromIdLoginFinish:fromId toRoot:toRoot];
//        }
//    }];
//
//}
//
//- (void)goAchievementToRoot:(BOOL)toRoot {
//    @weakify(self);
//    [self goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            Activity_ViewController *next = [[Activity_ViewController alloc] init];
//            next.targetUrl = [RRAppConfig config].p_achievementCenterUrl;
//            [self pushViewController:next animated:YES];
//        }
//    }];
//    
//  
//}
//
//- (void)goLeBoSearchVCWithVideoName:(NSString *)videoName videoId:(NSString *)videoId seasonId:(NSString *)seasonId {
//    RRLeBoTVSearchingController *leboSearhVC = [[RRLeBoTVSearchingController alloc] init];
//    leboSearhVC.videoName = videoName;
//    leboSearhVC.videoId = videoId;
//    leboSearhVC.seasonId = seasonId;
//    [self goNextViewController:leboSearhVC toRoot:NO];
//}
//
//- (void)goLeboHelpVCToRoot:(BOOL)toRoot {
//    Activity_ViewController *next = [[Activity_ViewController alloc] init];
//    next.targetUrl = @"http://cdn.hpplay.com.cn/h5/app/helpGuide.html";
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goZeroCommentVideoListToRoot:(BOOL)toRoot {
//    RRRobSofaVideoViewController *next = [[RRRobSofaVideoViewController alloc] init];
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goWelfareToRoot:(BOOL)toRoot {
////    CHECK_LOGIN
////    Activity_ViewController *next = [[Activity_ViewController alloc] init];
////    next.targetUrl = KPageWelfare;
////    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goRrMallToRoot:(BOOL)toRoot {
////    CHECK_LOGIN
////    if ([[UserInfoConfig sharedUserInfoConfig] constantSwitchForKey:kRRConstantSwitchMall]) {
////        RRExchangeMallController *vc = [[RRExchangeMallController alloc] init];
////        [self goNextViewController:vc toRoot:toRoot];
////    } else {
////        [self goWelfareToRoot:toRoot];
////    }
//}
//
//- (void)goInfoListToRoot:(BOOL)toRoot {
//    RRFilmNewsListViewController *next = [[RRFilmNewsListViewController alloc] init];
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goBillboardToRoot:(BOOL)toRoot {
//    RRVideoRankListViewController *next = [[RRVideoRankListViewController alloc] init];
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goCategoryDetailWithCategoryId:(NSString *)categoryId title:(NSString *)title toRoot:(BOOL)toRoot {
//}
//
//- (void)goTopListWithType:(NSString *)type toRoot:(BOOL)toRoot {
//    RRSeasonListViewController *next = [[RRSeasonListViewController alloc] init];
//    next.albumType = @"ALBUM_LIST";
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goNavigationSummaryWithNavigationId:(long long)navigationId toRoot:(BOOL)toRoot {
//    RRVideoModuleCustomViewController *next = [[RRVideoModuleCustomViewController alloc] init];
//    next.navigationId = navigationId;
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goToMyPursuedPage { //跳转我的追剧
//    //清除小红点 清除追剧小红点
//    [[RRUserSubscriptionRedPointDisplayManager sharedInstance] cleanRedPoint];
//    
//    //old
////    RRMyCollectionSeriesViewController *next = [[RRMyCollectionSeriesViewController alloc] init];
////    NSString *currentPageName = [RRUMengLogger currentTopViewControllerPageName];
////    next.fromPageName = currentPageName;
////    [self goNextViewController:next toRoot:NO];
//    
//    //new
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        if (sucess) {
//            RRBingeWatchingViewController *next = [[RRBingeWatchingViewController alloc] init];
//            [self goNextViewController:next toRoot:NO];
//        }
//    }];
//}
//
//- (void)goToMyCollectionContentPageToRoot:(BOOL)toRoot { //跳转我的收藏
//    //old
////    RRMyCollectionContentViewController *next = [[RRMyCollectionContentViewController alloc] init];
////    [self goNextViewController:next toRoot:toRoot];
//    
//    //new
//    RRMyCollectionVC *next = [[RRMyCollectionVC alloc] init];
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goChannelWithType:(NSString *)type withId:(NSString *)sectionId withTitle:(NSString *)title {
//    RRAppLinkManager *manager = [RRAppLinkManager sharedManager];
//    if ([type isEqualToString:@"SEASON_CARD"]) {
//        RRPopularitySeasonViewController *next = [[RRPopularitySeasonViewController alloc] init];
//        next.sectionId = sectionId;
//        next.navTitle = title;
//        [manager pushViewController:next animated:YES];
//    } else if ([type isEqualToString:@"PROMOTION"]) {
//        RRSpecialColumnViewController *next = [[RRSpecialColumnViewController alloc] init];
//        next.sectionId = sectionId;
//        next.navTitle = title;
//        [manager pushViewController:next animated:YES];
//    } else if ([type isEqualToString:@"ALBUM_LIST"]) {
//        RRSeasonListViewController *next = [[RRSeasonListViewController alloc] init];
//        next.sectionId = sectionId;
//        next.albumType = @"ALBUM_LIST";
//        next.navTitle = title;
//        [manager pushViewController:next animated:YES];
//    } else if ([type isEqualToString:@"ALBUM"]) {
//        RRSeasonListViewController *next = [[RRSeasonListViewController alloc] init];
//        next.sectionId = sectionId;
//        next.albumType = @"ALBUM";
//        next.navTitle = title;
//        [manager pushViewController:next animated:YES];
//    }
//}
//
//- (void)goSobotToRoot:(BOOL)toRoot {
//    if ([UserInfoConfig isLogined] && ![RRGetPrivilegeApi privilegeEnableWithName:kRRMedalPrivilegevipVideo]) {
//        [RRUserRobotNormalOrVipView showUserRobotView];
//        return;
//    }
//    [[APPThirdPartService sharedAPPThirdPartService] startQYRobot];
//}
//
//- (void)goAllCategorySeasonVCWithParam:(NSDictionary *)param {
//    RRAllSeasonCategoryViewController *vc = [[RRAllSeasonCategoryViewController alloc] init];
//    vc.area = param[@"area"];
//    vc.positionParam = [param mutableCopy];
//    RRAppLinkManager *manager = [RRAppLinkManager sharedManager];
//    [manager pushViewController:vc animated:YES];
//}
//
//- (void)goDateVC {
//    DateVC *dateVc = [[DateVC alloc] init];
//    RRAppLinkManager *manager = [RRAppLinkManager sharedManager];
//    [manager pushViewController:dateVc animated:YES];
//}
//
//- (void)goLoginToRoot:(BOOL)toRoot {
//    if ([self currentShowLoginPage]) {
//        return;
//    }
//    RRNewLoginViewController *next = [[RRNewLoginViewController alloc] init];
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goLoginBlockToRoot:(BOOL)toRoot loginFinish:(RRLoginStatusBlock)loginStatusBlock {
//    if (![UserInfoConfig isLogined]) {
//        if ([self currentShowLoginPage]) {
//            return;
//        }
//        UIViewController *currentVc = [RRAppLinkManager sharedManager].currentTopController;
//        if ([currentVc isKindOfClass:NSClassFromString(@"RRSeasonPlayViewController")]) {
//            RRAlertView *alert = [[RRAlertView alloc] initWithTitle:@"参与互动需要登录哦～" cancelTitle:@"取消" sureTitle:@"确定"];
//            alert.dismissBlock = ^(BOOL isClicked) {
//                if (isClicked) {
//                    [currentVc dismissViewControllerAnimated:YES completion:nil];
//                    [[NSNotificationCenter defaultCenter] postNotificationName:KRRNotifacationDownLoadPlayerBackLogin object:nil];
//                }
//            };
//            [alert showInView:currentVc.view];
//            return;
//        }
//        if (loginStatusBlock) {
//            self.loginStatusBlock = loginStatusBlock;
//        }
//        if (self.isAlertLoginStyle) {
//            if ([[RRProviderLoginManager shareManager] canLogin]) {
//                [[RRProviderLoginManager shareManager] startJVProviderLogin];
//            } else {
//                [self alertStyleLogin];
//            }
//        } else {
//            RRNewLoginViewController *next = [[RRNewLoginViewController alloc] init];
//            [self goNextViewController:next toRoot:toRoot];
//        }
//    } else {
//        if (loginStatusBlock) {
//            loginStatusBlock(YES);
//        }
//    }
//}
//
//- (BOOL)currentShowLoginPage {
//    if (self.isAlertLoginStyle) {
//        return [self currentShowAlertLoginPage];
//    } else {
//        BaseNavigationController *navigationController = [self currentTopNavigationController];
//        if (navigationController) {
//            for (UIViewController *vc in navigationController.viewControllers) {
//                if ([vc isMemberOfClass:[RRNewLoginViewController class]]) {
//                    //正在登录中
//                    return YES;
//                }
//            }
//        }
//    }
//    if ([[RRProviderLoginManager shareManager] currentJVNavigationController]) {
//         //正在一键登录
//         return YES;
//     }
//    return NO;
//}
//
//- (BOOL)currentShowAlertLoginPage {
//    if ([[RRProviderLoginManager shareManager] currentJVNavigationController]) {
//        //正在一键登录
//        return YES;
//    }
//    return self.isAlertLoginStyle && (self.alertLoginView.isShowing || [[RRProviderLoginManager shareManager] getAlertLoginViewIsShowing]);
//}
//
//- (void)goSeasonCategory:(NSString *)category toRoot:(BOOL)toRoot {
//
//    [self goMainTab:1];
//}
//
//- (void)goMyCurrencyAccountDetailToRoot:(BOOL)toRoot {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            Activity_ViewController *next = [[Activity_ViewController alloc] init];
//            next.targetUrl = [RRAppConfig config].p_currencyAccountDetailUrl;
//            [self goNextViewController:next toRoot:toRoot];
//        }
//    }];
//}
//
//- (void)goToRRDeleteUsetListViewControllerToRoot:(BOOL)toRoot {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            RRDeleteUsetListViewController *vc = [[RRDeleteUsetListViewController alloc] init];
//            [self goNextViewController:vc toRoot:toRoot];
//        }
//    }];
// 
//}
//
//- (void)goMainTableWithIndex:(NSInteger)index {
//    if (index > 3) {
//        return;
//    }
//    [self goMainTab:index];
//}
//
//- (void)goThirdWebViewControllerWithURL:(NSString *)URL seasonID:(NSString *)seasonID site:(NSString *)site {
//    RRSeasonThirdPlayViewController *next = [[RRSeasonThirdPlayViewController alloc] init];
//    next.targetUrl = URL;
//    next.seasonID = seasonID;
//    next.site = site;
//    [[RRAppLinkManager sharedManager] pushViewController:next animated:YES];
//}
//
//- (void)goYoungModeVCWithModeType:(RRYoungModeVcType)rrYoungModeVcType ToRoot:(BOOL)toRoot {
//    RRYoungModeViewController *youngMode = [[RRYoungModeViewController alloc] initWithNibName:@"RRYoungModeViewController" bundle:nil];
//    youngMode.rrYoungModeVcType = rrYoungModeVcType;
//    [self goNextViewController:youngMode toRoot:toRoot];
//}
//
//- (void)goYoungModePasswordVCLoginFinish:(RRPasswordType)rrPasswordType lastPassword:(NSString *)lastPassword ToRoot:(BOOL)toRoot {
//    RRYoungModePasswordViewController *passwordVC = [[RRYoungModePasswordViewController alloc] initWithNibName:@"RRYoungModePasswordViewController" bundle:nil];
//    passwordVC.rrPasswordType = rrPasswordType;
//    passwordVC.lastPassword = lastPassword;
//    //输入密码使用present 避免侧边栏右滑
//    if (rrPasswordType == RRPasswordTypeTimeLong || rrPasswordType == RRPasswordTypeTimeNight) {
//        if ([RRMJTool isYoungModeOpen]) {
//            [self presentViewController:passwordVC animated:YES completion:nil];
//        }
//    } else {
//        [self goNextViewController:passwordVC toRoot:toRoot];
//    }
//}
//
//- (void)goYoungModePasswordVCWithType:(RRPasswordType)rrPasswordType lastPassword:(NSString *)lastPassword ToRoot:(BOOL)toRoot {
//    if (![UserInfoConfig isLogined]) {
//        [RRMJTool setYoungModePassword:nil];
//    }
//    @weakify(self);
//    [self goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            [self goYoungModePasswordVCLoginFinish:rrPasswordType lastPassword:lastPassword ToRoot:toRoot];
//        }
//    }];
//}
//
//#pragma mark - 签到页
//
//- (void)goCheckinPageToRoot:(BOOL)toRoot {
//    [self goWebDetail:[RRAppConfig config].p_checkinPageUrl title:@"" isImmersive:YES isH5:NO showBackInmmersive:NO toRoot:toRoot];
//}
//
//- (void)goOperatePositionDetail: (NSString *)url {
//    [self goWebDetail:url title:@"" isImmersive:YES isH5:YES showBackInmmersive:YES toRoot:NO];
//}
//#pragma mark - 安利页
//- (void)goAmwayToRoot:(BOOL)toRoot {
//    RRAmwayMainController *amwayVC = [[RRAmwayMainController alloc] init];
//    [self goNextViewController:amwayVC toRoot:toRoot];
//}
//
//- (void)goAmwayVideoEveryBodyToRoot:(BOOL)toRoot section:(NSInteger)section row:(NSInteger)row array:(NSArray *)array currentPage:(NSInteger)currentPage total:(NSInteger)total isEnd:(BOOL)isEnd delegate:(id)delegate pageSource:(NSDictionary *)pageSource {
////    大家都在看
//    RRAmwayVideoEverybodyWatchingViewController *amwayVC = [[RRAmwayVideoEverybodyWatchingViewController alloc] init];
//    amwayVC.playSection = section;
//    amwayVC.playRow = row;
//    
//    RRAmwayVideoEverybodyWatchingTopListModel *listModel = [[RRAmwayVideoEverybodyWatchingTopListModel alloc] init];
//    listModel.total = total;
//    listModel.currentPage = currentPage;
//    listModel.isEnd  = isEnd;
//    listModel.results = array;
//    amwayVC.everybodyWatchingTopListModel = listModel;
//    amwayVC.delegate = delegate;
//    amwayVC.pageSource = pageSource;
//    [self amwayVideoWithController:amwayVC ToRoot:toRoot];
//}
//
//- (void)goAmwayVideoActorToRoot:(BOOL)toRoot section:(NSInteger)section row:(NSInteger)row array:(NSArray *)array pageSource:(NSDictionary *)pageSource {
//    //演员视频，演员动态
//    RRAmwayVideoActorViewController *amwayVC = [[RRAmwayVideoActorViewController alloc] init];
//    amwayVC.playSection = section;
//    amwayVC.playRow = row;
//    RRAmwayVideoListModel *listModel = [[RRAmwayVideoListModel alloc] init];
//    listModel.results = array;
//    amwayVC.listModel = listModel;
//    if (pageSource) {
//        amwayVC.pageSource = pageSource;
//    }
//    [self amwayVideoWithController:amwayVC ToRoot:toRoot];
//}
//
//- (void)goAmwayToSearchResult:(BOOL)toRoot {
//    //搜索结果页无数据时候都推荐
//    RRAmwayVideoSearchResultViewController *amwayVC = [[RRAmwayVideoSearchResultViewController alloc] init];
//    [self amwayVideoWithController:amwayVC ToRoot:toRoot];
//}
//
//- (void)amwayVideoWithController:(UIViewController *)next ToRoot:(BOOL)toRoot {
//    if (!toRoot) {
//        BaseNavigationController *naviVC = [self currentTopNavigationController];
//        if (naviVC) {
//            NSMutableArray *vcs = [naviVC.viewControllers mutableCopy];
//            [vcs enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
//                if ([obj isKindOfClass:[RRAmwayVideoViewController class]]) {
//                    [vcs removeObject:obj];
//                }
//            }];
//            [vcs addObject:next.realController];
//            [naviVC setViewControllers:vcs animated:YES];
//            return;
//        }
//    }
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//
//
//#pragma mark - public apis
//
//- (void)pushViewController:(UIViewController *)next animated:(BOOL)animated {
//    if (![NSThread currentThread].isMainThread) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self pushViewController:next animated:animated];
//        });
//        return;
//    }
//    //435 一键登录逻辑
//    if ([next isKindOfClass:[RRNewLoginViewController class]] && [[RRProviderLoginManager shareManager] canLogin]) {
//        [[RRProviderLoginManager shareManager] startJVProviderLogin];
//        return;
//    }
//
//    //不影响之前的逻辑
//    BaseNavigationController *navigationController = [self currentTopNavigationController];
//    UIViewController *topVC = navigationController.topViewController;
//    if ([topVC isKindOfClass:[BaseViewController class]]) {
//        BaseViewController *baseVC = (BaseViewController *)topVC;
//        [baseVC pushViewController:next animated:animated];
//    } else {
//        //435 一键登录逻辑
//        if (!navigationController) {
//            UINavigationController *navigation = [[RRProviderLoginManager shareManager] currentJVNavigationController];
//            if (navigation) {
//                [navigation pushViewController:next animated:animated];
//                return;
//            }
//        }
//        if (([next isKindOfClass:[V3_RRUserUploadVedioDetailVC class]] || [next isKindOfClass:[RRSeasonViewController class]]) && ((BaseViewController *)next).sourcePage == RRStatisticsSourcePageIdNone) {
//            ((BaseViewController *)next).sourcePage = navigationController.sourcePage;
//            ((BaseViewController *)next).dynamicPage = navigationController.dynamicPage;
//            [self changeNavigationControllerStack];
//        }
//        [navigationController pushViewController:next animated:animated];
//    }
//}
//
//
//
//- (void)pushViewController:(UIViewController *)next animated:(BOOL)animated loginFinish:(RRLoginStatusBlock)loginStatusBlock{
//    if (![NSThread currentThread].isMainThread) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self pushViewController:next animated:animated];
//        });
//        return;
//    }
//
//    //435 一键登录逻辑
//    if ([next isKindOfClass:[RRNewLoginViewController class]] && [[RRProviderLoginManager shareManager] canLogin]) {
//        [[RRProviderLoginManager shareManager] startJVProviderLogin];
//        return;
//    }
//    //不影响之前的逻辑
//    BaseNavigationController *navigationController = [self currentTopNavigationController];
//    UIViewController *topVC = navigationController.topViewController;
//    if ([topVC isKindOfClass:[BaseViewController class]]) {
//        BaseViewController *baseVC = (BaseViewController *)topVC;
//        [baseVC pushViewController:next animated:animated];
//    } else {
//        //435 一键登录逻辑
//        if (!navigationController) {
//            UINavigationController *navigation = [[RRProviderLoginManager shareManager] currentJVNavigationController];
//            if (navigation) {
//                [navigation pushViewController:next animated:animated];
//                return;
//            }
//        }
//        if (([next isKindOfClass:[V3_RRUserUploadVedioDetailVC class]] || [next isKindOfClass:[RRSeasonViewController class]]) && ((BaseViewController *)next).sourcePage == RRStatisticsSourcePageIdNone) {
//            ((BaseViewController *)next).sourcePage = navigationController.sourcePage;
//            ((BaseViewController *)next).dynamicPage = navigationController.dynamicPage;
//            [self changeNavigationControllerStack];
//        }
//        [navigationController pushViewController:next animated:animated];
//    }
//}
//
//
//
//- (void)pushToDownloadViewController:(UIViewController *)next animated:(BOOL)animated {
//    if ([next isKindOfClass:[RRMyDownloadMainNewController class]]) {
//        /**
//         当堆栈中已经存在下载控制器时，push原有的下载控制器
//         */
//        AppDelegate2 *appDelegate = (AppDelegate2 *)[UIApplication sharedApplication].delegate;
//        BaseNavigationController *currentNavigation = (BaseNavigationController *)appDelegate.window.rootViewController;
//        NSMutableArray *naviVCsArr = [[NSMutableArray alloc]initWithArray:currentNavigation.viewControllers];
//        for (UIViewController *subVc in naviVCsArr) {
//            if ([subVc isKindOfClass:[RRMyDownloadMainNewController class]]) {
//                ((RRMyDownloadMainNewController *)subVc).selectIndex = ((RRMyDownloadMainNewController *)next).selectIndex;
//                next = (RRMyDownloadMainNewController *)subVc;
//                [naviVCsArr removeObject:subVc];
//                break;
//            }
//        }
//        currentNavigation.viewControllers = naviVCsArr;
//    }
//    [self pushViewController:next animated:animated];
//}
//
//- (void)popViewControllerAnimated:(BOOL)animated {
//    if (![NSThread currentThread].isMainThread) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self popViewControllerAnimated:animated];
//        });
//        return;
//    }
//    BaseNavigationController *navigationController = [self currentTopNavigationController];
//    if (navigationController.childViewControllers.count > 0) {
//        [navigationController popViewControllerAnimated:animated];
//    }
//}
//
//- (void)changeNavigationControllerStack {
//    BaseNavigationController *navigationController = [self currentTopNavigationController];
//    NSMutableArray *arr = [NSMutableArray arrayWithArray:navigationController.childViewControllers];
//    BOOL hasRemove = NO;
//    for (UIViewController *subCtr in arr) {
//        if ([subCtr isKindOfClass:[V3_RRUserUploadVedioDetailVC class]]) {
//            [arr removeObject:subCtr];
//            hasRemove = YES;
//            break;
//        }
//    }
//    if (hasRemove) {
//        navigationController.viewControllers = [arr copy];
//    }
//}
//
//- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
//    if (![viewControllerToPresent isKindOfClass:[UINavigationController class]]) {
//        if ([viewControllerToPresent isKindOfClass:[BaseViewController class]]) {
//            viewControllerToPresent = [[BaseNavigationController alloc] initWithRootViewController:viewControllerToPresent];
//            viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
//        }
//    }
//    UIViewController *topViewController = [self currentTopNavigationController];
//    if (!topViewController) {
//        AppDelegate2 *appDelegate = (AppDelegate2 *)[UIApplication sharedApplication].delegate;
//        topViewController = (UINavigationController *)appDelegate.window.rootViewController;
//        while (topViewController.presentedViewController)
//            topViewController = topViewController.presentedViewController;
//    }
//    [topViewController presentViewController:viewControllerToPresent animated:flag completion:completion];
//}
//
//- (void)goBitDanceDetailWithUrl:(NSString *)jumpUrl {
//    NSURL *url = [[NSURL URLWithString:jumpUrl] uq_URLByAppendingQueryDictionary:@{ @"statusbar": @(statusMarginToTop()), @"clientType": kAppClientType, @"clientVersion": kAppClientVersion } appendAfertFragment:YES];
//    Activity_ViewController *next = [[Activity_ViewController alloc] init];
//    next.targetUrl = url.absoluteString;
//    next.isH5Web = YES;
//    [[RRAppLinkManager sharedManager] pushViewController:next animated:YES];
//}
//
//- (BaseNavigationController *)currentTopNavigationController {
//    AppDelegate2 *appDelegate = (AppDelegate2 *)[UIApplication sharedApplication].delegate;
//    UIViewController *topViewController = (UINavigationController *)appDelegate.window.rootViewController;
//    while (topViewController.presentedViewController)
//        topViewController = topViewController.presentedViewController;
//    if ([topViewController isKindOfClass:[BaseNavigationController class]]) {
//        return (BaseNavigationController *)topViewController;
//    }
//    return nil;
//}
//
//- (UIViewController *)currentTopController {
//    AppDelegate2 *appDelegate = (AppDelegate2 *)[UIApplication sharedApplication].delegate;
//    UIViewController *topViewController = (UINavigationController *)appDelegate.window.rootViewController;
//    while (topViewController.presentedViewController)
//        topViewController = topViewController.presentedViewController;
//    if ([topViewController isKindOfClass:[UINavigationController class]]) {
//        return ((UINavigationController *)topViewController).topViewController;
//    }
//    return topViewController;
//}
//
//- (BaseNavigationController *)currentBaseNavigationController {
//    AppDelegate2 *appDelegate = (AppDelegate2 *)[UIApplication sharedApplication].delegate;
//    BaseNavigationController *currentNavigation = (BaseNavigationController *)appDelegate.window.rootViewController;
//    if (![currentNavigation isKindOfClass:[BaseNavigationController class]]) {
//        return nil;
//    }
//    return currentNavigation;
//}
//
//
//- (void)goNextViewController:(UIViewController *)next toRoot:(BOOL)toRoot  {
//    if (![NSThread currentThread].isMainThread) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self goNextViewController:next toRoot:toRoot];
//        });
//        return;
//    }
//    if (toRoot) {
//        NSMutableArray *vcs = [self popedRootViewControllers];
//        [vcs addObject:next];
//        [[self currentBaseNavigationController] setViewControllers:vcs animated:YES];
//    } else {
//        [self pushViewController:next animated:YES];
//    }
//}
//
//
//- (void)goMyLevel {
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        if (sucess) {
//            NSString *token = [UserInfoConfig sharedUserInfoConfig].userInfo.token;
//            NSString *url = [NSString stringWithFormat:@"%@/h5/myLevel/home?token=%@&st=%@&aliId=%@", KShareUrl, token, [UserInfoConfig sharedUserInfoConfig].st ? : @"", [UTDevice utdid] ? : @""];
//            [self parseLinkUrl:url toRoot:NO isInWebView:NO redirectInfo:nil];
//        }
//    }];
//}
//
//- (void)goVipPayToRoot:(BOOL)toRoot {
//    //APP内统一改用到 goCenterToRoot 方法    之后goVipPayToRoot 仅提供入口给h5使用
//    RRVipPayViewController *next = [[RRVipPayViewController alloc] init];
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goImmersiveVipPlayToRoot:(BOOL)toRoot {
//    NSString *title = [RRAppCompanyName stringByAppendingString:@"VIP"];
//    [self goWebDetail:[RRAppConfig config].p_vipCenterUrl title:title isImmersive:YES isH5:NO showBackInmmersive:NO toRoot:toRoot];
//}
//
//- (void)goVipPayRestore:(BOOL)toRoot {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            RRVipRestoreViewController *next = [[RRVipRestoreViewController alloc] init];
//            [self goNextViewController:next toRoot:toRoot];
//        }
//    }];
//  
//}
//
//- (void)goAblumList:(NSString *)sectionId title:(NSString *)title toRoot:(BOOL)toRoot {
//    RRAblumListVC  *ablumListVC = [[RRAblumListVC alloc]init];
//    ablumListVC.sectionId = sectionId;
//    ablumListVC.navTitle = title;
//    [self goNextViewController:ablumListVC toRoot:toRoot];
//}
//
//- (void)goAblumDetail:(NSString *)ablumID toRoot:(BOOL)toRoot{
//    RRAblumDetailVC *next = [[RRAblumDetailVC alloc] init];
//    next.param = ablumID;
//    [self goNextViewController:next toRoot:toRoot];
//}
//
//- (void)goDramaCommentDetail:(NSString *)dramaCommentId toRoot:(BOOL)toRoot {
//    RRDramaCommentDetailVC *next = [[RRDramaCommentDetailVC alloc] init];
//    next.dramaCommentId = dramaCommentId;
//    [self pushViewController:next animated:YES];
//}
//
////话题详情
//- (void)goTalkDetail:(NSString *)talkId toRoot:(BOOL)toRoot {
//    RRTalkDetailVC *next = [[RRTalkDetailVC alloc] init];
//    next.talkId = talkId;
//    [self pushViewController:next animated:YES];
//}
//
////话题评论详情
//- (void)goTalkCommentDetail:(NSString *)talkCommentId toRoot:(BOOL)toRoot {
//    RRTalkCommentDetailVC *next = [[RRTalkCommentDetailVC alloc] init];
//    [self pushViewController:next animated:YES];
//}
//
//- (void)goActorWithActorId:(NSString *)actorId actorName:(NSString *)actorName mainActor:(BOOL)mainActor toRoot:(BOOL)toRoot {
//    
////    if (mainActor) {
//        [self goActorDetailWithActorId:actorId actorName:actorName mainActor:YES toRoot:toRoot];
////    } else {
////        [self goActorIntroWithActorId:actorId actorName:actorName mainActor:NO toRoot:toRoot];
////    }
//}
//
//- (void)goActorDetailWithActorId:(NSString *)actorId actorName:(NSString *)actorName mainActor:(BOOL)mainActor toRoot:(BOOL)toRoot {
////    @weakify(self);
////    [[RRAppLinkManager sharedManager]goLoginBlockToRoot:toRoot loginFinish:^(BOOL sucess) {
////        @strongify(self);
////        if (sucess) {
//            RRActorVC *next = [[RRActorVC alloc]init];
//            next.actorId = actorId;
//            next.name = actorName;
//            next.mainActor = mainActor;
//            
//            if (!toRoot) {
//                BaseNavigationController *naviVC = [self currentTopNavigationController];
//                if (naviVC) {
//                    NSMutableArray *vcs = [naviVC.viewControllers mutableCopy];
//                    [vcs enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
//                        if ([obj isKindOfClass:[RRActorVC class]]) {
//                            [vcs removeObject:obj];
//                        }
//                    }];
//                    [vcs addObject:next.realController];
//                    [naviVC setViewControllers:vcs animated:YES];
//                    return;
//                }
//            }
//            [self goNextViewController:next toRoot:toRoot];
////        }
////    }];
//     
//}
//
////- (void)goActorIntroWithActorId:(NSString *)actorId actorName:(NSString *)actorName mainActor:(BOOL)mainActor toRoot:(BOOL)toRoot {
//////    @weakify(self);
//////    [[RRAppLinkManager sharedManager]goLoginBlockToRoot:toRoot loginFinish:^(BOOL sucess) {
//////        @strongify(self);
//////        if (sucess) {
////            RRActorIntroVC *next = [[RRActorIntroVC alloc] initWithIsHalf:NO];
////            next.actorId = actorId;
////            next.name = actorName;
////            next.mainActor = mainActor;
////            [self goNextViewController:next toRoot:toRoot];
//////        }
//////    }];
////}
//
//- (void)goCreateSheet:(BOOL)toRoot {
//    [self goCreateSheetWithId:nil model:nil toRoot:NO withBlock:nil];
//}
//
//- (void)goCreateSheetWithId:(NSString *)Id model:(RRCreateSheetModel *)model toRoot:(BOOL)toRoot withBlock:(void (^)(void))block {
//    @weakify(self)
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self)
//        if (sucess) {
//            RRMyCreateSheetViewController *vc = [[RRMyCreateSheetViewController alloc] init];
//            vc.Id = Id;
//            vc.createSheetModel = model;
//            vc.successBlock = ^{
//                if (block) {
//                    block();
//                }
//            };
//            NSString *currentPageName = [RRUMengLogger currentTopViewControllerPageName];
//            vc.fromPageName = currentPageName;
//            [self goNextViewController:vc toRoot:toRoot];
//        }
//    }];
//}
//
//- (void)goFilmReviewWithSeasonId:(NSString *)seasonId model:(RRSeniorCommentsModel *)model delegate:(id)delegate toRoot:(BOOL)toRoot {
//    @weakify(self)
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self)
//        if (sucess) {
//            RRCreateFilmReviewViewController *vc = [[RRCreateFilmReviewViewController alloc] init];
//            vc.typeId = seasonId;
//            vc.model = model;
//            vc.delegate = delegate;
//            NSString *currentPageName = [RRUMengLogger currentTopViewControllerPageName];
//            vc.fromPageName = currentPageName;
//            [self goNextViewController:vc toRoot:toRoot];
//        }
//    }];
//}
//
//- (void)goCommunityTalkList:(BOOL)toRoot {
//    RRCommunityTalkViewController *vc = [[RRCommunityTalkViewController alloc] init];
//    NSString *currentPageName = [RRUMengLogger currentTopViewControllerPageName];
//    vc.fromPageName = currentPageName;
//    [self goNextViewController:vc toRoot:toRoot];
//}
//
//- (void)goVideoRecommendListWithSectionId:(NSString *)sectionId title:(NSString *)title  toRoot:(BOOL)toRoot {
//    RRVideoRecommendListVC *vc = [[RRVideoRecommendListVC alloc] init];
//    vc.sectionId = sectionId;
//    vc.name = title;
//    [self goNextViewController:vc toRoot:toRoot];
//}
//
//#pragma mark - private apis
//
//- (void)popToRootViewController {
//    AppDelegate2 *appDelegate = (AppDelegate2 *)[UIApplication sharedApplication].delegate;
//    BaseNavigationController *currentNavigation = (BaseNavigationController *)appDelegate.window.rootViewController;
//    if (![currentNavigation isKindOfClass:[BaseNavigationController class]]) {
//        return;
//    }
//    [currentNavigation setViewControllers:[self popedRootViewControllers]];
//}
//
//- (NSMutableArray *)popedRootViewControllers {
//    AppDelegate2 *appDelegate = (AppDelegate2 *)[UIApplication sharedApplication].delegate;
//    BaseNavigationController *currentNavigation = (BaseNavigationController *)appDelegate.window.rootViewController;
//    if (![currentNavigation isKindOfClass:[BaseNavigationController class]]) {
//        return nil;
//    }
//    UIViewController *topVC = currentNavigation.topViewController;
//    [self dismissViewControllerTo:topVC completion:nil];
//    return @[currentNavigation.viewControllers[0]].mutableCopy;
//}
//
//- (void)dismissViewControllerTo:(UIViewController *)topVC completion:(void (^__nullable)(void))completion {
//    if (!topVC.presentedViewController) {
//        return;
//    }
//    [self dismissViewControllerTo:topVC.presentedViewController completion:^{
//        [topVC.presentedViewController dismissViewControllerAnimated:YES completion:^{
//            if (completion) {
//                completion();
//            }
//        }];
//    }];
//}
//
//- (NSDictionary *)parameterDictFromUrl:(NSString *)urlStr {
//    NSArray<NSString *> *urlStrArray = [urlStr componentsSeparatedByString:@"?"];
//    if ([urlStrArray count] < 2) {
//        return [NSDictionary dictionary];
//    } else {
//        return [urlStrArray[1] uq_URLQueryDictionary];
//    }
//}
//
////字典的解析
//- (NSDictionary *)dictObjectWithJSONString:(NSString *)dictString {
//    if ([dictString isKindOfClass:[NSString class]] && dictString.length) {
//        NSError *error = nil;
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[dictString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:&error];
//        if (!dict) {
//            dict = [NSJSONSerialization JSONObjectWithData:[dictString.stringByRemovingPercentEncoding dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:&error];
//        }
//        if ([dict isKindOfClass:[NSDictionary class]] && dict.count) {
//            return dict;
//        }
//    }
//    return nil;
//}
//
//- (void)pushToUserEditController {
//    RRUserInformationViewController *vc = [[RRUserInformationViewController alloc] init];
//    [self goNextViewController:vc toRoot:NO];
//}
//
//- (void)releaseLoginBlock{
//    if (self.loginStatusBlock) {
//        self.loginStatusBlock = nil;
//    }
//}
//
//- (void)alertStyleLogin {
//    RRAlertLoginView *alertLoginView = [[RRAlertLoginView alloc] initWithType:RRAlertLoginViewTypeNomal];
//    self.alertLoginView = alertLoginView;
//    [self.currentTopController.view addSubview:self.alertLoginView];
//    [self.alertLoginView show];
//}
@end
