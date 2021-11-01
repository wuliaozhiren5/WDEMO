//
//  RRHomeChannelModel.h
//  NJVideo
//
//  Created by LZR on 2021/1/11.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "RRBaseModel.h"
//#import "V3_AdModel.h"
//#import "NewRingModel.h"

NS_ASSUME_NONNULL_BEGIN
//extern NSString *const kRRSectionTypeVideo;
//extern NSString *const kRRSectionTypeVideoAuto;
//extern NSString *const kRRSectionTypeMagicCube;
//extern NSString *const kRRSectionTypeSheet;
//extern NSString *const kRRSectionTypeMutiImage;
//extern NSString *const kRRSectionTypeSingleImage;
//extern NSString *const kRRSectionTypeRankList;
//extern NSString *const kRRSectionTypeAD;
//extern NSString *const kRRSectionTypeINFO_FLOW;
//
//extern NSString *const kRRSectionDisplayTypePlain;
//extern NSString *const kRRSectionDisplayTypeSlide;
//
//@protocol RRHomeChannelSectionModel <NSObject>
//
//@property (nonatomic, copy) NSString *display;
//
//@property (nonatomic, copy) NSString *sectionType;
//
//@property (nonatomic, assign) BOOL displayTitle;
//
//@property (nonatomic, copy) NSString *moreText;
//
//@property (nonatomic, copy) NSString *name;
//
//@property (nonatomic, copy) NSString *targetId;
//
//@end
//
//@interface RRPlotTypeListItemModel : RRBaseModel
////剧集类别    TV：电视剧   VARIETY：综艺   DOCUMENTARY：纪录片   COMIC： 动漫   MOVIE： 电影  MINISERIES ： 迷你剧   SETI ： 网剧   TALK： 脱口秀
//@property (nonatomic, copy) NSString *dramaType;
//
//@property (nonatomic, copy) NSString *score;
//
//@end
//
//@interface RRImageModel : NSObject
//
//@property (nonatomic, copy) NSString *url;
//@property (nonatomic, assign) CGFloat width;
//@property (nonatomic, assign) CGFloat height;
//
//@end
//
//@interface RRRecommendSeasonModel : RRBaseModel<RRViewBindingCellModel>
//
//@property (nonatomic, copy) NSString *dramaType;
//@property (nonatomic, copy) NSString *title;
//@property (nonatomic, copy) NSString *dramaId;
//@property (nonatomic, copy) NSString *subTitle;
//@property (nonatomic, assign) CGFloat score;
//@property (nonatomic, copy) NSString *feeMode;
//@property (nonatomic, assign) BOOL favorite;
//@property (nonatomic, strong) RRImageModel *image;
//
//@end
//
//@interface RRRecommendLookVideoModel : RRBaseModel<RRViewBindingCellModel>
//
//@property (nonatomic, copy) NSString *ID;
//@property (nonatomic, copy) NSString *title;
//@property (nonatomic, copy) NSString *dramaId;
//@property (nonatomic, copy) NSString *actorId;
//@property (nonatomic, assign) NSInteger videoDuration;
//@property (nonatomic, strong) RRImageModel *image;
//@property (nonatomic, assign) NSInteger likeCount;
//@property (nonatomic, assign) NSTimeInterval createTime;
//
//@end
//
//@interface RRRecommendFeedListModel : RRBaseModel
//
//@property (nonatomic, copy) NSString *type;
//@property (nonatomic, strong) RRRecommendLookVideoModel *lookVideo;
//@property (nonatomic, strong) RRRecommendSeasonModel *season;
//
//@end
//
//@interface RRRecommendFeedSectionModel : RRBaseModel<RRHomeChannelSectionModel>
//
//@property (nonatomic, copy) NSString *ID;
//
//@property (nonatomic, copy) NSString *display;
//
//@property (nonatomic, copy) NSString *moreText;
//
//@property (nonatomic, copy) NSString *name;
//
//@property (nonatomic, copy) NSString *position;
//
//@property (nonatomic, copy) NSString *sectionType;
//@property (nonatomic, copy) NSString *cellType;
//
//@property (nonatomic, copy) NSString *sequence;
//
//@property (nonatomic, copy) NSString *targetId;
//
//@property (nonatomic, copy) NSString *targetType;
//
//@property (nonatomic, assign) BOOL displayTitle;
//
//@property (nonatomic, copy) NSArray <RRRecommendFeedListModel*> *sectionContents;
//
//@end
//
//@interface RRSeriesItemModel : RRBaseModel<RRViewBindingCellModel,RRReccommendSourceModel>
//
//@property (nonatomic, copy) NSString *coverUrl;
////剧id
//@property (nonatomic, copy) NSString *dramaId;
////标题
//@property (nonatomic, copy) NSString *title;
////副标题
//@property (nonatomic, copy) NSString *subTitle;
////得分
//@property (nonatomic, copy) NSString *score;
////计费类型：免费free, 限免restriction, 会员vip, 点播dibbling, 无notdefined, 超前点播advanceDibbling
//@property (nonatomic, copy) NSString *feeMode;
////年份
//@property (nonatomic, copy) NSString *year;
////地区列表
//@property (nonatomic, copy) NSArray *areaList;
////剧情类别列表
//@property (nonatomic, copy) NSArray *plotTypeList;
///**
// 剧集类别
// TV：电视剧
// VARIETY：综艺
// DOCUMENTARY：纪录片
// COMIC： 动漫
// MOVIE： 电影
// MINISERIES ： 迷你剧
// SETI ： 网剧
// TALK： 脱口秀
// */
//@property (nonatomic, copy) NSString *dramaType;
//
////演员列表
//@property (nonatomic, copy) NSArray *actorList;
////导演列表
//@property (nonatomic, copy) NSArray *directorList;
//
//@property (nonatomic, assign) BOOL favorite;
//
//
////推荐参数
//@property (nonatomic, copy) NSString *itemType;
//@property (nonatomic, copy) NSString *recomTraceId;
//@property (nonatomic, copy) NSString *recomTraceInfo;
//
////样式：SLIDE：横滑，SCROLL：平铺
//@property (nonatomic, copy) NSString *display;
//
//@property (nonatomic, copy) NSString *createTime;
//
//@property (nonatomic, copy) NSString *updateTime;
////评分字符串
//@property (nonatomic, copy) NSString *scoreStr;
//
//@end
//
//@interface RRVideoSectionModel : RRBaseModel<RRHomeChannelSectionModel>
//
//@property (nonatomic, copy) NSString *ID;
//
//@property (nonatomic, copy) NSString *display;
//
//@property (nonatomic, copy) NSString *moreText;
//
//@property (nonatomic, copy) NSString *name;
//
//@property (nonatomic, copy) NSString *position;
//
//@property (nonatomic, copy) NSString *sectionType;
//
//@property (nonatomic, copy) NSString *sequence;
//
//@property (nonatomic, copy) NSString *targetId;
//
//@property (nonatomic, copy) NSString *targetType;
//
//@property (nonatomic, assign) BOOL displayTitle;
//
//@property (nonatomic, copy) NSArray <RRSeriesItemModel*> *sectionContents;
//
//@property (nonatomic, assign) NSUInteger cursor;
//
//@property (nonatomic, assign) CGPoint scrollOffset;
//
//@property (nonatomic, assign) BOOL isChanging;
//
//@end
//
//@interface RRSectionContextsItemModel : V3_AdModel<RRViewBindingCellModel>
//
////@property (nonatomic, copy) NSString *ID;
//////标题
////@property (nonatomic, copy) NSString *title;
////副标题
////@property (nonatomic, copy) NSString *subTitle;
////图片URL
//@property (nonatomic, copy) NSString *icon;
////跳转页面
////@property (nonatomic, copy) NSString *targetType;
////调整id
//@property (nonatomic, copy) NSString *targetId;
////排列顺序
//@property (nonatomic, copy) NSString *orderNum;
////组件id
//@property (nonatomic, copy) NSString *sectionId;
////关联内容数
//@property (nonatomic, copy) NSString *relevanceCount;
////片单背景色
//@property (nonatomic, copy) NSString *color;
//
//@property (nonatomic, copy) NSString *createTime;
//
//@property (nonatomic, copy) NSString *updateTime;
////系列id
//@property (nonatomic, copy) NSString *seriesId;
//
//@property (nonatomic, copy) NSString *feeMode;
//
//@property (nonatomic, copy) NSString *score;
//
//@property (nonatomic, copy) NSString *sectionType;
//
//@property (nonatomic, copy) NSString *pid;
//
////@property (nonatomic, copy) NSString *sdktype;
//
//@property (nonatomic, copy) NSArray <RRSeriesItemModel*> *series;
//
//@property (nonatomic, copy) NSString *favorite;
//
////样式：SLIDE：横滑，SCROLL：平铺
//@property (nonatomic, copy) NSString *display;
//
//@end
//
//@interface RRHomeChannelSectionModel : RRBaseModel<RRViewBindingSectionModel,RRHomeChannelSectionModel>
//
//@property (nonatomic, copy) NSString *ID;
//
////样式：SLIDE：横滑，SCROLL：平铺
//@property (nonatomic, copy) NSString *display;
//
////副标题
//@property (nonatomic, copy) NSString *moreText;
//
////名称
//@property (nonatomic, copy) NSString *name;
//
////所属页面：精选：18，美剧,11，英剧：19，韩剧：14，日剧：12，泰剧：13，国产剧：17，新人：21，会员：22，我的：23
//@property (nonatomic, copy) NSString *position;
//
//
///*
// VIDEO              影视组件（支持平铺与横滑）
// VIDEO_AUTO         影视数据自动（支持平铺与横滑）
// MAGIC_CUBE         魔方组件（支持平铺）
// SHEET              片单组件（支持平铺与横滑）
// TOP                榜单组件（支持横滑）
// SINGLE_IMAGE       单图组件（支持平铺）
// MULTI_IMAGE        多图组件（支持平铺与横滑）
// BEAN               小豆干 （仅首页，和banner一起展示）
// INFO_FLOW          信息流（剧集、电影、快看）合并进行瀑布流展示
//*/
//@property (nonatomic, copy) NSString *sectionType;
//
////排列序号
//@property (nonatomic, copy) NSString *sequence;
//
////跳转id
//@property (nonatomic, copy) NSString *targetId;
//
////跳转页面
//@property (nonatomic, copy) NSString *targetType;
//
////是否展示标题
//@property (nonatomic, assign) BOOL displayTitle;
//
//@property (nonatomic, copy) NSString *createTime;
//
//@property (nonatomic, copy) NSString *updateTime;
//
//@property (nonatomic, copy) NSArray <RRSectionContextsItemModel *>*sectionContents;
//
//@property (nonatomic, assign) CGPoint scrollOffset;
//@end
//
//typedef NS_ENUM(NSUInteger, RRHomeChannelGuessFavoriteDataType) {
//    RRHomeChannelGuessFavoriteDataTypeAPI,
//    RRHomeChannelGuessFavoriteDataTypeCache,
//    RRHomeChannelGuessFavoriteDataTypeRecommend,
//};
//
//@interface RRHomeChannelModel : RRBaseModel
//
//@property (nonatomic, copy) NSArray *sections;
//@property (nonatomic, strong) RRHomeChannelSectionModel *bean;
//@property (nonatomic, copy) NSArray<NewRingModel *> *bannerTop;
//@property (nonatomic, strong) RRVideoSectionModel *guessFavorite;
//@property (nonatomic, assign) BOOL isEnd;
//
//@property (nonatomic, copy) NSArray<NewRingModel *> *allBanners;
//@property (nonatomic, assign) RRHomeChannelGuessFavoriteDataType guessFavoriteDataType;
//
//@property (nonatomic, strong) NSMutableArray *dataList;
//
//@end

//new
@interface RRHomeChannelModel : NSObject

@end

@interface RRSeriesItemModel : NSObject

@property (nonatomic, copy) NSString *coverUrl;
//剧id
@property (nonatomic, copy) NSString *dramaId;
//标题
@property (nonatomic, copy) NSString *title;
//副标题
@property (nonatomic, copy) NSString *subTitle;
//得分
@property (nonatomic, copy) NSString *score;
//计费类型：免费free, 限免restriction, 会员vip, 点播dibbling, 无notdefined, 超前点播advanceDibbling
@property (nonatomic, copy) NSString *feeMode;
//年份
@property (nonatomic, copy) NSString *year;
//地区列表
@property (nonatomic, copy) NSArray *areaList;
//剧情类别列表
@property (nonatomic, copy) NSArray *plotTypeList;
/**
 剧集类别
 TV：电视剧
 VARIETY：综艺
 DOCUMENTARY：纪录片
 COMIC： 动漫
 MOVIE： 电影
 MINISERIES ： 迷你剧
 SETI ： 网剧
 TALK： 脱口秀
 */
@property (nonatomic, copy) NSString *dramaType;

//演员列表
@property (nonatomic, copy) NSArray *actorList;
//导演列表
@property (nonatomic, copy) NSArray *directorList;

@property (nonatomic, assign) BOOL favorite;


//推荐参数
@property (nonatomic, copy) NSString *itemType;
@property (nonatomic, copy) NSString *recomTraceId;
@property (nonatomic, copy) NSString *recomTraceInfo;

//样式：SLIDE：横滑，SCROLL：平铺
@property (nonatomic, copy) NSString *display;

@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, copy) NSString *updateTime;
//评分字符串
@property (nonatomic, copy) NSString *scoreStr;

@end

NS_ASSUME_NONNULL_END
