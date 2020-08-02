//
//  PLUPersonalHomePageView.h
//  TGA
//
//  Created by plu on 16/9/23.
//  Copyright © 2016年 developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLUPersonalHomePageHeaderView.h"
#import "PLUPersonalHomePageSubscribeCell.h"
#import "PLUPersonalInfoModel.h"
#import "PLUMySubscriptionModel.h"
#import "PLURoomTaskModel.h"
#import "LZSNBookResponseModel.h"

typedef NS_ENUM(NSInteger,PLUPersonalItemType) {

    PLUPersonalItemType_userSubscribe,//我的关注
    PLUPersonalItemType_userTask,//我的任务
    PLUPersonalItemType_userReact,//直播商城
    PLUPersonalItemType_userWatchHistory,//观看记录
    PLUPersonalItemType_userPlayRemind,//开播提醒
    PLUPersonalItemType_userPackage,//我的包裹
    PLUPersonalItemType_userAccount,//我的账户
    PLUPersonalItemType_userTickerExchange,//礼券兑换
    PLUPersonalItemType_userGuess,//我的竞猜
    PLUPersonalItemType_userAuthentication,//实名认证
    PLUPersonalItemType_userGameCenter,//游戏中心
    PLUPersonalItemType_userActivityCenter,//活动中心
    PLUPersonalItemType_userSetting,//设置
    PLUPersonalItemType_userMedal,//我的勋章
    PLUPersonalItemType_userFlowcard,//免流量观看
    PLUPersonalItemType_userGrade,//我的等级
    PLUPersonalItemType_userSNBook,//苏宁悦读
};

@interface PLUPersonalItemModel : NSObject
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * imageNamed;
@property (nonatomic, assign) PLUPersonalItemType type;
@property (nonatomic, assign) BOOL hiddeCell;

+(instancetype)modelWithType:(PLUPersonalItemType)type;

@end


@protocol PLUPersonalHomePageViewDelegate <NSObject>
@optional
-(void)userSubscribe:(PLURelationshipUserModel *)subscribeModel;

-(void)userLogin;
-(void)userRegister;
-(void)userMessage;
-(void)userInfo;
-(void)userSign;
-(void)userNoble;
-(void)userGrade;
-(void)ecologyGrade;
-(void)userRecharge;

-(void)userSubscribe;
-(void)userTask;
-(void)userAccount;
-(void)userTickerExchange;
-(void)userWatchHistory;
-(void)userPlayRemind;
-(void)userPackage;
-(void)userAuthentication;
-(void)userGameCenter;
-(void)userDownloadApp;
-(void)userSetting;
-(void)userReact;
-(void)tapUserIcon;
-(void)activityCenter;
-(void)userPersonHomePage;
-(void)userClickInvisibleSwitch;
-(void)userMedal;
-(void)userFlowcard;
-(void)userGuess;

-(void)userSNBookWithUrlString:(NSString*)urlString;
@end

@interface PLUPersonalHomePageView : UIView<UITableViewDelegate,UITableViewDataSource,PLUUserInfoViewDelegate,PLUPersonalSubscribeCollectionViewDelegate,PLUPersonalHomePageHeaderViewDelegate,PLUUserInfoViewDelegate,PLUMySubcribleCellDelegate>

@property(nonatomic, copy)  NSArray *subscribeDataSource;

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) PLUPersonalHomePageHeaderView *headerView;

@property(nonatomic,weak) id<PLUPersonalHomePageViewDelegate,PLUMySubcribleCellDelegate> delegate ;
@property(strong, nonatomic) PLUPersonalInfoModel *personalInfoModel;

@property(nonatomic,assign) BOOL personalGameRedDot;
@property(nonatomic,strong) PLURoomTaskTabModel *noviceTaskModel;

@property (nonatomic, assign) BOOL showUserTask;;//是否存在我的任务cell；

@property (nonatomic, assign) BOOL showFlowcardNewLogo;
//苏宁读书
@property(strong, nonatomic)LZSNBookModel *bookModel;

- (void)setMessagesBtnImage;

- (void)reloadData; 

@end
