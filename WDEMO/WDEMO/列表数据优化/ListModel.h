//
//  ListModel.h
//  WDEMO
//
//  Created by WDEMO on 2020/8/10.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ListModelType) {
    ListModelTypeNone = 0,
    ListModelTypeTagList1,
    ListModelTypeTagList2,
    ListModelType3DTouch,//3DTouch
    ListModelTypeSystemAlter,//SystemAlter
    ListModelTypeTableView,
    ListModelTypeVerticalCollectionView,//垂直网格
    ListModelTypeHorizontalCollectionView,//水平网格
    ListModelTypePassValue,//传值
    ListModelTypeLanguage,//语言切换
    ListModelTypeFont,//字体
    ListModelTypeTwoCollectionList,//上下一对一联动的Collection 
    ListModelTypeCrash,//点击直接崩溃  appdelegat中打开方法，抓取崩溃信息 
    ListModelTypeChat,//直播聊天页面
    ListModelTypeYYText,//YYText富文本
    ListModelTypeMask,//遮罩
    ListModelTypeAttributedText,//系统富文本
    ListModelTypeIsEqual,//判断对象是否相等
    ListModelTypeDestroyAccount,//用户注销
    ListModelTypeReactiveObjC,//RAC
    ListModelTypeReactiveObjCLogin,//RAC Login
    ListModelTypeScore,//评分只是展示
    ListModelTypeListEdit,//列表编辑
    ListModelTypeSearch,//搜索
    ListModelTypeWebView,//网页
    ListModelTypeArchiver,//归档解档
    
    ListModelTypePageController,//app首页
    ListModelTypePersonalHomePage,//个人主页
    ListModelTypeActorHomePage,//个人主页

    ListModelTypeNewHandGuide,//新手引导（某个页面的新手引导）
//    ListModelTypeLoadingView,
//    ListModelTypeBanner,
    
    ListModelTypeComment,//评论
    ListModelTypeMessageComment,//我的消息评论详情
    ListModelTypeDramaComment,//影视评论，影评
    ListModelTypeVideoComment,//短视频评论
    ListModelTypeTalk,//话题
    
    ListModelTypeZZStar,//评分打分
    
    ListModelTypeBanner,//广告banner无限滚动
    
    ListModelTypeAllRanking,//排行榜
    
    ListModelTypeSerachHistoryWord,//搜索历史词
    
    ListModelTypeExchangeBox,//多个头列表 换箱子

    ListModelTypeTest,//测试页面
};

NS_ASSUME_NONNULL_BEGIN

@interface ListModel : NSObject
@property (nonatomic, copy) NSString *ids;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, assign) ListModelType type;
@property (nonatomic, assign) BOOL isSelected;//被选中状态

+ (instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail type:(ListModelType)type ids:(NSString *)ids;
+ (instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail type:(ListModelType)type;
@end

NS_ASSUME_NONNULL_END
