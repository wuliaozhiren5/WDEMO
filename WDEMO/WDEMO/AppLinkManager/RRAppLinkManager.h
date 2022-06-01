//
//  RRAppLinkManager.h
//  WDEMO
//
//  Created by rrtv on 2022/6/1.
//  Copyright © 2022 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "BaseNavigationController.h"
//#import "APPThirdPartService.h"
//#import "RRYoungModeViewController.h"
//#import "RRYoungModePasswordViewController.h"
//#import "RRSeriesLiveRoomModel.h"
//#import "RRSeniorCommentsModel.h"
//#import "RRCreateSheetModel.h"

//typedef enum : NSUInteger {
//    RRYouZanEntryMine = 0,
//    RRYouZanEntryDiscover,
//} RRYouZanEntry;
//
//typedef NS_ENUM(NSUInteger, MyProfileTabType) {
//    MyProfileTabTypeDynamic, //动态
//    MyProfileTabTypeBingeWatch, //追剧
//    MyProfileTabTypeVideo, //视频
//    MyProfileTabTypeCollection, //合辑
//    MyProfileTabTypeSeason, //剧集
//    MyProfileTabTypeSheet, //片单
//};

@interface RRAppLinkManager : NSObject

+ (instancetype)sharedManager;

//- (void)goMainTab:(NSInteger)index;
//- (void)goMedalListToRoot:(BOOL)toRoot;
//- (void)goPrivacyComplaintToRoot:(BOOL)toRoot;
//- (void)goSobotToRoot:(BOOL)toRoot;
////- (void)goLoginToRoot:(BOOL)toRoot;
//
//-(void)goLoginBlockToRoot:(BOOL)toRoot loginFinish:(RRLoginStatusBlock)loginStatusBlock;
//
//- (void)goAblumDetail:(NSString *)ablumID toRoot:(BOOL)toRoot;
////影评详情
//- (void)goDramaCommentDetail:(NSString *)dramaCommentId toRoot:(BOOL)toRoot;
////话题详情
//- (void)goTalkDetail:(NSString *)talkId toRoot:(BOOL)toRoot;
////话题评论详情
//- (void)goTalkCommentDetail:(NSString *)talkCommentId toRoot:(BOOL)toRoot;
// 
//- (void)goSeasonCategory:(NSString *)category toRoot:(BOOL)toRoot;
//- (void)goMainTableWithIndex:(NSInteger)index;
//- (void)goDailyQuestionFromId:(NSInteger)fromId toRoot:(BOOL)toRoot;
////跳转剧集详情页
//- (void)goSeasonDetail:(NSString *)seasonId
//                 title:(NSString *)title
//               isMovie:(BOOL)isMovie
//                toRoot:(BOOL)toRoot;
///// 跳转剧集详情页，社区首页讨论类型跳转，定位
///// @param seniorCommentsModel 评论model
///// @param isCommunityEnter 社区进入
///// isCommunityEnter = yes，seniorCommentsModel != nil，定位讨论制定评论
///// isCommunityEnter = yes，seniorCommentsModel == nil，定位讨论跳不存在提示
///// 如果不需要定位  isCommunityEnter = no，seniorCommentsModel == nil
//- (void)goSeasonDetail:(NSString *)seasonId
//                 title:(NSString *)title
//   seniorCommentsModel:(RRSeniorCommentsModel*)seniorCommentsModel
//      isCommunityEnter:(BOOL)isCommunityEnter
//               isMovie:(BOOL)isMovie
//                toRoot:(BOOL)toRoot;
//
//- (void)goVideoDetail:(NSString *)videoId title:(NSString *)title albumId:(NSString *)albumId cover:(NSString *)cover toRoot:(BOOL)toRoot;
//- (void)goAmwayShortVideo:(NSString *)videoId sectionId:(NSString *)sectionId toRoot:(BOOL)toRoot;
//- (void)goAmwayVideo:(NSString *)videoId cover:(NSString *)cover toRoot:(BOOL)toRoot;
//- (void)goInfoDetail:(NSString *)infoId toRoot:(BOOL)toRoot;
//- (void)goRRAlbum:(NSString *)albumId toRoot:(BOOL)toRoot;
//
//- (void)goRRGuessYouLike:(NSString *)Id toRoot:(BOOL)toRoot;
//
//- (void)goUpuserDetail:(NSString *)userId toRoot:(BOOL)toRoot;
//- (void)goUpuserDetail:(NSString *)userId videoId:(NSString *)videoId toRoot:(BOOL)toRoot;
//
////tabType  个人主页指定的tab
//- (void)goUpuserDetail:(NSString *)userId
//               videoId:(NSString *)videoId
//               tabType:(enum MyProfileTabType)tabType
//                toRoot:(BOOL)toRoot;
//
////3.9.0
////- (void)goArticleDetail:(NSString *)articleId toRoot:(BOOL)toRoot;
////- (void)goCircleDetailWithCircleId:(NSString *)circleId toRoot:(BOOL)toRoot;
////- (void)goActorDetailWithActorId:(NSString *)actorId toRoot:(BOOL)toRoot;
//
////4.0.0
//- (void)goSeachToRoot:(BOOL)toRoot searchPortalType:(RRSearchPortalType)searchPortalType ;
//- (void)goAlbum:(NSString *)albumId albumType:(NSInteger)albumType toRoot:(BOOL)toRoot;
//
//- (void)goRrMallToRoot:(BOOL)toRoot;
//
//- (BOOL)parseLinkUrl:(NSString *)linkUrl toRoot:(BOOL)toRoot isInWebView:(BOOL)isInWebView redirectInfo:(NSDictionary **)redirctInfo clickId:(RRStatisticsId)clickId clickItem:(NSString *)clickItem clickParamDict:(NSMutableDictionary *)clickParams;
//
//- (BOOL)parseLinkUrl:(NSString *)linkUrl toRoot:(BOOL)toRoot isInWebView:(BOOL)isInWebView redirectInfo:(NSDictionary **)redirctInfo clickId:(RRStatisticsId)clickId clickItem:(NSString *)clickItem clickParamDict:(NSMutableDictionary *)clickParams deeplinkFailUrl:(NSString *)deeplinkFailUrl;
//
//- (void)goDeeplink:(NSURL *)deepLink completionHandler:(void (^)(BOOL success))completion;
//
//- (BOOL)parseLinkUrl:(NSString *)linkUrl toRoot:(BOOL)toRoot isInWebView:(BOOL)isInWebView redirectInfo:(NSDictionary **)redirctInfo;
//
//- (BOOL)parseLinkUrl:(NSString *)linkUrl;
//
//- (void)pushViewController:(UIViewController *)next animated:(BOOL)animated;
//- (void)popViewControllerAnimated:(BOOL)animated;
//- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion;
//
//- (void)goBitDanceDetailWithUrl:(NSString *)jumpUrl;
//
//@property (nonatomic, readonly) BaseNavigationController *currentTopNavigationController;
//@property (nonatomic, readonly) UIViewController *currentTopController;
//
//@property (nonatomic, strong) NSMutableDictionary *barrageZanDictionary;
//
//- (void)changeNavigationControllerStack;
////4.0.0
//- (void)goToMyPursuedPage; //跳转我的追剧
//- (void)goMyCurrencyAccountDetailToRoot:(BOOL)toRoot; //跳转成就值账户页面
//
//- (void)goToRRDeleteUsetListViewControllerToRoot:(BOOL)toRoot;
//
//- (void)goCenterToRoot:(BOOL)toRoot;
//- (void)popToRootViewController;
//
////4.2.1
//- (void)goThirdWebViewControllerWithURL:(NSString *)URL seasonID:(NSString *)seasonID site:(NSString *)site;
//
////4.2.5
//- (void)goYoungModeVCWithModeType:(RRYoungModeVcType)rrYoungModeVcType ToRoot:(BOOL)toRoot;
//
//- (void)goYoungModePasswordVCWithType:(RRPasswordType)rrPasswordType lastPassword:(NSString *)lastPassword ToRoot:(BOOL)toRoot ;
//
////4.2.9新版签到页
//- (void)goCheckinPageToRoot:(BOOL)toRoot;
//
////4.3.1安利主页
//- (void)goAmwayToRoot:(BOOL)toRoot;
////4.3.1跳转我的收藏页面
//- (void)goToMyCollectionContentPageToRoot:(BOOL)toRoot;
//
//// 4.3.6 我的等级改到Activity_ViewController
//- (void)goMyLevel;
//// 4.5 会员支付页  APP内统一改用到 goCenterToRoot 方法    之后goVipPayToRoot 仅提供入口给h5使用
//- (void)goVipPayToRoot:(BOOL)toRoot;
//// present 会员页面
//- (void)presentVipCenter;
//// 5.7 人人视频VIP等级规则
//- (void)goVipLevelRulesUrlToRoot:(BOOL)toRoot;
//// 5.7 人人视频VIP等级体系
//- (void)goVipLevelHomeUrlToRoot:(BOOL)toRoot;
//// 4.5新的成就页
//- (void)goAchievementToRoot:(BOOL)toRoot;
//// 会员购买恢复
//- (void)goVipPayRestore:(BOOL)toRoot;
//
////4.7投屏搜索页
//- (void)goLeBoSearchVCWithVideoName:(NSString *)videoName videoId:(NSString *)videoId seasonId:(NSString *)seasonId;
//- (void)goLeboHelpVCToRoot:(BOOL)toRoot;
//
////4.10 进入剧集一起看
//- (void)goSeasonLiveRoom:(NSString *)roomId roomModel:(RRSeriesLiveRoomModel *)roomModel toRoot:(BOOL)toRoot;
//
////4.13 快看增加曝光入口 搜索结果
//- (void)goAmwayToSearchResult:(BOOL)toRoot;
////大家都在看
//- (void)goAmwayVideoEveryBodyToRoot:(BOOL)toRoot section:(NSInteger)section row:(NSInteger)row array:(NSArray *)array currentPage:(NSInteger)currentPage total:(NSInteger)total isEnd:(BOOL)isEnd delegate:(id)delegate pageSource:(NSDictionary *)pageSource;
////演员视频，演员动态
//- (void)goAmwayVideoActorToRoot:(BOOL)toRoot section:(NSInteger)section row:(NSInteger)row array:(NSArray *)array pageSource:(NSDictionary *)pageSource;
////快看卡片跳转剧集详情
//- (void)amwayVideoSeasonDetailWithSeasonId:(NSString *)seasonId amwayVideoTitle:(NSString *)amwayVideoTitle  amwayVideoId:(NSString *)amwayVideoId isMovie:(BOOL)isMovie toRoot:(BOOL)toRoot;
//
////当前是否在展示登录页面
//- (BOOL)currentShowLoginPage;
////当前是否登录弹窗展示中
//- (BOOL)currentShowAlertLoginPage;
//
////跳转到下载页面
//- (void)pushToDownloadViewController:(UIViewController *)next animated:(BOOL)animated;
//
////排行榜 总榜
//- (void)goAllRankingToRoot:(BOOL)toRoot;
//
///**
// 首页信息流跳转快看
// */
//- (void)goRankList:(NSString *)sectionId seriesId:(NSString *)seriesId  toRoot:(BOOL)toRoot;
//
//- (void)goAmwayRecommendedListWithActorId:(NSString *)actorId dramaId:(NSString *)dramaId videoId:(NSString *)videoId communityHome:(BOOL)communityHome toRoot:(BOOL)toRoot;
//
////影人主页//影人介绍
//- (void)goActorWithActorId:(NSString *)actorId actorName:(NSString *)actorName mainActor:(BOOL)mainActor toRoot:(BOOL)toRoot;
///**
// 跳转到用户编辑页面
// */
//- (void)pushToUserEditController;
//
////运营位
//- (void)goOperatePositionDetail: (NSString *)url;
//
//- (void)releaseLoginBlock;
//
//- (void)goCommunityTab;
//
////创建片单
//- (void)goCreateSheet:(BOOL)toRoot;
//
//- (void)goCreateSheetWithId:(NSString *)Id model:(RRCreateSheetModel *)model toRoot:(BOOL)toRoot withBlock:(void(^)(void))block;
////创建影评
//- (void)goFilmReviewWithSeasonId:(NSString *)seasonId model:(RRSeniorCommentsModel *)model delegate:(id)delegate toRoot:(BOOL)toRoot;
////话题列表
//- (void)goCommunityTalkList:(BOOL)toRoot;
////影视组件(推荐)二级页面
//- (void)goVideoRecommendListWithSectionId:(NSString *)sectionId title:(NSString *)title  toRoot:(BOOL)toRoot;
@end
